// To parse this JSON data, do
//
//     final employeList = employeListFromJson(jsonString);

import 'dart:convert';

EmployeList employeListFromJson(String str) => EmployeList.fromJson(json.decode(str));

String employeListToJson(EmployeList data) => json.encode(data.toJson());

class EmployeList {

  bool error;
  String msg;
  List<Datum> data;

  EmployeList({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory EmployeList.fromJson(Map<String, dynamic> json) => EmployeList(
    error: json["error"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

}

class Datum {
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
  int companyId;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  dynamic otp;
  String? lastLoginDate;
  String registeredBy;
  String createdAt;
  String updatedAt;

  Datum({
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
    required this.companyId,
    this.currentTeamId,
    this.profilePhotoPath,
    this.otp,
    this.lastLoginDate,
    required this.registeredBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    usertype: json["usertype"],
    emailVerifiedAt: json["email_verified_at"],
    businessName: json["business_name"],
    productOrservices: json["productOrservices"],
    lineOfBusiness: json["line_of_business"],
    corporationType: json["corporation_type"],
    state: json["state"],
    twoFactorSecret: json["two_factor_secret"],
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
    token: json["token"],
    promocodeId: json["promocode_id"],
    companyId: json["company_id"],
    currentTeamId: json["current_team_id"],
    profilePhotoPath: json["profile_photo_path"],
    otp: json["otp"],
    lastLoginDate: json["last_login_date"] == null ? '' :json["last_login_date"] ,
    registeredBy: json["registered_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
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
    "last_login_date": lastLoginDate,
    "registered_by": registeredBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
