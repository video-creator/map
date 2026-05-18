import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'text_widget.dart';

enum LoadingState {
  loading,
  none
}
enum PageLoadingStyle {
  full,
  block
}

class LoadingWidget extends StatefulWidget{
  final bool clickWhenLoading; //当loading的时候，是否可以进行操作
  final Color? loadingBackColor; //loading的背景色
  final Color? loadingFrontColor; //loading动画的颜色
  final Color? loadingBlockBackColor;// loading框的背景色
  final PageLoadingStyle loadingStyle; //loading style，全屏（child 大小）,block
  final String text;// loading text
  final LoadingState state;
  final EdgeInsets? loadingBlockEdgeInsets;// loading框的insets，居中的话， 感觉有点太靠下，默认给个下40吧
  final String? loadingTextColor; //loading文字颜色
  const LoadingWidget({super.key, this.loadingStyle = PageLoadingStyle.full,
    this.clickWhenLoading = true,
    this.loadingBackColor,
    this.text = "正在加载~",
    this.state = LoadingState.loading,
    this.loadingFrontColor,
    this.loadingBlockBackColor,
    this.loadingBlockEdgeInsets,
    this.loadingTextColor
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingWidgetState();
  }
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LoadingState state = widget.state;
    Widget useWidget = noneWidget();
    switch (state) {
      case LoadingState.loading:
        useWidget = loadingWidget();
        break;
      case LoadingState.none:
        useWidget = noneWidget();
        break;
    }
    return useWidget;
  }

  Widget noneWidget(){
    return Container();
  }


  Widget loadingWidget(){
//    if(widget.loadingStyle == PageLoadingStyle.full) {
//      return Container(
//        alignment: Alignment.center,
//        color: widget.loadingBackColor == null ? Colors.white : widget.loadingBackColor,
//        child: Container(
//          width: 50,
//          height: 50,
//          child: LoadingIndicator(indicatorType: Indicator.ballPulse, color: Colors.white,),
//        ),
//      );
//    }
    return Container(
      alignment: Alignment.center,
      color: widget.loadingBackColor ,
      child: Container(
        padding: widget.loadingBlockEdgeInsets ?? const EdgeInsets.only(bottom: 40),
        child: Container(
          decoration: BoxDecoration(
            color: widget.loadingBlockBackColor ?? convertStringToColor("#000000", alpha: 0.3),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox.fromSize(
                size: const Size(50, 50),
                child: const LoadingIndicator(indicatorType: Indicator.ballPulse, colors: [Colors.white],),
//            child: CircularProgressIndicator(
////                          backgroundColor: convertStringToColor("#DA9C65"),
//              valueColor: AlwaysStoppedAnimation(convertStringToColor("#DA9C65")),
//            ),
              ),
              generateTextWidget(
                text: widget.text,
                textColor: widget.loadingTextColor ?? "#eeffffff"
              )
            ],
          ),
        ),
      ),
    );
  }
}
