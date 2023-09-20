import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:k1recipt/constants/global.dart';
class ChangePasswordController extends GetxController {

  final loading = false.obs;
  final user_id = ''.obs;
  final old_password = ''.obs;
  final new_password = ''.obs;
  final confirm_password = ''.obs;

  void setuser_id(String value) => old_password.value = value;
  void setold_password(String value) => old_password.value = value;
  void setnew_password(String value) => old_password.value = value;
  void setconfirm_password(String value) => old_password.value = value;

  Future<void> ChangePassword() async {

    loading.value=true;
    print("::::::::: $user_id.value}");
    print("::::::::: ${old_password.value}");
    print("::::::::: ${new_password.value}");
    print("::::::::: ${confirm_password.value}");
    // loading.value = true;
    // setloading(true);
    print("JKJKJ ${loading.value}");
    final url = Uri.parse('https://dev.k1receipt.com/api/change_password',);
    try {

      final response = await http.post(url);
      if (response.statusCode == 200) {

        final jsonData = jsonDecode(response.body);

        final msg = jsonData['msg'];
        final data = jsonData['data']['resend_expired'];
        Get.back();
        Get.snackbar(
          'Password updated successfully.',
          '$msg and expire $data',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );


      }
      else {
        loading.value = false;
        Get.snackbar(
          'Login Failed',
          'Invalid password.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // Login failed, handle the error here
        print('Login failed! ${response.body}');
      }

    } catch (e) {

      loading.value = false;
      Get.snackbar(
        'Login Failed',
        'Check your internet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      // Error occurred, handle the exception here
      print('Error occurred: $e');

    }finally{
      loading.value = false;
    }

  }

}