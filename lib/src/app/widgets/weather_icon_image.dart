import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({Key? key, required this.iconUrl, required this.size})
      : super(key: key);
  final String iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://openweathermap.org/img/wn/${iconUrl}@2x.png",
      width: size,
      height: size,
    );
  }
}
