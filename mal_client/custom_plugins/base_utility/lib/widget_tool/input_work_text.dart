import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/material.dart';

class BottomInputTextDialog extends StatelessWidget {
  final String? placeHolder;
  final String? defaultStr;
  final Function? doneCB;
  final int maxLine;
  final double height;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  BottomInputTextDialog(
      {super.key, this.placeHolder,
      this.doneCB,
      this.defaultStr,
      this.maxLine = 10,
      this.height = 200});
  @override
  Widget build(BuildContext context) {
    if (defaultStr?.isNotEmpty ?? true) {
      controller.text = defaultStr!;
      controller.selection = TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: '$defaultStr'.length));
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            child: Container(
              color: Colors.black54,
//              height: MediaQuery.of(context).size.height,
            ),
            onTap: () {
              if (doneCB != null) {
                doneCB!(controller.text);
              }
              Navigator.pop(context);
            },
          )),

          Container(
//            alignment: Alignment.centerLeft,
            color: fromHex("#FFFCF6"),
            constraints: const BoxConstraints(
              maxHeight: 200.0,
              minHeight: 40.0,
            ),
//          height: this.height,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: fromHex("#F4EFE6"),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextField(
                        controller: controller,
                        focusNode: focusNode,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        cursorWidth: 1,
                        autofocus: true,
                        cursorColor: Colors.black45,
                        style:
                        TextStyle(fontSize: 16, color: fromHex("#5E3323")),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(0),
                          hintText: placeHolder ?? "",
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none, width: 0)),
                        ),
                        textInputAction: TextInputAction.done,
                        onSubmitted: (text) {
                          if (text.isEmpty) {
                            Navigator.pop(context);
                            return;
                          }
                          focusNode.unfocus();
                          if (doneCB != null) {
                            doneCB!(controller.text);
                          }
                          Navigator.pop(context);
                        },
                      ),
//                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (doneCB != null) {
                        doneCB!(controller.text);
                      }
                      Navigator.pop(context);
                    },
                    child: UnconstrainedBox(
                      child: Container(
                      alignment: Alignment.center,
                        width: 60,
                        child: generateTextWidget(
                            text: "保存", textColor: "#E5A82C", textSize: 16),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
