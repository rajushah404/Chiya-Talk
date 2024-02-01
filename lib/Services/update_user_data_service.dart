import 'dart:convert';
import 'package:chiya_talk/Model/Response/message_response.dart';
import 'package:http/http.dart' as http;
import '../Basic/base_url.dart';
import '../Model/Request/update_user_data.dart';

class UpdateUserDataService {
  static const String loginEndpoint = "api/User/UpdateProfile";

  static Future<MeassgeResponse> updateData(
      String name,
      String username,
      String email,
      String address,
      String contachNo,
      String image,
      String token,
      String imageName,
      String baseImageFile) async {
    final url = Uri.parse(BaseUrl.uri + loginEndpoint);

    final updateProfiledata = UpdateUserData(
        name: name,
        username: username,
        email: email,
        address: address,
        contachNo: contachNo,
        image: image,
        imageName: imageName,
        baseImageFile: baseImageFile);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode(updateProfiledata.toJson()),
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
