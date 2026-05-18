import 'package:base_utility/utiles/type_convert.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceHolderImage extends StatelessWidget{
  final double width;
  final double height;
  final String placeHolder;
  final String imageUrl;
  final Size loadingSize;
  final String loadingColor;

  final EdgeInsets imageEdge;

  static const defaultLoadingSize = Size(20,20);

  const PlaceHolderImage(this.imageUrl,
      {super.key,  this.width =double.infinity,
        this.height =double.infinity,
        this.placeHolder ="assets/images/video_list_placeholder.png",
        this.loadingSize =defaultLoadingSize,
        this.loadingColor ="#DA9C65",
        this.imageEdge =EdgeInsets.zero,
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: placeHolder.isEmpty ? Container() : Image.asset(placeHolder),
          ),
          Positioned(
            left: imageEdge.left,
            top: imageEdge.top,
            right: imageEdge.right,
            bottom: imageEdge.bottom,
            child:  FastCachedImage(
              url: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (context, progress) {
                return Container(
                  alignment: Alignment.center,
                  child: SizedBox.fromSize(
                    size: const Size(20, 20),
                    child: CircularProgressIndicator(
//                          backgroundColor: convertStringToColor("#DA9C65"),
                      valueColor: AlwaysStoppedAnimation(convertStringToColor(loadingColor)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}