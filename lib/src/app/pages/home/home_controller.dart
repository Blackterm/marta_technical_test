import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:marta_technical_test/src/app/constants/constants.dart';
import 'package:marta_technical_test/src/app/pages/home/home_presenter.dart';
import 'package:marta_technical_test/src/domain/entities/SearchCity.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherData.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherForecast.dart';
import '../../../domain/repositories/home_page_repository.dart';

class HomeController extends Controller {
  HomePresenter _presenter;

  HomeController(HomePageRepository homePageRepository)
      : _presenter = HomePresenter(homePageRepository);

  bool isWeatherDataFetched = false;
  bool isWeatherForecastFetched = false;
  bool isCityLocationFetched = false;

  WeatherData? weatherData;
  WeatherForecast? weatherForecast;
  List<CityLocation>? usersList;

  var _cityName = '';

  late String name = "";

  final String latitude = "38.72581162568715";
  final String longitude = "35.481688412688065";

  @override
  void onInitState() async {
    database.get('cityName') != null
        ? _cityName = database.get('cityName')
        : _cityName = 'Ankara';

    _presenter.getCityLocation(_cityName);
  }

  @override
  void initListeners() {
    _presenter.getWeatherDataOnNext = (WeatherData? response) async {
      if (response == null) return;

      if (!isWeatherDataFetched) {
        weatherData = response;

        refreshUI();
      }
    };

    _presenter.getWeatherForecastOnNext = (WeatherForecast? response) async {
      if (response == null) return;

      if (!isWeatherForecastFetched) {
        weatherForecast = response;

        refreshUI();
      }
    };

    _presenter.getCityLocationOnNext = (List<CityLocation>? response) async {
      if (response == null) return;
      if (response.isNotEmpty) {
        if (!isCityLocationFetched) {
          _presenter.getWeatherForecast(
              response.first.lat.toString(), response.first.lon.toString());
          _presenter.getWeatherData(
              response.first.lat.toString(), response.first.lon.toString());
          refreshUI();
        }
      }
    };

    _presenter.getWeatherDataOnError = (e) {
      print('hata');
    };
    _presenter.getWeatherForecastOnError = (e) {
      print('hata');
    };
    _presenter.getCityLocationOnError = (e) {
      print('hata');
    };
  }

  void searchCity(String cityName) {
    _presenter.getCityLocation(cityName);
    database.put('cityName', cityName);
  }
}
