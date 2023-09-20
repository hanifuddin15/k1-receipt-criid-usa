

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/constants/global.dart';



class ExpenseAddController extends GetxController {

  final totalamount = ''.obs;
  final note = ''.obs;
  final shopname=''.obs;
  final loading =false.obs;

  void settotalamount(String value) => totalamount.value = value;
  void setnote(String value) => note.value = value;
  void setshopname(String value) => shopname.value = value;

  // void setshopname(String value) {
  //   shopname.value = value;
  // }

  Future<void> addExpense(String dropdown, String subdropdown, String date, File img) async {
    print(":::::::::::::imgggggggggg  date: $date totalamount: ${ totalamount.value.toString()} user_id: ${user_id} dropdown: ${dropdown} subdropdown: ${subdropdown}");

    loading.value=true;
    final random = Random();
    final random1 = Random();

    final randomNumber = random.nextInt(22) * random1.nextInt(41);

    final url = Uri.parse('https://$baseurl/api/expense/add');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Set the headers
    request.headers['Authorization'] = 'Bearer $usertoken';

    // Add the fields to the request body
    request.fields['budget_id'] = '$randomNumber';
    request.fields['user_id'] = '$d_id';
    request.fields['category_id'] = dropdown;
    request.fields['sub_category_id'] = subdropdown.isEmpty?'':subdropdown;
    // request.fields['sub_cat_name'] = "chezx";
    request.fields['expense_amount'] = totalamount.value.toString();
    request.fields['expense_shop_name'] = "${shopname.value}";
    // request.fields['budget_amount_per_year'] = "1234";
    request.fields['purchasing_date'] = date;

    // Add the image file to the request
    if (img != null) {
      var stream = http.ByteStream(img.openRead());
      var length = await img.length();
        print("::::::::::::::shit $stream $length :::::: ");
      var multipartFile = http.MultipartFile('receipt_img', stream, length, filename: img.path.split('/').last);
      request.files.add(multipartFile);
    }

    try {
      // Send the request and wait for the response
      var response = await request.send();

      if (response.statusCode == 200) {
        // Expense added successfully, handle the response here
        print('Expense added successfully ');
        var responseStream = await response.stream.bytesToString();
        print('Response Body: $responseStream :::');

        //Get.back();
        Get.offAll(() => BottomAnimatedBar3()); // Navigate to the expense list screen
        Get.snackbar(
          'Added successfully',
          'Your Expense added successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Failed to add expense, handle the error here
        print('Failed to add expense! Status code: ${response.stream.bytesToString()}');

        Get.snackbar(
          'Failed',
          'Failed to add expense.Upgrade your plan and try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

      }
    } catch (e) {
      // Error occurred, handle the exception here
      Get.snackbar(
        'Failed',
        'Something went wrong. Check your internet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error occurred: $e');
    }
    loading.value=false;
  }

  // Future<void> addexpense(String dropdown,String subdropdown,String date,File img) async {
  //
  //
  //   print(":::::::::::::imgggggggggg  ${img}");
  //
  //
  //
  //   final random = Random();
  //   final random1 = Random();
  //
  //   final randomNumber = random.nextInt(22) * random1.nextInt(41);
  //
  //   final formData = {
  //     'budget_id':'${randomNumber}',
  //     'user_id':'$user_id',
  //     "category_id":"$dropdown",
  //     'sub_cat_name':'${subdropdown}',
  //     'expense_amount':'${totalamount.value}',
  //     'expense_shop_name':'$usertype',
  //     'receipt_img':img,
  //     'purchasing_date':'$usertype',
  //   };
  //
  //   final url = Uri.parse(
  //     'https://$baseurl/api/subcategory/budget/create',
  //   );
  //
  //   final headers = {
  //     'headers':"Bearer ${usertoken}"
  //   };
  //
  //   try {
  //
  //     final response = await http.post(url, body: formData,headers: headers);
  //
  //     print("::::::::::::: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       // Login successful, handle the response here
  //       print('Expense added successful! ${response.body}');
  //       Get.back();
  //       Get.snackbar(
  //         'Added successfully',
  //         'Your Expense added successfully',
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //       );
  //
  //     }
  //     else {
  //
  //       Get.snackbar(
  //         'Failed',
  //         'Check your internet',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       // Login failed, handle the error here
  //       print('Login failed! ${response.body}');
  //
  //     }
  //   } catch (e) {
  //
  //     Get.snackbar(
  //       'Failed',
  //       'Something went wrong check your internet',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     // Error occurred, handle the exception here
  //     print('Error occurred: $e');
  //
  //   }
  // }
}