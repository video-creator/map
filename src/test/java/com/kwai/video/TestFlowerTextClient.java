package com.kwai.video;

import com.google.protobuf.util.JsonFormat;
import com.kuaishou.api.blobstore.BlobStoreKey;
import com.kuaishou.api.blobstore.BS3ApiBlobStore;
import com.kuaishou.video.mps.action.MinecraftFlowParam;
import com.kuaishou.video.mps.api.JobApi;
import com.kuaishou.video.mps.api.JobConfig;
import com.kuaishou.video.mps.common.JobAction;
import com.kuaishou.video.mps.common.PriorityLevel;
import com.kwai.draft.common.BlobStoreUtils;
import com.kwai.draft.common.OutputConfig;
import com.kwai.draft.common.ProjectInfoOut;
import com.kwai.draft.common.asset.*;
import com.kwai.mc.composite.model.ProjectComposite;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import static com.kuaishou.api.blobstore.BlobStoreTable.EDITOR_SDK_SPLIT_TRANSCODE;

/**
 * 花字视频合成测试 - 替换营业喵为新的dynamic-normal
 * 前置条件：先运行 TestUploadFlowerFiles 上传素材文件
 */
public class TestFlowerTextClient {

    private static final String[][] ALL_FLOWERS = {
            {"花字测试最终版", "flower1.zip", TestUploadFlowerFiles.FLOWER1_KEY},
            {"dynamic-normal", "dynamic_normal.zip", TestUploadFlowerFiles.FLOWER_DYNAMIC_NORMAL_KEY},
            {"蓝白花字",      "static_bluewhite.zip", TestUploadFlowerFiles.FLOWER_STATIC_KEYS[4]},
    };


    public static void main(String[] args) throws Exception {
        testFlowerTextCompose();
    }

    public static void testFlowerTextCompose() throws Exception {
        // Step 1: 准备输入素材
        Map<String, BlobStoreKey> inputFiles = new HashMap<>();

        inputFiles.put("1004.mp4", EDITOR_SDK_SPLIT_TRANSCODE.key(TestUploadFlowerFiles.VIDEO_KEY));
        inputFiles.put("f-4838.ttf", EDITOR_SDK_SPLIT_TRANSCODE.key(TestUploadFlowerFiles.FONT_KEY));

        for (String[] flower : ALL_FLOWERS) {
            inputFiles.put(flower[1], EDITOR_SDK_SPLIT_TRANSCODE.key(flower[2]));
        }

        // Step 2: 构建剪辑工程
        AssetProjectMaker maker = new AssetProjectMaker();
        AssetStructManger videoAssets = new AssetStructManger();
        AssetStructManger compTextAssets = new AssetStructManger();

        OutputConfig config = new OutputConfig();
        config.setWidth(1080);
        config.setHeight(1920);
        config.setFrameRate(30);
        config.setVideoBitrate(8000000);
        config.addFontId2PathMapping("1", "f-4838.ttf");

        double totalDuration = 10;
        AssetStruct.VideoAssetStruct video = new AssetStruct.VideoAssetStruct();
        video.setClipRange(0, totalDuration);
        video.setDisplayRange(0, totalDuration);
        video.setDuration(totalDuration);
        video.setAssetName("1004.mp4");
        video.setVolume(1.0f);
        video.setSpeed(1.0);
        videoAssets.addAssetStruct(video);

        // 3 个花字，从上到下均匀分布
        int count = ALL_FLOWERS.length;
        for (int i = 0; i < count; i++) {
            String[] flower = ALL_FLOWERS[i];
            double posY = 8 + (84.0 / (count - 1)) * i;
            double fontSize = 28;
            compTextAssets.addAssetStruct(buildFlowerText(
                    totalDuration, 50, posY, fontSize,
                    flower[0], flower[1],
                    0.5, true, 0.07,
                    AssetStruct.TextAlignType.TEXT_ALIGN_TYPE_CENTER, 0, 1.0));
        }

        maker.setVideoAssets(videoAssets);
        maker.setCompTextAssets(compTextAssets);
        maker.setOutputConfig(config);

        // Step 3: 构建 project 并上传
        ProjectInfoOut projectInfo = maker.build();

        ProjectComposite.ProjectCompositeInstruction instruction =
                ProjectComposite.ProjectCompositeInstruction.newBuilder()
                        .mergeFrom(projectInfo.instruction())
                        .setSegmentMaxDuration(10)
                        .setVideoRenderType(ProjectComposite.CompositeRenderType.RENDER_TYPE_UNKNOWN)
                        .build();

        BlobStoreKey projectBBK = EDITOR_SDK_SPLIT_TRANSCODE.key(UUID.randomUUID().toString());
        BS3ApiBlobStore.saveFile(projectBBK, projectInfo.projectModel().toByteArray(), true);
        inputFiles.put(instruction.getProjectPath(), projectBBK);

        // Step 4: 提交合成任务
        BlobStoreKey outputFile = EDITOR_SDK_SPLIT_TRANSCODE.key(
                "flower_test_output_" + UUID.randomUUID().toString() + ".mp4");

        String instructionJson = JsonFormat.printer().printingEnumsAsInts().print(instruction);
        System.out.println("=== 花字数量: " + count + " ===");

        MinecraftFlowParam param = MinecraftFlowParam.builder()
                .projectCompositeInstruction(instructionJson)
                .inputFileMap(BlobStoreUtils.blobKeyMapToInputFileMap(inputFiles))
                .outputFile(BlobStoreUtils.blobStoreKeyToOutputFile(outputFile))
                .build();

        JobApi jobApi = JobApi.getInstance("dev");
        String jobId = jobApi.submitJob(JobAction.MINECRAFT_FLOW, param,
                JobConfig.builder().priorityLevel(PriorityLevel.HIGH_PRIORITY).build());
        System.out.println("=== 任务已提交，jobId: " + jobId + " ===");
    }

