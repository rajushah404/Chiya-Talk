import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../Model/Request/login_token_request.dart';
import '../Model/Response/login_token_response.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/api/Authenticate/login')
  Future<LoginTokenResponse> getLoginToken(
      @Body() LoginTokenRequest loginTokenRequest);
}
