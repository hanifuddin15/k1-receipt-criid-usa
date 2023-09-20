// To parse this JSON data, do
//
//     final userInfoProfileModel = userInfoProfileModelFromJson(jsonString);

import 'dart:convert';

UserInfoProfileModel userInfoProfileModelFromJson(String str) => UserInfoProfileModel.fromJson(json.decode(str));

String userInfoProfileModelToJson(UserInfoProfileModel data) => json.encode(data.toJson());

class UserInfoProfileModel {
  bool error;
  String msg;
  Data data;

  UserInfoProfileModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory UserInfoProfileModel.fromJson(Map<String, dynamic> json) => UserInfoProfileModel(
    error: json["error"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String username;
  String firstname;
  String lastname;
  String name;
  String email;
  String mobile;
  dynamic address;
  String usertype;
  dynamic emailVerifiedAt;
  dynamic businessName;
  dynamic productOrservices;
  dynamic lineOfBusiness;
  dynamic corporationType;
  dynamic state;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  int token;
  dynamic promocodeId;
  dynamic companyId;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  dynamic otp;
  DateTime lastLoginDate;
  String registeredBy;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.name,
    required this.email,
    required this.mobile,
    this.address,
    required this.usertype,
    this.emailVerifiedAt,
    this.businessName,
    this.productOrservices,
    this.lineOfBusiness,
    this.corporationType,
    this.state,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    required this.token,
    this.promocodeId,
    this.companyId,
    this.currentTeamId,
    this.profilePhotoPath,
    this.otp,
    required this.lastLoginDate,
    required this.registeredBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"] ?? "", // Provide an empty string as default if null
    usertype: json["usertype"],
    emailVerifiedAt: json["email_verified_at"] != null ? DateTime.parse(json["email_verified_at"]) : null, // Convert to DateTime if not null
    businessName: json["business_name"] ?? "", // Provide an empty string as default if null
    productOrservices: json["productOrservices"] ?? "", // Provide an empty string as default if null
    lineOfBusiness: json["line_of_business"] ?? "", // Provide an empty string as default if null
    corporationType: json["corporation_type"] ?? "", // Provide an empty string as default if null
    state: json["state"] ?? "", // Provide an empty string as default if null
    twoFactorSecret: json["two_factor_secret"] ?? "", // Provide an empty string as default if null
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"] ?? "", // Provide an empty string as default if null
    token: json["token"],
    promocodeId: json["promocode_id"]?? "", // Keep it as nullable int
    companyId: json["company_id"] ?? "",
    currentTeamId: json["current_team_id"]?? "",
    profilePhotoPath: json["profile_photo_path"]?? "",
    otp: json["otp"]??"",
    lastLoginDate: DateTime.parse(json["last_login_date"]),
    registeredBy: json["registered_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "usertype": usertype,
    "email_verified_at": emailVerifiedAt,
    "business_name": businessName,
    "productOrservices": productOrservices,
    "line_of_business": lineOfBusiness,
    "corporation_type": corporationType,
    "state": state,
    "two_factor_secret": twoFactorSecret,
    "two_factor_recovery_codes": twoFactorRecoveryCodes,
    "token": token,
    "promocode_id": promocodeId,
    "company_id": companyId,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "otp": otp,
    "last_login_date": lastLoginDate.toIso8601String(),
    "registered_by": registeredBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}