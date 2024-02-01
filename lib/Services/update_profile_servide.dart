import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chiya_talk/Model/Request/profile_update_request.dart';

import '../Basic/base_url.dart';
import '../Model/Response/message_response.dart';

class UpdateProfileSerice {
  static const String loginEndpoint = "api/User/CompleteProfile";

  static Future<MeassgeResponse> update(
    String username,
    String email,
    String address,
    String contachNo,
    String token,
  ) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);

    final updateProfile = UpdateProfile(
      username: username,
      email: email,
      address: address,
      contachNo: contachNo,
    );
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(updateProfile.toJson()),
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
