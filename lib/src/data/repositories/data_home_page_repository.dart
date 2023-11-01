import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marta_technical_test/src/data/repositories/data_marta_base_repository.dart';
import 'package:marta_technical_test/src/domain/entities/SearchCity.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherData.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherForecast.dart';
import 'package:marta_technical_test/src/domain/repositories/home_page_repository.dart';

class DataHomepageRepository implements HomePageRepository {
  static final DataHomepageRepository _instance =
      DataHomepageRepository._internal();
  DataHomepageRepository._internal()
      : _dataFcTechBaseRepository = DataMartaBaseRepository();
  factory DataHomepageRepository() => _instance;
  final DataMartaBaseRepository _dataFcTechBaseRepository;

  WeatherData? _weatherData;
  WeatherForecast? _weatherForecast;
  List<CityLocation> _cityLocation = [];

  @override
  Future<WeatherData?> getWeatherData(String latitude, String longitude) async {
    try {
      http.Response response =
          await _dataFcTechBaseRepository.executeMartaRequest(
        "GET",
        "data/2.5/weather?lat=${latitude}&lon=${longitude}",
      );

      _weatherData = WeatherData.fromJson(jsonDecode(response.body));
      return _weatherData;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<WeatherForecast?> getWeatherForecast(
      String latitude, String longitude) async {
    try {
      http.Response response =
          await _dataFcTechBaseRepository.executeMartaRequest(
        "GET",
        "data/2.5/forecast?lat=${latitude}&lon=${longitude}",
      );

      _weatherForecast = WeatherForecast.fromJson(jsonDecode(response.body));
      return _weatherForecast;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<List<CityLocation>> getCityLocation(String cityName) async {
    try {
      http.Response response =
          await _dataFcTechBaseRepository.executeMartaRequest(
        "GET",
        "geo/1.0/direct?q=${cityName}&limit=1",
      );
      List jsonResponse = json.decode(response.body);
      _cityLocation = jsonResponse
          .map((currentNew) => CityLocation.fromJson(currentNew))
          .toList();
      ;

      return _cityLocation;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