    private static AssetStruct.CompTextAssetStruct buildFlowerText(
            double duration, double posX, double posY, double fontSize,
            String text, String flowerZipKey,
            double docWidth, boolean hadAdjustMaxWidth, double currentScale,
            AssetStruct.TextAlignType align,
            double letterSpacePx, double lineSpace) {

        AssetStruct.CompTextAssetStruct asset = new AssetStruct.CompTextAssetStruct();
        asset.setDisplayRange(0, duration);
        asset.setDuration(duration);
        asset.setZOrder(3);

        AssetStruct.Transform transform = new AssetStruct.Transform();
        transform.setPositionXWithLetterSpacePx(posX, 0);
        transform.setY(posY);
        transform.setFontSizePx(fontSize);
        transform.setRotate(0);

        AssetStruct.KeyFrame keyFrame = new AssetStruct.KeyFrame();
        keyFrame.setStartTime(0);
        keyFrame.setTransform(transform);
        asset.addKeyFrame(keyFrame);

        AssetStruct.CompTextInfo compInfo = new AssetStruct.CompTextInfo();
        AssetStruct.CompTextLayerInfo layerInfo = new AssetStruct.CompTextLayerInfo();
        AssetStruct.TextInfo textInfo = new AssetStruct.TextInfo();

        textInfo.setTextColor(0xffffffff);
        textInfo.setText(text);
        textInfo.setFontId("1");
        textInfo.setScale(1);
        textInfo.setAlignType(align);
        textInfo.setAutoWrap(new AssetStruct.AutoWrap(hadAdjustMaxWidth, currentScale, docWidth));
        textInfo.setLetterSpacePxWithFontSize(letterSpacePx, fontSize);
        textInfo.setLineSpace(lineSpace);
        textInfo.setThickness(false);
        textInfo.setItalic(false);
        textInfo.setUnderline(false);
        textInfo.setLinethrough(false);

        // 所有花字都通过 compInfo.textResource 传资源
        compInfo.setTextResource(new AssetStruct.TextResource(8363, 2, flowerZipKey));

        layerInfo.setTextInfo(textInfo);
        compInfo.addCompTextLayerInfo(layerInfo);
        asset.setCompInfo(compInfo);
        return asset;
    }
}