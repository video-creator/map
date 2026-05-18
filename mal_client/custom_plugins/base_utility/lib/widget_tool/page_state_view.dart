import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';


enum PageState {
  none,
  idle,
  error,
  empty,
  loading
}


class PageStateWidget extends StatefulWidget {
  final PageState state;
  final Widget child;
  final String emptyTips;
  final String errorTips;
  final Function? didClick;
  final Function? customEmptyWidget;
  final bool loadingFloatUp;// loading框是否在页面上显示，比如发布动态，当点击发布，出现loading，如果设置false，适用在进入页面就加载的情况，比如首页列表
  final bool clickWhenLoading; //当loading的时候，是否可以进行操作
  final Color? loadingBackColor; //loading后边整体的背景色
  final Color? loadingBlockColor; //loading框的背景色
  final Color? loadingFrontColor; //loading动画的颜色
  final PageLoadingStyle pageLoadingStyle; //loading style，全屏（child 大小）,block
  final String loadingText;
  const PageStateWidget({super.key, required this.state,
    required this.child,
    this.emptyTips = "暂无数据",
    this.errorTips = "网络加载失败,点击重试",
    this.didClick,
    this.customEmptyWidget,
    this.loadingFloatUp = false,
    this.clickWhenLoading = false,
    this.loadingBackColor,
    this.pageLoadingStyle = PageLoadingStyle.full,
    this.loadingText = "正在加载😀",
    this.loadingBlockColor,
    this.loadingFrontColor
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageStateWidgetState();
  }
}

class _PageStateWidgetState extends State<PageStateWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget getContentWidget() {
    PageState state = widget.state;
    if (state == PageState.none) {
      return widget.child;
    } else if(state == PageState.error) {
      return  GestureDetector(
        onTap: (){
          if (widget.didClick != null) {
            widget.didClick!(state);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          alignment: Alignment.center,
          child: generateTextWidget(text: widget.errorTips ?? "",textAlign: TextAlign.center),
        ),
      );
    } else if(state == PageState.empty) {
      if (widget.customEmptyWidget != null) {
        return widget.customEmptyWidget!();
      }
      return  GestureDetector(
        onTap: (){
          if (widget.didClick != null) {
            widget.didClick!(state);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          alignment: Alignment.center,
          child: generateTextWidget(text: widget.emptyTips ?? "",textAlign: TextAlign.center),
        ),
      );
    } else if(state == PageState.loading) {
      return Container(
        alignment: Alignment.center,
        child: LoadingWidget(
          loadingStyle: widget.pageLoadingStyle,
          loadingBackColor: widget.loadingBackColor,
          loadingBlockBackColor: widget.loadingBlockColor,
          loadingFrontColor: widget.loadingFrontColor,
          text: widget.loadingText,
          clickWhenLoading: widget.clickWhenLoading,
          state: widget.state == PageState.loading ? LoadingState.loading : LoadingState.none,
        ),
      );
    } else if(state == PageState.none) {
      return widget.child;
    }
    return Container();
  }

  getContentWidgetWithFloat() {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: widget.child),
        Positioned.fill(child: Offstage(
          offstage: widget.state != PageState.loading,
          child: LoadingWidget(
            loadingStyle: widget.pageLoadingStyle,
            loadingBackColor: widget.loadingBackColor,
            loadingBlockBackColor: widget.loadingBlockColor,
            loadingFrontColor: widget.loadingFrontColor,
            text: widget.loadingText,
            clickWhenLoading: widget.clickWhenLoading,
            state: widget.state == PageState.loading ? LoadingState.loading : LoadingState.none,
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.loadingFloatUp == false) {
      // TODO: implement build
      return getContentWidget();
    }
    return getContentWidgetWithFloat();
  }
}