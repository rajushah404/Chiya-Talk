class GetProfilePictureModel {
  String? message;
  String? statusCode;
  String? userImage;

  GetProfilePictureModel({this.message, this.statusCode, this.userImage});

  GetProfilePictureModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['userImage'] = userImage;
    return data;
  }
}
