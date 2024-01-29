class GetUserByNameResponse {
  Data? data;
  String? code;
  String? message;

  GetUserByNameResponse({this.data, this.code, this.message});

  factory GetUserByNameResponse.fromJson(Map<String, dynamic> json) {
    return GetUserByNameResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      code: json['code'],
      message: json['message'],
    );
  }
}

class Data {
  String? id;
  String? name;
  String? username;
  String? email;
  String? address;
  String? password;
  String? contachNo;
  String? image;
  int? isVerified;

  Data({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.password,
    this.contachNo,
    this.image,
    this.isVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      contachNo: json['contachNo'],
      image: json['image'],
      isVerified: json['isVerified'],
    );
  }
}
