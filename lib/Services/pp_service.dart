import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Basic/base_url.dart';
import '../Model/Request/update_pp_model.dart';
import '../Model/Response/message_response.dart';

class PPService {
  static const String loginEndpoint = "api/User/UpdateProfilePicture";
  static Future<MeassgeResponse> ppUpdate(String? username, String? image,
      String? imageName, String? baseImageFile, String token) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);
    final updateProfilePicture = UpdatePPRequestModel(
        image: image,
        username: username,
        imageName: imageName,
        baseImageFile: baseImageFile);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(updateProfilePicture.toJson()),
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
