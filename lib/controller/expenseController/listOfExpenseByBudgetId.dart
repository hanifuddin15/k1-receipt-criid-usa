import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/ListOfExpenseByBudgetId.dart';
// import 'package:k1recipt/model/getListofSubCatModel.dart';

class ExpenseGetListController extends GetxController {

  //RxList<Datum> subcatList = <Datum>[].obs;
  RxList<Datum> expenseList = <Datum>[].obs;
  var cat_id = ''.obs;
  final loader=false.obs;

  void setcat_name(String value) => cat_id.value = value;

  Future<void> getlistOfExpense(String catid) async {
    print("::::::::: ${catid} ${d_id}");

    // final formData = {
    //
    //   'user_id':'$user_id',
    //   "category_id":"",
    //   'cat_name':'${add_sub_cat_name.value}',
    //   'budget_amount_per_year':'${add_sub_budget_amount_per_year.value}',
    //   'usertype':'Employee',
    // };

    final url = Uri.parse('https://$baseurl/api/expense/list/$d_id/${catid}',);

    final headers={'headers':"Bearer ${usertoken}"};

    try {
      final response = await http.get(url, headers: headers);
      print("::::::::::::: ${response.body}");
      if (response.statusCode == 200) {
        // Login successful, handle the response here

        print('successful!  ${response.body}');
        final jsonData = json.decode(response.body);
        print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
        final subcarListData = ExpenseListByBudgetId.fromJson(jsonData);
        expenseList.assignAll(subcarListData.data as List<Datum>);

        if(expenseList.isEmpty){
          loader.value=true;
        }

        // Get.back();
        // Get.snackbar(
        //   'added successfully',
        //   'Your catagory ${cat_id.value} added successfully',
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );

      }
      else {
        Get.snackbar(
          'Failed',
          'Check your internet',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // Login failed, handle the error here
        print('Login failed! ${response.body}');
      }
    } catch (e) {
      Get.snackbar(
        'Failed',
        'Something went wrong check your internet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }
  }

}