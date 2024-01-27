class RegisterRequest {
  String? name;
  String? username;
  String? password;

  RegisterRequest({this.name, this.username, this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
