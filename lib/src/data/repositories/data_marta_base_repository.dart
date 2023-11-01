import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:marta_technical_test/src/domain/repositories/marta_base_repository.dart';

class DataMartaBaseRepository implements MartaBaseRepository {
  static final DataMartaBaseRepository _instance =
      DataMartaBaseRepository._internal();
  DataMartaBaseRepository._internal();
  factory DataMartaBaseRepository() => _instance;

  String baseUrl = "https://api.openweathermap.org/";
  String apiKey = "&appid=2b9af006f3106130e8db287530898952";
  @override
  Future<Response> executeMartaRequest(String requestType, String path) async {
    Response response;
    var url = Uri.parse(baseUrl + path + apiKey);
    try {
      switch (requestType) {
        case "GET":
          response = await http.get(
            url,
          );
          break;

        default:
          throw Exception("");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw Exception("");
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
