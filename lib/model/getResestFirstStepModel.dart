// To parse this JSON data, do
//
//     final getResestFirstStepModel = getResestFirstStepModelFromJson(jsonString);

import 'dart:convert';

GetResestFirstStepModel getResestFirstStepModelFromJson(String str) => GetResestFirstStepModel.fromJson(json.decode(str));

String getResestFirstStepModelToJson(GetResestFirstStepModel data) => json.encode(data.toJson());

class GetResestFirstStepModel {
  bool error;
  String msg;
  Data data;

  GetResestFirstStepModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory GetResestFirstStepModel.fromJson(Map<String, dynamic> json) => GetResestFirstStepModel(
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
