import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/model/weather_model.dart';

class ApiHelper {
  static ApiHelper obj = ApiHelper._();
  final String _baseurl =
      "https://api.weatherapi.com/v1/forecast.json?key=e09f03988e1048d2966132426232205&q=";

  ApiHelper._();

  factory ApiHelper() {
    return obj;
  }

  Future<Weather?> getLinkData(String endPoint) async {
    endPoint = "$endPoint&aqi=no";
    var data = _baseurl + endPoint;
    // var res = await http.get(Uri.parse(data));

    http.Response future = await http.get(Uri.parse(data));
    if (future.statusCode == 200) {
      Map decoDData = jsonDecode(future.body);
      var response = weatherFromJson(future.body);
      return response;
    }
    return null;
  }

  Future<String> getApiData(String url) async {
    var future = await http.get(Uri.parse(url));
    return future.body;
  }
}
