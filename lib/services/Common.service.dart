import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> getAllVehicleType() async {
  String apiUrl = '${dotenv.env['BASE_URL']}/vehicalType';
  final response = http.get(Uri.parse(apiUrl));
  return response;
}

Future<http.Response> getAllFuelType() async {
  String apiUrl = '${dotenv.env['BASE_URL']}/fuelType';
  final response = http.get(Uri.parse(apiUrl));
  return response;
}
