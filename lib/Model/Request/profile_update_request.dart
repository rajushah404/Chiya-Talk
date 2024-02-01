class UpdateProfile {
  String? username;
  String? name;
  String? email;
  String? address;
  String? contachNo;

  UpdateProfile(
      {this.username, this.name, this.email, this.address, this.contachNo});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    contachNo = json['contachNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['contachNo'] = contachNo;
    return data;
  }
}
