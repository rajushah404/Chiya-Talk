part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginClickEvent extends LoginEvent {
  final String username;
  final String password;
  const LoginClickEvent({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}

class LogoutClickEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class AppStarted extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class FingerPrintLogin extends LoginEvent {
  @override
  List<Object?> get props => [];
}
