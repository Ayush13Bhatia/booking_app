import 'package:http/http.dart' as http;
import '../configuration/app_config.dart';

class ApiProvider {
  ApiProvider.instance();

  static String baseUrl = Environment().config.baseUrl;

  static Future<http.Response> getDataApi(
    String getUrl,
  ) async {
    var headers = {
      'Cookie': 'ci_session=4tohckhp5g4l72kqva1e1km9k5ii0ljv'
    };
    var url = Uri.parse("$baseUrl$getUrl");
    var response = await http.get(url, headers: headers).timeout(const Duration(seconds: 60));
    return response;
  }
}
