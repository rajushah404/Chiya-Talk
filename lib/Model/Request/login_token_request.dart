class LoginTokenRequest {
  final String username;
  final String password;

  LoginTokenRequest(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
