// To parse this JSON data, do
//
//     final getUserMonthlyExpenseModel = getUserMonthlyExpenseModelFromJson(jsonString);

import 'dart:convert';

GetUserMonthlyExpenseModel getUserMonthlyExpenseModelFromJson(String str) => GetUserMonthlyExpenseModel.fromJson(json.decode(str));

String getUserMonthlyExpenseModelToJson(GetUserMonthlyExpenseModel data) => json.encode(data.toJson());

class GetUserMonthlyExpenseModel {
  bool error;
  String msg;
  List<Datum> data;

  GetUserMonthlyExpenseModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory GetUserMonthlyExpenseModel.fromJson(Map<String, dynamic> json) => GetUserMonthlyExpenseModel(
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
  String catName;
  int totalBudget;
  double budgetAmountPerMonth;
  int expenseAmountPerMonth;
  int remainingAmountPerMonth;

  Datum({
    required this.catName,
    required this.totalBudget,
    required this.budgetAmountPerMonth,
    required this.expenseAmountPerMonth,
    required this.remainingAmountPerMonth,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    catName: json["cat_name"],
    totalBudget: json["total_budget"],
    budgetAmountPerMonth: json["budget_amount_per_month"]?.toDouble(),
    expenseAmountPerMonth: json["expense_amount_per_month"],
    remainingAmountPerMonth: json["remaining_amount_per_month"],
  );

  Map<String, dynamic> toJson() => {
    "cat_name": catName,
    "total_budget": totalBudget,
    "budget_amount_per_month": budgetAmountPerMonth,
    "expense_amount_per_month": expenseAmountPerMonth,
    "remaining_amount_per_month": remainingAmountPerMonth,
  };
}
