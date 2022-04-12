import 'package:cached_network_image/cached_network_image.dart';
import 'package:machine_test/resources/resources.dart';
import 'package:flutter/material.dart';

class GenericWidgets {
  static buildCircularProgressIndicator() {
    return Center(
        child: Image.asset(AppIcons.loaderGif, width: 90, height: 90));
  }

  static buildCachedNetworkImage({String? imageURL,
    required double height,
    required double width,
    BoxFit? boxFit}) {
    if (imageURL != null && imageURL.isNotEmpty)
      return CachedNetworkImage(
          fadeInCurve: Curves.easeIn,
          fadeOutCurve: Curves.easeOut,
          fadeInDuration: Duration(milliseconds: 100),
          fadeOutDuration: Duration(milliseconds: 100),
          imageUrl: imageURL,
          height: height,
          width: width,
          fit: boxFit != null ? boxFit : BoxFit.contain,
          errorWidget: (context, url, err) => Icon(Icons.error));

    return Container(width: width, height: height);
  }

}
