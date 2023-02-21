import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> registerUser(
  String name,
  String password,
  String comPassword,
  String email,
  String mobile_no,
  String vehicle_number,
  String nic,
  String address,
  String vehical_type,
  String chassis_number,
  String fuel_type,
) async {
  String apiUrl = '${dotenv.env['BASE_URL']}/register';
  final response = http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'password': password,
      'email': email,
      'c_password': comPassword,
      'mobile_number': mobile_no,
      'vehical_number': vehicle_number,
      'nic': nic,
      'address': address,
      'vehical_type': vehical_type,
      'chassis_number': chassis_number,
      'fuel_type_id': fuel_type,
    }),
  );
  return response;
}

Future<http.Response> loginUser(
  String email,
  String password,
) async {
  String apiUrl = '${dotenv.env['BASE_URL']}/login';

  final response = http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  return response;
}
