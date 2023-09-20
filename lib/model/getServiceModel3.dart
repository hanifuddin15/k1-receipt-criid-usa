// To parse this JSON data, do
//
//     final getServicesOfPlan3 = getServicesOfPlan3FromJson(jsonString);

import 'dart:convert';

GetServicesOfPlan3 getServicesOfPlan3FromJson(String str) => GetServicesOfPlan3.fromJson(json.decode(str));

String getServicesOfPlan3ToJson(GetServicesOfPlan3 data) => json.encode(data.toJson());

class GetServicesOfPlan3 {
  bool error;
  String msg;
  List<Datum> data;

  GetServicesOfPlan3({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory GetServicesOfPlan3.fromJson(Map<String, dynamic> json) => GetServicesOfPlan3(
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

  String planName;
  String description;
  int durationInDays;
  int maxServiceLimit;
  int planId;
  int id;
  int categoryNum;
  int subCategoryNum;
  int budget;
  int userNumber;
  int numberOfReceipt;
  dynamic roleNumber;
  int reportPerMonth;
  String customizeReport;
  String datumExport;
  String cpaShare;
  String alert;
  String techSupport;
  double pricePerMonth;

  Datum({
    required this.planName,
    required this.description,
    required this.durationInDays,
    required this.maxServiceLimit,
    required this.planId,
    required this.id,
    required this.categoryNum,
    required this.subCategoryNum,
    required this.budget,
    required this.userNumber,
    required this.numberOfReceipt,
    this.roleNumber,
    required this.reportPerMonth,
    required this.customizeReport,
    required this.datumExport,
    required this.cpaShare,
    required this.alert,
    required this.techSupport,
    required this.pricePerMonth,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    planName: json["plan_name"],
    description: json["description"],
    durationInDays: json["duration_in_days"] ?? 0,
    maxServiceLimit: json["max_service_limit"] ?? 0,
    planId: json["plan_id"] ?? 0,
    id: json["id"] ?? 0,
    categoryNum: json["category_num"] ?? 0,
    subCategoryNum: json["sub_category_num"] ?? 0,
    budget: json["budget"] ?? 0,
    userNumber: json["user_number"] ?? 0,
    numberOfReceipt: json["number_of_receipt"] ?? 0,
    roleNumber: json["role_number"],
    reportPerMonth: json["report_per_month"] ?? 0,
    customizeReport: json["customize_report"],
    datumExport: json["export"],
    cpaShare: json["cpa_share"],
    alert: json["alert"],
    techSupport: json["tech_support"],
    pricePerMonth: json["price_per_month"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "plan_name": planName,
    "description": description,
    "duration_in_days": durationInDays,
    "max_service_limit": maxServiceLimit,
    "plan_id": planId,
    "id": id,
    "category_num": categoryNum,
    "sub_category_num": subCategoryNum,
    "budget": budget,
    "user_number": userNumber,
    "number_of_receipt": numberOfReceipt,
    "role_number": roleNumber,
    "report_per_month": reportPerMonth,
    "customize_report": customizeReport,
    "export": datumExport,
    "cpa_share": cpaShare,
    "alert": alert,
    "tech_support": techSupport,
    "price_per_month": pricePerMonth,
  };

}
