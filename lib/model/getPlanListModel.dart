// To parse this JSON data, do
//
//     final getPlanModel = getPlanModelFromJson(jsonString);

import 'dart:convert';

GetPlanModel getPlanModelFromJson(String str) => GetPlanModel.fromJson(json.decode(str));

String getPlanModelToJson(GetPlanModel data) => json.encode(data.toJson());

class GetPlanModel {
  bool error;
  String msg;
  List<Datum> data;

  GetPlanModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory GetPlanModel.fromJson(Map<String, dynamic> json) => GetPlanModel(
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
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
