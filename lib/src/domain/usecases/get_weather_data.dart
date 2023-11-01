import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherData.dart';
import '../repositories/home_page_repository.dart';

class GetWeatherData extends UseCase<WeatherData?, GetWeatherDataParams> {
  final HomePageRepository _homePageRepository;

  GetWeatherData(this._homePageRepository);
  @override
  Future<Stream<WeatherData?>> buildUseCaseStream(
      GetWeatherDataParams? params) async {
    StreamController<WeatherData?> controller = StreamController();
    try {
      WeatherData? res = await _homePageRepository.getWeatherData(
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

class GetWeatherDataParams {
  final String latitude;
  final String longitude;

  GetWeatherDataParams(this.latitude, this.longitude);
}
