import 'package:base_utility/utiles/type_convert.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';


class LoadingImageWidget extends StatefulWidget {
  final String url;
  final Function? tapCallBack;
  final String? placeHoldImage;
  final Size? centerLoadingSize;
  final bool showLoading;
  final BoxFit boxFit;
  const LoadingImageWidget({super.key, 
    required this.url,
    this.tapCallBack,
    this.placeHoldImage,
    this.centerLoadingSize,
    this.boxFit = BoxFit.cover,
    this.showLoading = false
  }
);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingImageWidgetState();
  }
}

class _LoadingImageWidgetState extends State<LoadingImageWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (widget.tapCallBack == null ? null : (){
        if (widget.tapCallBack != null) {
          widget.tapCallBack!(this);
        }
      }) ,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: widget.url.startsWith("http") ? FastCachedImage(
          url: widget.url ?? "",
          fit: widget.boxFit,
          loadingBuilder: (context, progress) {
            return Container(
              alignment: Alignment.center,
              child :Stack(
                  children: subWidges()
              ),
            );
          },
        ) : Image.asset(widget.url,fit:widget.boxFit),
      ) ,
    ) ;
  }

  subWidges() {
    List<Widget> list = [];
    list.add(
        (widget.placeHoldImage?.isNotEmpty ?? false) ? Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(widget.placeHoldImage!),
        ) : Container()
    );
    if(widget.showLoading) {
      list.add(
          widget.centerLoadingSize == null ?
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: CircularProgressIndicator(
//                          backgroundColor: convertStringToColor("#DA9C65"),
                valueColor: AlwaysStoppedAnimation(convertStringToColor("#DA9C65")),
              ),),
          ) : Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: widget.centerLoadingSize?.width ?? 0,
              height: widget.centerLoadingSize?.height ?? 0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
//                          backgroundColor: convertStringToColor("#DA9C65"),
                valueColor: AlwaysStoppedAnimation(convertStringToColor("#DA9C65")),
              ),
            ),
          )
      );
    }
    return list;
  }

}