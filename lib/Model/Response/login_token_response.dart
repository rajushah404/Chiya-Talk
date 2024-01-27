class LoginTokenResponse {
  TokenInfo? tokenInfo;
  String? statusCode;
  String? message;

  LoginTokenResponse({this.tokenInfo, this.statusCode, this.message});

  LoginTokenResponse.fromJson(Map<String, dynamic> json) {
    tokenInfo = json['tokenInfo'] != null
        ? TokenInfo.fromJson(json['tokenInfo'])
        : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokenInfo != null) {
      data['tokenInfo'] = tokenInfo!.toJson();
    }
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}

class TokenInfo {
  String? token;
  int? status;
  String? username;

  TokenInfo({this.token, this.status, this.username});

  TokenInfo.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    status = json['status'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['status'] = status;
    data['username'] = username;
    return data;
  }
}
