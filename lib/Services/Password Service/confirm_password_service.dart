import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Basic/base_url.dart';
import '../../Model/Request/change_password_request.dart';
import '../../Model/Response/message_response.dart';

class ConfirmPassswordService {
  static const String loginEndpoint = "api/Password/ChangePassword";
  static Future<MeassgeResponse> confirmPassowrd(
      String username, String email, int otp, String password) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);
    final changePasswordRequest = ChangePasswordRequestmodel(
        enteredOTP: otp, username: username, email: email, password: password);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(changePasswordRequest.toJson()),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final MeassgeResponse registerResponse =
            MeassgeResponse.fromJson(responseData);
        if (response.statusCode == 200) {
          return registerResponse;
        } else {
          return registerResponse;
        }
      } else {
        throw Exception('Failed to verify');
      }
    } catch (e) {
      throw Exception('Failed to verify');
    }
  }
}
