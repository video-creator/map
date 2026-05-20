package com.kwai.video;

import com.kuaishou.api.blobstore.BS3ApiBlobStore;
import com.kuaishou.api.blobstore.BlobStoreKey;

import java.io.FileInputStream;

import static com.kuaishou.api.blobstore.BlobStoreTable.EDITOR_SDK_SPLIT_TRANSCODE;

/**
 * 上传花字测试目录下所有 zip + 白字蓝边.zip + 花字测试最终版.zip + 字体到 BlobStore
 */
public class TestUploadFlowerFiles {

    // 已上传的常量 key
    public static final String VIDEO_KEY = "flower_test_1004.mp4";
    public static final String FLOWER1_KEY = "flower_test_花字测试最终版.zip";
    public static final String FLOWER3_KEY = "flower_test_白字蓝边.zip";
    public static final String FONT_KEY = "flower_test_f-4838.ttf";

    // 新动态花字
    public static final String FLOWER_DYNAMIC_NORMAL_KEY = "flower_test_dynamic_normal.zip";

    // 花字测试目录下的文件
    public static final String[] FLOWER_DYNAMIC_KEYS = {
            "flower_test_爱心发射.zip",
            "flower_test_璀璨烟花.zip",
            "flower_test_营业喵.zip",
            "flower_test_闪闪条纹.zip",
            "flower_test_黄色星星.zip"
    };
    public static final String[] FLOWER_STATIC_KEYS = {
            "flower_test_橙黄厚描边.zip",
            "flower_test_白字绿厚钩边.zip",
            "flower_test_紫色发光.zip",
            "flower_test_红白花字.zip",
            "flower_test_蓝白花字.zip"
    };

    private static final String[] FLOWER_DYNAMIC_FILES = {
            "爱心发射.zip",
            "璀璨烟花.zip",
            "营业喵.zip",
            "闪闪条纹.zip",
            "黄色星星.zip"
    };
    private static final String[] FLOWER_STATIC_FILES = {
            "橙黄厚描边.zip",
            "白字绿厚钩边.zip",
            "紫色发光.zip",
            "红白花字.zip",
            "蓝白花字.zip"
    };

    public static void main(String[] args) throws Exception {
        String baseDir = "/Users/wangyaqiang/Downloads";

        // 上传视频
        upload(baseDir + "/1004.mp4", VIDEO_KEY);

        // 上传之前的3个花字
        upload(baseDir + "/花字测试最终版.zip", FLOWER1_KEY);
        upload(baseDir + "/花字测试.zip", "flower_test_花字测试.zip");
        upload(baseDir + "/白字蓝边.zip", FLOWER3_KEY);

        // 上传字体
        upload(baseDir + "/mvTemplateCase/f-4838.ttf", FONT_KEY);

        // 上传新动态花字(替换营业喵)
        upload("/tmp/dynamic-normal.zip", FLOWER_DYNAMIC_NORMAL_KEY);

        // 上传动态花字
        for (int i = 0; i < FLOWER_DYNAMIC_FILES.length; i++) {
            upload(baseDir + "/花字测试/动态/" + FLOWER_DYNAMIC_FILES[i], FLOWER_DYNAMIC_KEYS[i]);
        }

        // 上传静态花字
        for (int i = 0; i < FLOWER_STATIC_FILES.length; i++) {
            upload(baseDir + "/花字测试/静态/" + FLOWER_STATIC_FILES[i], FLOWER_STATIC_KEYS[i]);
        }

        System.out.println("所有文件上传完成！");
    }

    private static void upload(String filePath, String blobKeySuffix) throws Exception {
        System.out.println("上传 " + filePath + " ...");
        try (FileInputStream fis = new FileInputStream(filePath)) {
            byte[] data = new byte[fis.available()];
            fis.read(data);
            boolean result = BS3ApiBlobStore.saveFile(EDITOR_SDK_SPLIT_TRANSCODE.key(blobKeySuffix), data, true);
            System.out.println(result ? "上传完成: " + blobKeySuffix : "上传失败: " + blobKeySuffix);
        }
    }
}