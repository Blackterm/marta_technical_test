import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherForecast.dart';
import '../repositories/home_page_repository.dart';

class GetWeatherForecast
    extends UseCase<WeatherForecast?, GetWeatherForecastParams> {
  final HomePageRepository _homePageRepository;

  GetWeatherForecast(this._homePageRepository);
  @override
  Future<Stream<WeatherForecast?>> buildUseCaseStream(
      GetWeatherForecastParams? params) async {
    StreamController<WeatherForecast?> controller = StreamController();
    try {
      WeatherForecast? res = await _homePageRepository.getWeatherForecast(
          params!.latitude, params.longitude);
      controller.add(res);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class GetWeatherForecastParams {
  final String latitude;
  final String longitude;

  GetWeatherForecastParams(this.latitude, this.longitude);
}
