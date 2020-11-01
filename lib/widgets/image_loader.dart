import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ImageLoader extends StatelessWidget {
  final String url;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final BoxFit boxFit;
  final Color color;
  const ImageLoader({
    Key key,
    @required this.url,
    this.margin,
    this.boxFit = BoxFit.cover,
    this.borderRadius,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Image(
            image: imageProvider,
            fit: boxFit ?? BoxFit.cover,
            color: color,
          ),
        ),
      ),
      placeholder: (context, url) =>  Center(
        child:FlareActor(
            "assets/flares/circles_loading.flr",
            alignment:Alignment.center,
            fit:BoxFit.contain,
            animation:"loading")
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.broken_image,
          size: 28,
        ),
      ),
    );
  }
}
