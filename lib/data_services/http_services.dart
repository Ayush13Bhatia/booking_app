import 'package:http/http.dart' as http;
import '../configuration/app_config.dart';

class ApiProvider {
  ApiProvider.instance();

  static String baseUrl = Environment().config.baseUrl;

  static Future<http.Response> getDataApi(
    String getUrl,
  ) async {
    var url = Uri.parse("$baseUrl$getUrl");
    var response = await http.get(url, headers: {}).timeout(const Duration(seconds: 60));
    return response;
  }
}
