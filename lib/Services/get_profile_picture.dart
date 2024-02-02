import 'dart:convert';

import 'package:chiya_talk/Model/Response/get_profile_response_model.dart';
import 'package:http/http.dart' as http;
import '../Basic/base_url.dart';

class GetProfilePictureservice {
  String baseUrl = BaseUrl.uri;
  String endPiont = "api/User/GetProfile?Username=";
  Future<GetProfilePictureModel> getProfilePicture(
      String token, String username) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endPiont$username"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );
      if (response.body.isNotEmpty) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final GetProfilePictureModel getProfilePictureModel =
            GetProfilePictureModel.fromJson(jsonResponse);

        if (getProfilePictureModel.statusCode == '001') {
          return getProfilePictureModel;
        } else {
          return getProfilePictureModel;
        }
      } else {
        throw Exception(
            'Failed to get user profile. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
