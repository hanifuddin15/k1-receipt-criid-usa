// To parse this JSON data, do
//
//     final getUserOverallExpenseModel = getUserOverallExpenseModelFromJson(jsonString);

import 'dart:convert';

GetUserOverallExpenseModel getUserOverallExpenseModelFromJson(String str) => GetUserOverallExpenseModel.fromJson(json.decode(str));

String getUserOverallExpenseModelToJson(GetUserOverallExpenseModel data) => json.encode(data.toJson());

class GetUserOverallExpenseModel {
  bool error;
  String msg;
  List<Datum1> data;

  GetUserOverallExpenseModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory GetUserOverallExpenseModel.fromJson(Map<String, dynamic> json) => GetUserOverallExpenseModel(
    error: json["error"],
    msg: json["msg"],
    data: List<Datum1>.from(json["data"].map((x) => Datum1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum1 {
  String catName;
  int overallTotalBudget;
  int categorywiseTotalBudget;
  int expenseAmount;
  int overallRemainingAmount;

  Datum1({
    required this.catName,
    required this.overallTotalBudget,
    required this.categorywiseTotalBudget,
    required this.expenseAmount,
    required this.overallRemainingAmount,
  });

  factory Datum1.fromJson(Map<String, dynamic> json) => Datum1(
    catName: json["cat_name"],
    overallTotalBudget: json["overall_total_budget"],
    categorywiseTotalBudget: json["categorywise_total_budget"],
    expenseAmount: json["expense_amount"],
    overallRemainingAmount: json["overall_remaining_amount"],
  );

  Map<String, dynamic> toJson() => {
    "cat_name": catName,
    "overall_total_budget": overallTotalBudget,
    "categorywise_total_budget": categorywiseTotalBudget,
    "expense_amount": expenseAmount,
    "overall_remaining_amount": overallRemainingAmount,
  };
}
