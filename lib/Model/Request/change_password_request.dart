class ChangePassword {
  int? otp;
  String? email;
  String? username;
  String? password;

  ChangePassword({this.otp, this.email, this.username, this.password});

  ChangePassword.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
