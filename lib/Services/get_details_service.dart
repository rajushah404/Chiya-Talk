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
      print("$baseUrl $endPiont$username");
      if (response.body.isNotEmpty) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final GetUserByNameResponse getUserByNameResponse =
            GetUserByNameResponse.fromJson(jsonResponse);

        // Check if the user is found based on the "code" field in the response
        if (getUserByNameResponse.code == '001') {
          // User found, create an instance of GetUserByNameResponse
          return getUserByNameResponse;
        } else {
          // User not found, handle accordingly
          print('User not found for username: $username');
          return getUserByNameResponse; // You may want to return a default or null object
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
