import 'package:marta_technical_test/src/domain/entities/SearchCity.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherData.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherForecast.dart';

abstract class HomePageRepository {
  Future<WeatherData?> getWeatherData(String latitude, String longitude);
  Future<WeatherForecast?> getWeatherForecast(
      String latitude, String longitude);
  Future<List<CityLocation>> getCityLocation(String cityName);
}
