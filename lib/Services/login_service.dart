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

      if (response.statusCode == 200) {
        // If the request is successful, parse and return the response as a LoginTokenResponse
        final Map<String, dynamic> responseData = json.decode(response.body);
        final LoginTokenResponse loginResponse =
            LoginTokenResponse.fromJson(responseData);
        return loginResponse;
      } else {
        // If the request is not successful, handle the error here (e.g., show an error message)
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request (e.g., network issues)
      throw Exception('Failed to connect to the server');
    }
  }
}
