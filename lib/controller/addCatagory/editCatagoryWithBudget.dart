import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';

class EditCatWithBudget extends  GetxController{

  final isLoading =false.obs;
  final cat_id = ''.obs;
  final updatebudget_amount_per_year = ''.obs;
  final cat_name = ''.obs;

  void setupdatebudget_amount_per_year(String value) => updatebudget_amount_per_year.value = value;
  void setcat_name(String value) => cat_name.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    editCat();
    super.onInit();
  }

  Future<void> editCat() async {

    BudgetController budgetController = Get.find();
    print("mmjnjnj ${cat_name.value} ::: ${updatebudget_amount_per_year.value}");
    final headers={
      'headers':"Bearer ${usertoken}"
    };

    final formData = {
      'user_id':'$d_id',
      'category_id':'${cat_id.value}',
      'update_cat_name':'${cat_name.value}',
      'update_budget_amount':'${updatebudget_amount_per_year.value}',
    };

    final url= Uri.parse('https://$baseurl/api/category/budget/update');

    try{
      isLoading.value = true;
      final response = await http.post(url,headers: headers,body: formData);
      if (response.statusCode == 200) {

        final jsonData= jsonDecode(response.body);
        String mesg = jsonData['msg'];
        print('Login successful!  ${response.body}');
        budgetController.fetchBudgetList();
        Get.back();
        Get.snackbar(
          'Edit successfully',
          '$mesg',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

      }
    } catch (e){
      isLoading.value = false;
      print('Exception: $e');
    } finally{
      isLoading.value = false;
    }
  }

}