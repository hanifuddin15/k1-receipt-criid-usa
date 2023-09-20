// To parse this JSON data, do
//
//     final expenseListByBudgetId = expenseListByBudgetIdFromJson(jsonString);

import 'dart:convert';

ExpenseListByBudgetId expenseListByBudgetIdFromJson(String str) => ExpenseListByBudgetId.fromJson(json.decode(str));

String expenseListByBudgetIdToJson(ExpenseListByBudgetId data) => json.encode(data.toJson());

class ExpenseListByBudgetId {
  bool error;
  String msg;
  List<Datum> data;

  ExpenseListByBudgetId({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory ExpenseListByBudgetId.fromJson(Map<String, dynamic> json) => ExpenseListByBudgetId(
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
  int expenseId;
  String catName;
  String subcat;
  int budgetAmountPerYear;
  int expenseAmount;
  String expenseDescription;
  String receiptImg;
  String expenseShopName;
  DateTime expenseTds;
  DateTime purchasingDate;

  Datum({
    required this.expenseId,
    required this.catName,
    required this.subcat,
    required this.budgetAmountPerYear,
    required this.expenseAmount,
    required this.expenseDescription,
    required this.receiptImg,
    required this.expenseShopName,
    required this.expenseTds,
    required this.purchasingDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    expenseId: json["expense_id"],
    catName: json["cat_name"],
    subcat: json["subcat"],
    budgetAmountPerYear: json["budget_amount_per_year"],
    expenseAmount: json["expense_amount"],
    expenseDescription: json["expense_description"],
    receiptImg: json["receipt_img"],
    expenseShopName: json["expense_shop_name"],
    expenseTds: DateTime.parse(json["expense_tds"]),
    purchasingDate: DateTime.parse(json["purchasing_date"]),
  );

  Map<String, dynamic> toJson() => {
    "expense_id": expenseId,
    "cat_name": catName,
    "subcat": subcat,
    "budget_amount_per_year": budgetAmountPerYear,
    "expense_amount": expenseAmount,
    "expense_description": expenseDescription,
    "receipt_img": receiptImg,
    "expense_shop_name": expenseShopName,
    "expense_tds": "${expenseTds.year.toString().padLeft(4, '0')}-${expenseTds.month.toString().padLeft(2, '0')}-${expenseTds.day.toString().padLeft(2, '0')}",
    "purchasing_date": "${purchasingDate.year.toString().padLeft(4, '0')}-${purchasingDate.month.toString().padLeft(2, '0')}-${purchasingDate.day.toString().padLeft(2, '0')}",
  };
}
