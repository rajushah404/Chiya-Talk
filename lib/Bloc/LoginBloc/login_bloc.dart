import 'package:bloc/bloc.dart';
import 'package:chiya_talk/Model/Request/login_token_request.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/login_service.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;
  LoginBloc(this.authService) : super(LoginLoadingstate()) {
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
