import 'dart:convert';

import '../../Basic/base_url.dart';
import '../../Model/Request/otp_verify_request.dart';
import '../../Model/Response/message_response.dart';
import 'package:http/http.dart' as http;

class VerifyOTPService {
  static const String loginEndpoint = "api/Password/VerifyOTP";
  static Future<MeassgeResponse> otpCheck(
      String username, String email, int otp) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);
    final verifyOTP =
        OTPVerifyRequest(username: username, email: email, enteredOTP: otp);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(verifyOTP.toJson()),
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
        throw Exception('Failed to verify');
      }
    } catch (e) {
      throw Exception('Failed to verify');
    }
  }
}
