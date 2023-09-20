
class BudgetList {
  final bool error;
  final String msg;
  final List<Datum> data;

  BudgetList({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory BudgetList.fromJson(Map<String, dynamic> json) {
    return BudgetList(
      error: json['error'],
      msg: json['msg'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  final int catId;
  final String? catName;
  final String? description;
  final String? permission;
  final String? createdBy;
  final int? budgetId;
  final int amountPerYear;
  final int expenseAmount;

  Datum({
    required this.catId,
    required this.catName,
    required this.description,
    required this.permission,
    required this.createdBy,
    this.budgetId,
    required this.amountPerYear,
    required this.expenseAmount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      catId: json['cat_id'],
      catName: json['cat_name'],
      description: json['description'],
      permission: json['permission'],
      createdBy: json['created_by'],
      budgetId: json['budget_id'],
      amountPerYear: json['amount_per_year'],
      expenseAmount: json['expense_amount'],
    );
  }
}