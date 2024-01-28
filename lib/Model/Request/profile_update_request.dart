class UpdateProfile {
  String? username;
  String? email;
  String? address;
  String? contachNo;
  String? image;
  String? imageName;
  String? baseImageFile;

  UpdateProfile(
      {this.username,
      this.email,
      this.address,
      this.contachNo,
      this.image,
      this.imageName,
      this.baseImageFile});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    address = json['address'];
    contachNo = json['contachNo'];
    image = json['image'];
    imageName = json['imageName'];
    baseImageFile = json['baseImageFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['address'] = address;
    data['contachNo'] = contachNo;
    data['image'] = image;
    data['imageName'] = imageName;
    data['baseImageFile'] = baseImageFile;
    return data;
  }
}
