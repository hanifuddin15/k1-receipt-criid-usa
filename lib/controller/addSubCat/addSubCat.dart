

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';



class SubCatagoryAddController extends GetxController {

  final add_sub_cat_name = ''.obs;
  final add_sub_budget_amount_per_year = ''.obs;

  void setsubcat_name(String value) => add_sub_cat_name.value = value;
  void setsub_budget_amount_per_year(String value) => add_sub_budget_amount_per_year.value = value;
  GetListSubCatController getListSubCatController=Get.put(GetListSubCatController());
  Future<void> addsubcat(String catid) async {
    print("::::::::: $catid ${usertype} ${add_sub_cat_name.value} ${add_sub_budget_amount_per_year.value} ${user_id}");

    final formData = {
      'user_id':'$d_id',
      "category_id":"$catid",
      'sub_cat_name':'${add_sub_cat_name.value}',
      'budget_amount_per_year':'${add_sub_budget_amount_per_year.value}',
      //'usertype':'$usertype',
      "cat_description":"any",
    };

    final url = Uri.parse(
      'https://$baseurl/api/subcategory/budget/create',
    );

    final headers = {'headers':"Bearer ${usertoken}" };

    try {
      final response = await http.post(url, body: formData,headers: headers);
      print("::::::::::::: ${response.body}");
      if (response.statusCode == 200) {
        // Login successful, handle the response here
        print('Login successful!  ${response.body}');
        final jsonData= jsonDecode(response.body);
        bool error=true;
        error=jsonData['error'];
        String msg=jsonData['msg'];

        print("aaaaaaaaaaaaaaaaaaa $error $msg");

        if(error==true){
          Get.snackbar(
            'Failed',
            '$msg',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }else{
        getListSubCatController.getlistOfSubCat(catid);
          Get.back();
          Get.back();
          Get.snackbar(
            'added successfully',
            'Your catagory ${add_sub_cat_name.value} added successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
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