class UpdatePPRequestModel {
  String? username;
  String? image;
  String? imageName;
  String? baseImageFile;

  UpdatePPRequestModel(
      {this.username, this.image, this.imageName, this.baseImageFile});

  UpdatePPRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    image = json['image'];
    imageName = json['imageName'];
    baseImageFile = json['baseImageFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['image'] = image;
    data['imageName'] = imageName;
    data['baseImageFile'] = baseImageFile;
    return data;
  }
}
