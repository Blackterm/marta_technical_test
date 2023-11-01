import 'package:flutter/material.dart';
import 'package:marta_technical_test/src/app/widgets/weather_icon_image.dart';

// ignore: must_be_immutable
class WeatherForecastWidget extends StatelessWidget {
  WeatherForecastWidget({
    Key? key,
    required this.iconUrl,
    required this.temp,
    required this.date,
  }) : super(key: key);
  final String iconUrl;
  late var temp;
  final String date;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;

    return Expanded(
      child: Column(
        children: [
          Text(
            date,
            style: textTheme.bodySmall!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          WeatherIconImage(iconUrl: iconUrl, size: 48),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
