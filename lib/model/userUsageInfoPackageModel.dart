// To parse this JSON data, do
//
//     final userInfoPackageModel = userInfoPackageModelFromJson(jsonString);

import 'dart:convert';

UserInfoPackageModel userInfoPackageModelFromJson(String str) => UserInfoPackageModel.fromJson(json.decode(str));

String userInfoPackageModelToJson(UserInfoPackageModel data) => json.encode(data.toJson());

class UserInfoPackageModel {
  bool error;
  String msg;
  Data data;

  UserInfoPackageModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory UserInfoPackageModel.fromJson(Map<String, dynamic> json) => UserInfoPackageModel(
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
  UserService userService;
  int categoryUsage;
  int categoryRemaining;
  int subCategoryUsage;
  int subCategoryRemaining;
  int budgetUsage;
  int budgetRemaining;
  int receiptUsage;
  int receiptRemaining;

  Data({
    required this.userService,
    required this.categoryUsage,
    required this.categoryRemaining,
    required this.subCategoryUsage,
    required this.subCategoryRemaining,
    required this.budgetUsage,
    required this.budgetRemaining,
    required this.receiptUsage,
    required this.receiptRemaining,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userService: UserService.fromJson(json["user_service"]),
    categoryUsage: json["category_usage"],
    categoryRemaining: json["category_remaining"],
    subCategoryUsage: json["sub_category_usage"],
    subCategoryRemaining: json["sub_category_remaining"],
    budgetUsage: json["budget_usage"],
    budgetRemaining: json["budget_remaining"],
    receiptUsage: json["receipt_usage"],
    receiptRemaining: json["receipt_remaining"],
  );

  Map<String, dynamic> toJson() => {
    "user_service": userService.toJson(),
    "category_usage": categoryUsage,
    "category_remaining": categoryRemaining,
    "sub_category_usage": subCategoryUsage,
    "sub_category_remaining": subCategoryRemaining,
    "budget_usage": budgetUsage,
    "budget_remaining": budgetRemaining,
    "receipt_usage": receiptUsage,
    "receipt_remaining": receiptRemaining,
  };
}

class UserService {
  int id;
  int planId;
  int categoryNum;
  int subCategoryNum;
  int budget;
  int userNumber;
  int numberOfReceipt;
  int roleNumber;
  int reportPerMonth;
  String customizeReport;
  String userServiceExport;
  String cpaShare;
  String alert;
  String techSupport;

  UserService({
    required this.id,
    required this.planId,
    required this.categoryNum,
    required this.subCategoryNum,
    required this.budget,
    required this.userNumber,
    required this.numberOfReceipt,
    required this.roleNumber,
    required this.reportPerMonth,
    required this.customizeReport,
    required this.userServiceExport,
    required this.cpaShare,
    required this.alert,
    required this.techSupport,
  });

  factory UserService.fromJson(Map<String, dynamic> json) => UserService(
    id: json["id"],
    planId: json["plan_id"],
    categoryNum: json["category_num"],
    subCategoryNum: json["sub_category_num"],
    budget: json["budget"],
    userNumber: json["user_number"],
    numberOfReceipt: json["number_of_receipt"],
    roleNumber: json["role_number"]==null?0: json["role_number"],
    reportPerMonth: json["report_per_month"],
    customizeReport: json["customize_report"],
    userServiceExport: json["export"],
    cpaShare: json["cpa_share"],
    alert: json["alert"],
    techSupport: json["tech_support"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plan_id": planId,
    "category_num": categoryNum,
    "sub_category_num": subCategoryNum,
    "budget": budget,
    "user_number": userNumber,
    "number_of_receipt": numberOfReceipt,
    "role_number": roleNumber,
    "report_per_month": reportPerMonth,
    "customize_report": customizeReport,
    "export": userServiceExport,
    "cpa_share": cpaShare,
    "alert": alert,
    "tech_support": techSupport,
  };
}
