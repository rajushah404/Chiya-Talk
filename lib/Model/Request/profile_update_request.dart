class UpdateProfile {
  String? username;
  String? email;
  String? address;
  String? contachNo;

  UpdateProfile({this.username, this.email, this.address, this.contachNo});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    address = json['address'];
    contachNo = json['contachNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['address'] = address;
    data['contachNo'] = contachNo;
    return data;
  }
}
