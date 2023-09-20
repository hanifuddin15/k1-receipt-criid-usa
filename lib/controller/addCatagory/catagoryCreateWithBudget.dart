

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Budget%20Details/Budgetdetails.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';



class AddCatagoryController extends GetxController {
  final cat_name = ''.obs;
  final budget_amount_per_year = ''.obs;

  void setcat_name(String value) => cat_name.value = value;
  void setbudget_amount_per_year(String value) => budget_amount_per_year.value = value;

  Future<void> addcat() async {
    BudgetController budgetController = Get.find();
    print("::::::::: ${usertype} ${cat_name.value} ${budget_amount_per_year.value} ${user_id}");

    final formData = {
      'user_id':'$d_id',
      'cat_name':'${cat_name.value}',
      'budget_amount_per_year':'${budget_amount_per_year.value}',
      'usertype':'$usertype',
    };

    final url = Uri.parse('https://$baseurl/api/category/budget/create',);

    final headers={
      'headers':"Bearer ${usertoken}"
    };

    try {
      final response = await http.post(url, body: formData, headers: headers);

      print("KKKKKKK ${response.body}");

      if(response.body.toString().substring(0,14)=="<!DOCTYPE html"){

      }
      else {
        print(":::::::::::::budget add ${response.body}");
        if (response.statusCode == 200) {
          // Login successful, handle the response here
          print('Catagory added ${response.body}');
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
          }else {
          budgetController.fetchBudgetList();
          Get.back();
          Get.snackbar(
            'Added successfully',
            'Your catagory ${cat_name.value} added successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );}
        }
        else {
          Get.snackbar(
            'Failed',
            'Check your internet or something went wrong from server',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          // Login failed, handle the error here
          print('!!!!!!! ${response.body}');
        }
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