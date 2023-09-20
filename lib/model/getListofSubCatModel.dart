// To parse this JSON data, do
//
//     final subCatModel = subCatModelFromJson(jsonString);

import 'dart:convert';

SubCatModel subCatModelFromJson(String str) => SubCatModel.fromJson(json.decode(str));

String subCatModelToJson(SubCatModel data) => json.encode(data.toJson());

class SubCatModel {
  bool error;
  String msg;
  List<Datum> data;

  SubCatModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory SubCatModel.fromJson(Map<String, dynamic> json) => SubCatModel(
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
  int subcatId;
  String subcatName;
  String description;
  String permission;
  int budgetId;
  int amountPerYear;
  int expenseAmount;

  Datum({
    required this.subcatId,
    required this.subcatName,
    required this.description,
    required this.permission,
    required this.budgetId,
    required this.amountPerYear,
    required this.expenseAmount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    subcatId: json["subcat_id"],
    subcatName: json["subcat_name"],
    description: json["description"],
    permission: json["permission"],
    budgetId: json["budget_id"],
    amountPerYear: json["amount_per_year"],
    expenseAmount: json["expense_amount"],
  );

  Map<String, dynamic> toJson() => {
    "subcat_id": subcatId,
    "subcat_name": subcatName,
    "description": description,
    "permission": permission,
    "budget_id": budgetId,
    "amount_per_year": amountPerYear,
    "expense_amount": expenseAmount,
  };
}
