import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> getStationInformation(int id) async {
  String apiUrl = '${dotenv.env['BASE_URL']}/station/$id';
  final response = http.get(Uri.parse(apiUrl));
  return response;
}