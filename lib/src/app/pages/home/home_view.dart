import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as c;
import 'package:marta_technical_test/src/app/constants/constants.dart';
import 'package:marta_technical_test/src/app/pages/home/home_controller.dart';
import 'package:marta_technical_test/src/app/widgets/city_search_box.dart';
import 'package:marta_technical_test/src/app/widgets/current_weather_contents.dart';
import 'package:marta_technical_test/src/app/widgets/weather_forecast_item.dart';
import 'package:marta_technical_test/src/data/repositories/data_home_page_repository.dart';
import 'package:intl/intl.dart';

class HomeView extends c.View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController(DataHomepageRepository()));
  }
}

class _HomeViewState extends c.ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);
  final items = [0, 8, 16, 24, 32];
  @override
  Widget get view {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        key: globalKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: rainGradient,
            ),
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Column(
              children: [
                c.ControlledWidgetBuilder<HomeController>(
                  builder: (context, controller) {
                    return controller.weatherData != null
                        ? Column(
                            children: [
                              SizedBox(
                                height: padding.top,
                              ),
                              CitySearch(
                                homeController: controller,
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(controller.weatherData!.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              CurrentWeatherContents(
                                iconUrl: controller
                                    .weatherData!.weather!.first.icon!,
                                temp: _convertKelvin(
                                    controller.weatherData!.main!.temp),
                                description: controller
                                    .weatherData!.weather!.first.description!,
                                maxTemp: _convertKelvin(
                                    controller.weatherData!.main!.tempMax),
                                minTemp: _convertKelvin(
                                    controller.weatherData!.main!.tempMin),
                                windSpeed: controller.weatherData!.wind!.speed!,
                              ),
                            ],
                          )
                        : CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                c.ControlledWidgetBuilder<HomeController>(
                  builder: (context, controller) {
                    return controller.weatherForecast != null &&
                            controller.weatherForecast?.list != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var i in items)
                                WeatherForecastWidget(
                                    iconUrl: controller.weatherForecast!
                                            .list![i].weather!.first.icon ??
                                        "",
                                    temp: _convertKelvin(controller
                                        .weatherForecast!
                                        .list![i]
                                        .main!
                                        .tempMax),
                                    date: DateFormat(
                                      "EE",
                                    ).format(DateTime.parse(controller
                                        .weatherForecast!.list![i].dtTxt!)))
                            ],
                          )
                        : Text("");
                  },
                ),
              ],
            ),
          ),
        ));
  }

  _convertKelvin(var val) {
    double _ans = val - 273.15;
    var ans = _ans.round();
    return ans.toString();
  }
}
