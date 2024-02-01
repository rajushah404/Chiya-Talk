import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Basic/base_url.dart';
import '../Model/Request/forgot_pass_request.dart';
import '../Model/Response/message_response.dart';

class VerifyUserService {
  static const String loginEndpoint = "api/Password/Verify Email";
  static Future<MeassgeResponse> userVerfify(
    String username,
    String email,
  ) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);

    final verifyUser = VerifyUserRequest(username: username, email: email);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(verifyUser.toJson()),
      );
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final MeassgeResponse registerResponse =
            MeassgeResponse.fromJson(responseData);
        if (response.statusCode == 200) {
          return registerResponse;
        } else {
          return registerResponse;
        }
      } else {
        throw Exception('Failed to update');
      }
    } catch (e) {
      throw Exception('Failed to update');
    }
  }
}
