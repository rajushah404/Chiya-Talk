class ChangePasswordRequestmodel {
  int? enteredOTP;
  String? email;
  String? username;
  String? password;

  ChangePasswordRequestmodel(
      {this.enteredOTP, this.email, this.username, this.password});

  ChangePasswordRequestmodel.fromJson(Map<String, dynamic> json) {
    enteredOTP = json['enteredOTP'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enteredOTP'] = enteredOTP;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
