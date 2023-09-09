import 'package:bloc/bloc.dart';
import 'package:chiya_talk/Model/Request/login_token_request.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import '../../Services/login_service.dart';
import 'package:dio/dio.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;
  LoginBloc(this.loginService) : super(LoginLoadingstate()) {
    on<AppStarted>((event, emit) async {
      EncryptedSharedPreferences encryptedSharedPreferences =
          EncryptedSharedPreferences();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.containsKey("TOKEN")) {
        try {
          var rememberUsername =
              await encryptedSharedPreferences.getString("REMEMBER_USERNAME");
          var rememberPassword =
              await encryptedSharedPreferences.getString("REMEMBER_PASSWORD");

          LoginTokenRequest loginTokenRequest = LoginTokenRequest(
              username: rememberUsername, password: rememberPassword);

          var response = await loginService.getLoginToken(loginTokenRequest);
          if (response.token != "") {
            emit(LoginSuccessState());
            emit(Authenticated());
          } else {
            emit(const LoginFailedState("Username or Password Incorrect"));
            emit(Unauthenticated());
          }
        } on DioError {
          emit(Unauthenticated());
        }
      } else {
        emit(Unauthenticated());
      }
    });
    on<LoginClickEvent>((event, emit) async {
      emit(LoginLoadingstate());

      EncryptedSharedPreferences encryptedSharedPreferences =
          EncryptedSharedPreferences();
      SharedPreferences preferences = await SharedPreferences.getInstance();

      LoginTokenRequest loginTokenRequest =
          LoginTokenRequest(username: event.username, password: event.password);
      try {
        var response = await loginService.getLoginToken(loginTokenRequest);
        if (response.token != "") {
          preferences.setBool("FINGEPRINT_ENABLED", true);

          encryptedSharedPreferences.setString(
              'REMEMBER_USERNAME', event.username);
          encryptedSharedPreferences.setString(
              'REMEMBER_PASSWORD', event.password);
          emit(LoginSuccessState());
          emit(Authenticated());
        } else {
          emit(const LoginFailedState("Username or Password Incorrect"));
          emit(Unauthenticated());
        }
      } on DioException catch (ex) {
        emit(LoginFailedState(ex.response!.data['Message']));
        emit(Unauthenticated());
      }
    });

    on<FingerPrintLogin>(
      (event, emit) async {
        EncryptedSharedPreferences encryptedSharedPreferences =
            EncryptedSharedPreferences();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        try {
          var fingerprintEnabled = preferences.getBool("FINGEPRINT_ENABLED");
          if (fingerprintEnabled == true) {
            var rememberUsername =
                await encryptedSharedPreferences.getString("REMEMBER_USERNAME");
            var rememberPassword =
                await encryptedSharedPreferences.getString("REMEMBER_PASSWORD");
            LoginTokenRequest loginTokenRequest = LoginTokenRequest(
                username: rememberUsername, password: rememberPassword);
            var response = await loginService.getLoginToken(loginTokenRequest);
            if (response.token != "") {
              emit(LoginSuccessState());
              emit(Authenticated());
            } else {
              emit(const LoginFailedState("Username or Password Incorrect"));
              emit(Unauthenticated());
            }
          } else {
            emit(const LoginFailedState(
                "First time login should be using credentials"));
            emit(Unauthenticated());
          }
        } on DioException {
          emit(Unauthenticated());
        }
      },
    );
    on<LogoutClickEvent>(
      (event, emit) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.remove("TOKEN");
        emit(Unauthenticated());
        emit(LoggedOutState());
      },
    );
  }
}
