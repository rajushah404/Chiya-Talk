import 'dart:convert';

import 'package:chiya_talk/Basic/base_url.dart';
import 'package:http/http.dart' as http;

import '../Model/Response/get_user_by_name_response.dart';

class GetUserDetails {
  String baseUrl = BaseUrl.uri;
  String endPiont = "api/User/GetUserByUsername?Username=";

  Future<GetUserByNameResponse> getUserDetails(
      String username, String token) async {
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
        final GetUserByNameResponse getUserByNameResponse =
            GetUserByNameResponse.fromJson(jsonResponse);

        if (getUserByNameResponse.code == '001') {
          return getUserByNameResponse;
        } else {
          return getUserByNameResponse;
        }
      } else {
        throw Exception(
            'Failed to get user details. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
