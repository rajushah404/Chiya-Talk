import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Basic/base_url.dart';
import '../Model/Request/login_token_request.dart';
import '../Model/Response/login_token_response.dart';

class AuthService {
  static const String loginEndpoint = "api/Authenticate/login";

  static Future<LoginTokenResponse> login(
      String username, String password) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);

    // Create a LoginTokenRequest object
    final loginRequest = LoginTokenRequest(username, password);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginRequest.toJson()),
      );
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final LoginTokenResponse loginResponse =
            LoginTokenResponse.fromJson(responseData);

        if (loginResponse.status == "000" &&
            loginResponse.isDataNull() == false) {
          return loginResponse;
        } else {
          return loginResponse;
        }
      } else {
        throw Exception("User can not be Empty");
      }
    } catch (e) {
      throw Exception('Failed to Login');
    }
  }
}
