import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/constants/global.dart';
import 'dart:convert';

import 'package:k1recipt/model/employeeListModel.dart';


class EmployeeListController extends GetxController {

  // final budgetList = <Budget>[].obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchBudgetList();
  // }
  //
  // void fetchBudgetList() async {
  //   print(":::::::::::::::lksajdhflksajdhfkjdsa $usertoken");
  //   final url = Uri.parse('https://dev.k1receipt.com/api/allcategory/withbudgetList/165');
  //   final headers = {
  //     'Authorization': 'Bearer $usertoken',
  //   };
  //
  //   final response = await http.get(url, headers: headers);
  //
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     final budgetJsonList = jsonData['Budget List'] as List<dynamic>;
  //
  //     final budgets = budgetJsonList.map((json) => Budget.fromJson(json)).toList();
  //     budgetList.assignAll(budgets);
  //   } else {
  //     // Handle error
  //     print('Error fetching budget list');
  //   }
  // }

  RxList<Datum> budgetList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchemployeeList();
  }

  void fetchemployeeList() async {

    // final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/165');
    // final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/');

    print("::::::::::::::::::: %%% $d_id");
    final url = Uri.parse('https://$baseurl/api/get-employee-list/$d_id');


    final headers = {
      'Authorization': 'Bearer $usertoken',
    };

    final response = await http.get(url, headers: headers);
    print("mmmmmmmmmmmmmmm ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("mmmmmmmmmmmmmmmm ${jsonData}");
      final budgetListData = EmployeList.fromJson(jsonData);
      budgetList.assignAll(budgetListData.data as List<Datum>);
    } else {
      // Handle error
      print('Error fetching budget list');
    }

  }

}

