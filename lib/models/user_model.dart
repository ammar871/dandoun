import 'package:dandoun/models/package.dart';

class UserResponse {
  String? token;
  UserModel? user;
  List<String>? userRoles;
  String? expiration;

  UserResponse({this.token, this.user, this.userRoles, this.expiration});

  UserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    userRoles = json['userRoles'].cast<String>();
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['userRoles'] = this.userRoles;
    data['expiration'] = this.expiration;
    return data;
  }
}

class UserModel {
  String? id;
  String? userName;
  String? fullName;
  var imageUrl;
  var status;
  var name;
  String? password;
  int? packageId;
  String? email;
  var phone;
  var deviceToken;
  String? role;
  String? createdAt;

  UserModel(
      {this.id,
        this.userName,
        this.fullName,
        this.imageUrl,
        this.status,
        this.name,
        this.password,
        this.packageId,
        this.email,
        this.phone,
        this.deviceToken,
        this.role,
        this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    imageUrl = json['imageUrl'];
    status = json['status'];
    name = json['name'];
    password = json['password'];
    packageId = json['packageId'];
    email = json['email'];
    phone = json['phone'];
    deviceToken = json['deviceToken'];
    role = json['role'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['imageUrl'] = this.imageUrl;
    data['status'] = this.status;
    data['name'] = this.name;
    data['password'] = this.password;
    data['packageId'] = this.packageId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['deviceToken'] = this.deviceToken;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    return data;
  }
}


class UserDetailsResponse {
  UserModel? user;
  int? fav;
  Package? package;

  UserDetailsResponse({this.user, this.fav, this.package});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    fav = json['fav'];
    package = json['package'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['fav'] = this.fav;
    data['package'] = this.package;
    return data;
  }
}