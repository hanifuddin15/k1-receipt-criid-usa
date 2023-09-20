import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';



class EditSubCatWithBudget extends  GetxController{

  final isLoading =false.obs;
  final cat_id = ''.obs;
  final updatebudget_amount_per_year = ''.obs;
  final cat_name = ''.obs;
  void setupdatebudget_amount_per_year(String value) => updatebudget_amount_per_year.value = value;



  final user_id = ''.obs;
  final category_id = ''.obs;
  final sub_category_id = ''.obs;
  final update_sub_cat_name = ''.obs;
  final update_budget_amount = ''.obs;

  void setupdate_sub_cat_name(String value) => update_sub_cat_name.value = value;

  void setupdate_budget_amount(String value) => updatebudget_amount_per_year.value = value;



  @override
  void onInit() {
    // TODO: implement onInit
    editSubCat();
    super.onInit();
  }

  Future<void> editSubCat() async {

    GetListSubCatController getListSubCatController = Get.find();

    final headers={
      'headers':"Bearer ${usertoken}"
    };

    final formData = {
      'user_id':'$d_id',
      'category_id':'${category_id.value}',
      'sub_category_id':'${sub_category_id.value}',
      'update_sub_cat_name':'${update_sub_cat_name.value}',
      'update_budget_amount':'${updatebudget_amount_per_year.value}',
    };

    final url= Uri.parse('https://$baseurl/api/subcategory/budget/update');
    print( "kkkkkk JJJJJ KKKKKKK $d_id ::: ${category_id.value} ::: ${sub_category_id.value} ::: ${update_sub_cat_name.value} :::${updatebudget_amount_per_year.value}");
    bool update=false;
    try{

      isLoading.value=true;
      final response = await http.post(url,headers: headers,body: formData);
      if (response.statusCode == 200) {

        // final jsonData= jsonDecode(response.body);
        // String mesg = jsonData['msg'];
        update=true;
        getListSubCatController.getlistOfSubCat(cat_id.value);
        print('Login successful! ${response.body}');
        Get.back();
        Get.snackbar(
          'Edit successfully',
          'Sub Catagory edit successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

      }
    } catch (e){
      isLoading.value=false;
      print('Exception: $e');
      // update==true? null: Get.snackbar(
      //   'Failed',
      //   'Failed to edit Sub Catagory',
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    } finally{
      isLoading.value=false;
    }

  }
}