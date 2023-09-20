// To parse this JSON data, do
//
//     final budgetList = budgetListFromJson(jsonString);

import 'dart:convert';

BudgetList budgetListFromJson(String str) => BudgetList.fromJson(json.decode(str));

String budgetListToJson(BudgetList data) => json.encode(data.toJson());

class BudgetList {
  List<BudgetListElement> budgetList;

  BudgetList({
    required this.budgetList,
  });

  factory BudgetList.fromJson(Map<String, dynamic> json) => BudgetList(
    budgetList: List<BudgetListElement>.from(json["Budget List"].map((x) => BudgetListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Budget List": List<dynamic>.from(budgetList.map((x) => x.toJson())),
  };
}

class BudgetListElement {
  int id;
  String budgetName;
  int userId;
  int? companyId;
  dynamic budgetDescription;
  String categoryId;
  String subcategoryId;
  String amountPerYear;
  dynamic tds;
  DateTime budgetEndDate;
  DateTime createdAt;
  DateTime updatedAt;

  BudgetListElement({
    required this.id,
    required this.budgetName,
    required this.userId,
    this.companyId,
    this.budgetDescription,
    required this.categoryId,
    required this.subcategoryId,
    required this.amountPerYear,
    this.tds,
    required this.budgetEndDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BudgetListElement.fromJson(Map<String, dynamic> json) => BudgetListElement(
    id: json["id"],
    budgetName: json["budget_name"],
    userId: json["user_id"],
    companyId: json["company_id"],
    budgetDescription: json["budget_description"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    amountPerYear: json["amount_per_year"],
    tds: json["tds"],
    budgetEndDate: DateTime.parse(json["budget_end_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "budget_name": budgetName,
    "user_id": userId,
    "company_id": companyId,
    "budget_description": budgetDescription,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "amount_per_year": amountPerYear,
    "tds": tds,
    "budget_end_date": budgetEndDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
