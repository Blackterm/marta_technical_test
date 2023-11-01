import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:marta_technical_test/src/domain/entities/SearchCity.dart';
import '../repositories/home_page_repository.dart';

class GetCityLocation
    extends UseCase<List<CityLocation>, GetCityLocationParams> {
  final HomePageRepository _homePageRepository;

  GetCityLocation(this._homePageRepository);
  @override
  Future<Stream<List<CityLocation>?>> buildUseCaseStream(
      GetCityLocationParams? params) async {
    StreamController<List<CityLocation>> controller = StreamController();
    try {
      List<CityLocation> res =
          await _homePageRepository.getCityLocation(params!.cityName);
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

class GetCityLocationParams {
  final String cityName;

  GetCityLocationParams(this.cityName);
}
