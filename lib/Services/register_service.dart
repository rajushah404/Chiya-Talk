import 'dart:convert';
import 'package:chiya_talk/Model/Request/register_request.dart';
import 'package:chiya_talk/Model/Response/register_response.dart';
import 'package:http/http.dart' as http;

import '../Basic/base_url.dart';

class RegisterService {
  static const String loginEndpoint = "api/Authenticate/register";

  static Future<RegisterResponse> register(
    String username,
    String password,
    String email,
  ) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);

    final registerRequest =
        RegisterRequest(username: username, password: password, email: email);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(registerRequest.toJson()),
      );
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final RegisterResponse registerResponse =
            RegisterResponse.fromJson(responseData);
        if (response.statusCode == 200) {
          return registerResponse;
        } else {
          return registerResponse;
        }
      } else {
        throw Exception('Failed to Register');
      }
    } catch (e) {
      throw Exception('Failed to Register');
    }
  }
}
