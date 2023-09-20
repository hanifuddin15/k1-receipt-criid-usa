import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Budget%20Details/Budgetdetails.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';


class EditUserInfoController extends GetxController {
  final business_name = ''.obs;
  final productOrservices = ''.obs;
  final line_of_business = ''.obs;
  final corporation_type = ''.obs;
  final state = ''.obs;


  void setbusiness_name(String value) => business_name.value = value;
  void setproductOrservices(String value) => productOrservices.value = value;
  void setline_of_business(String value) => line_of_business.value = value;
  void setcorporation_type(String value) => corporation_type.value = value;
  void setstate(String value) => state.value = value;


  Future<void> editUserInfo() async {

    final formData = {
      'user_id':'$d_id',
      'business_name':'${business_name.value}',
      'productOrservices':'${productOrservices.value}',
      'line_of_business':'${line_of_business.value}',
      'corporation_type':'${corporation_type.value}',
      'state':'${state.value}',
    };

    final url = Uri.parse('https://$baseurl/api/profile/update',);

    final headers={
      'headers':"Bearer ${usertoken}"
    };

    try {
      final response = await http.post(url, body: formData,headers: headers);

      print("KKKKKKK ${response.body}");

      if(response.body.toString().substring(0,14)=="<!DOCTYPE html"){

      }
      else {
        print(":::::::::::::budget add ${response.body}");
        if (response.statusCode == 200) {
          // Login successful, handle the response here
          print('Login successful!  ${response.body}');

          //Get.back();
          Get.snackbar(
            'Edit successfully',
            'You added successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
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