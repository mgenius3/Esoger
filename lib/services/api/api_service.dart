import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_config.dart';
import 'package:esoger/utils/handle_error.dart';

class ApiService {
  final _storage = FlutterSecureStorage();

  // Method to store authentication token
  Future<void> storeAuthToken(String token) async {
    await _storage.write(key: 'authToken', value: token);
  }

  // Method to get authentication token
  Future<String?> getAuthToken() async {
    return await _storage.read(key: 'authToken');
  }

  // Method to store custom data
  Future<void> storeCustomData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Method to get custom data
  Future<String?> getCustomData(String key) async {
    return await _storage.read(key: key);
  }

  // Method for HTTP GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final authToken = await getAuthToken();
      final headers = {
        'Content-Type': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      };
      final url = Uri.parse('${ApiConfig.baseURL}$endpoint');
      final response = await http.get(url, headers: headers);

      if (response.statusCode >= 200 && response.statusCode < 400) {
        return {"error": null, "data": json.decode(response.body)};
      } else {
        return {"error": json.decode(response.body)['message'], "data": null};
      }
      // return json.decode(response.body);
    } catch (err) {
      throw CustomError('$err');
    }
  }

  // Method for HTTP POST request
  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final authToken = await getAuthToken();
      final headers = {
        'Content-Type': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      };
      final url = Uri.parse('${ApiConfig.baseURL}$endpoint');
      final response =
          await http.post(url, headers: headers, body: json.encode(body));
      if (response.statusCode >= 200 && response.statusCode < 400) {
        return {"error": null, "data": json.decode(response.body)};
      } else {
        String? specialError = extractErrorMessages(json.decode(response.body));
        if (specialError != null) {
          throw Exception(specialError);
        } else {
          return {"error": json.decode(response.body)['message'], "data": null};
        }
      }
    } catch (err) {
      print(78);
      print(err.toString());
      throw CustomError('$err');
    }
  }
}
