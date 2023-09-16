// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:chiya_talk/Model/Request/login_token_request.dart';
// import 'package:equatable/equatable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
// import '../../Services/login_service.dart';
// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginService loginService;
//   LoginBloc(this.loginService) : super(LoginLoadingstate()) {
//     on<LoginClickEvent>((event, emit) async {
//       String? username;
//       String? password;

//       emit(LoginLoadingstate());

//       LoginTokenRequest loginTokenRequest =
//           LoginTokenRequest(username.toString(), password.toString());
//       try {
//         var response = await loginService.getLoginToken(loginTokenRequest);
//         if (response.token != "") {
//           emit(const LoginSuccessState(messang: "Login Sucessfull "));
//           emit(Authenticated());
//         } else {
//           emit(const LoginFailedState("Username or Password Incorrect"));
//           emit(Unauthenticated());
//         }
//       } on HttpException catch (ex) {
//         emit(LoginFailedState(ex.message));
//         emit(Unauthenticated());
//       }
//     });

//     on<LogoutClickEvent>(
//       (event, emit) async {
//         SharedPreferences preferences = await SharedPreferences.getInstance();
//         await preferences.remove("TOKEN");
//         emit(Unauthenticated());
//         emit(LoggedOutState());
//       },
//     );
//   }
// }
