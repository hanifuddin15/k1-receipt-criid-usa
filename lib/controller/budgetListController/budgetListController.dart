import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/constants/global.dart';
import 'dart:convert';

import 'package:k1recipt/model/budgetlistmodel.dart';

class BudgetController extends GetxController {

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
  final loader =false.obs;
  RxInt selectedButtonIndex = RxInt(-1);
  @override
  void onInit() {
    super.onInit();
    fetchBudgetList();
  }

  void fetchBudgetList() async {

    // final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/165');
    // final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/$user_id');

    print("budgeeeeeeeeeettttt $user_id ::: $baseurl :::: $usertype ::: $usertoken");
    final url = Uri.parse('https://$baseurl/api/category/withbudgetList/$d_id');

    final headers = {
      'Authorization': 'Bearer $usertoken',
    };

    final response = await http.get(url, headers: headers);
    print("::::::::::::::::::::;kkkkkk ${response.body.toString().substring(0,14)}");
    // print
     if(response.body.toString().substring(0,14)=="<!DOCTYPE html"){
      final url1 = Uri.parse('https://$baseurl/api/budget/show/$d_id');

      final responsee = await http.get(url1, headers: headers);

       if (responsee.statusCode == 200) {
         getbudgets=true;
         final jsonData = json.decode(responsee.body);
         print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
         final budgetListData = BudgetList.fromJson(jsonData);
         budgetList.assignAll(budgetListData.data as List<Datum>);
       } else {
         // Handle error
         print('Error fetching budget list');
       }
     }
     else {
     if (response.statusCode == 200) {
         getbudgets = true;
         final jsonData = json.decode(response.body);
         print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
         final budgetListData = BudgetList.fromJson(jsonData);
         budgetList.assignAll(budgetListData.data as List<Datum>);
         if(budgetList.isEmpty){
           loader.value=true;
         }
       } else {
         // Handle error
         print('Error fetching budget list');
       }
     }
  }

}

