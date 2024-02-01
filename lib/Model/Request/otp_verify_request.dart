class OTPVerify {
  String? email;
  String? username;
  int? enteredOTP;

  OTPVerify({this.email, this.username, this.enteredOTP});

  OTPVerify.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    enteredOTP = json['enteredOTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['enteredOTP'] = enteredOTP;
    return data;
  }
}
