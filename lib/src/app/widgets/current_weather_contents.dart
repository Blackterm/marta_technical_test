import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marta_technical_test/src/app/widgets/weather_icon_image.dart';

// ignore: must_be_immutable
class CurrentWeatherContents extends StatelessWidget {
  CurrentWeatherContents({
    Key? key,
    required this.iconUrl,
    required this.temp,
    required this.description,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
  }) : super(key: key);
  final String iconUrl;
  late var temp;
  final String description;
  late var minTemp;
  late var maxTemp;
  late var windSpeed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final highAndLow = 'H:$maxTemp° L:$minTemp°';
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: iconUrl, size: 120),
        Text(temp, style: textTheme.displayMedium),
        Text(description.toUpperCase(), style: textTheme.bodyLarge),
        Text(highAndLow, style: textTheme.bodyLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              width: 2,
            ),
            Text(' = ${windSpeed}', style: textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
