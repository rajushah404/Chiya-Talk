class VerifyUserRequest {
  String? username;
  String? email;

  VerifyUserRequest({this.username, this.email});

  VerifyUserRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
