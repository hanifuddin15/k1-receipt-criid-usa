import 'dart:convert';

StepOneForgetPasswordModel stepOneForgetPasswordModelFromJson(String str) => StepOneForgetPasswordModel.fromJson(json.decode(str));

String stepOneForgetPasswordModelToJson(StepOneForgetPasswordModel data) => json.encode(data.toJson());

class StepOneForgetPasswordModel {
  bool error;
  String msg;
  Data data;

  StepOneForgetPasswordModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory StepOneForgetPasswordModel.fromJson(Map<String, dynamic> json) => StepOneForgetPasswordModel(
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
  int userid;
  DateTime resendExpired;

  Data({
    required this.userid,
    required this.resendExpired,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userid: json["userid"],
    resendExpired: DateTime.parse(json["resend_expired"]),
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "resend_expired": resendExpired.toIso8601String(),
  };
}
