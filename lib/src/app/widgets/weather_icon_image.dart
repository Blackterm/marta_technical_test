import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marta_technical_test/src/app/constants/constants.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({Key? key, required this.iconUrl, required this.size})
      : super(key: key);
  final String iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconData(iconUrl),
      width: size,
      height: size,
    );
  }
}
