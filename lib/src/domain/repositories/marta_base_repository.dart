import 'package:http/http.dart';

abstract class MartaBaseRepository {
  Future<Response> executeMartaRequest(String requestType, String path);
}
