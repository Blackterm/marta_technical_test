import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:marta_technical_test/src/domain/entities/SearchCity.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherData.dart';
import 'package:marta_technical_test/src/domain/entities/WeatherForecast.dart';
import 'package:marta_technical_test/src/domain/repositories/home_page_repository.dart';
import 'package:marta_technical_test/src/domain/usecases/get_city_location.dart';
import 'package:marta_technical_test/src/domain/usecases/get_weather_data.dart';
import 'package:marta_technical_test/src/domain/usecases/get_weather_forecast.dart';

class HomePresenter extends Presenter {
  late Function getWeatherDataOnNext;
  late Function getWeatherDataOnError;

  late Function getWeatherForecastOnNext;
  late Function getWeatherForecastOnError;

  late Function getCityLocationOnNext;
  late Function getCityLocationOnError;

  final GetWeatherData _getWeatherData;
  final GetWeatherForecast _getWeatherForecast;
  final GetCityLocation _getCityLocation;

  HomePresenter(HomePageRepository _homePageRepository)
      : _getWeatherData = GetWeatherData(_homePageRepository),
        _getWeatherForecast = GetWeatherForecast(_homePageRepository),
        _getCityLocation = GetCityLocation(_homePageRepository);

  void getWeatherData(String latitude, String longitude) {
    _getWeatherData.execute(_GetWeatherDataObserver(this),
        GetWeatherDataParams(latitude, longitude));
  }

  void getWeatherForecast(String latitude, String longitude) {
    _getWeatherForecast.execute(_GetWeatherForecastObserver(this),
        GetWeatherForecastParams(latitude, longitude));
  }

  void getCityLocation(String cityName) {
    _getCityLocation.execute(
        _GetCityLocationObserver(this), GetCityLocationParams(cityName));
  }

  @override
  void dispose() {
    _getWeatherData.dispose();
    _getWeatherForecast.dispose();
  }
}

class _GetWeatherDataObserver extends Observer<WeatherData?> {
  final HomePresenter _presenter;

  _GetWeatherDataObserver(this._presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    _presenter.getWeatherDataOnError(e);
  }

  @override
  void onNext(WeatherData? response) {
    _presenter.getWeatherDataOnNext(response);
  }
}

class _GetWeatherForecastObserver extends Observer<WeatherForecast?> {
  final HomePresenter _presenter;

  _GetWeatherForecastObserver(this._presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    _presenter.getWeatherForecastOnError(e);
  }

  @override
  void onNext(WeatherForecast? response) {
    _presenter.getWeatherForecastOnNext(response);
  }
}

class _GetCityLocationObserver extends Observer<List<CityLocation>> {
  final HomePresenter _presenter;

  _GetCityLocationObserver(this._presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    _presenter.getCityLocationOnError(e);
  }

  @override
  void onNext(List<CityLocation>? response) {
    _presenter.getCityLocationOnNext(response);
  }
}
