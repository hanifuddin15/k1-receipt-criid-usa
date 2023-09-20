

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:k1recipt/View/forgetPassword/newPasswordWithSecurityCode.dart';
import 'package:k1recipt/View/login%20page/LoginPage.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/getResestFirstStepModel.dart';

class ResetPasswordStepOneController extends GetxController {

  final loading = false.obs;
  final username = ''.obs;
  void setUsername(String value) => username.value = value;

  final user_id=''.obs;
  final securityCode=''.obs;
  final newPassword=''.obs;

  void setuser_id(String value) => user_id.value = value;
  void setSecurityCode(String value) => securityCode.value = value;
  void setNewPassword(String value) => newPassword.value = value;

  Future<void> resetPassword() async {
    loading.value=true;
    print("::::::::: ${username.value}");
    // loading.value = true;
    // setloading(true);
    print("JKJKJ ${loading.value}");
    final url = Uri.https(
      'dev.k1receipt.com',
      '/api/match_mobile_number',
      {'email': username.value, },
    );
    print("${username.value}");
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final msg = jsonData['msg'];
        final data = jsonData['data']['resend_expired'];
        final userriid=jsonData['data']['userid'];
        //setuser_id(userriid.toString());

        //getResestFirstStepModelFromJson(jsonData);
        print(":::::::$userriid");
        Get.offAll(() => SecurityCodeNewPassword(userID: "${userriid.toString()}",));
        Get.back();
        Get.snackbar(
          'Security code sent successfully',
          '$msg and expire $data',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
      else {
        loading.value = false;
        Get.snackbar(
          'Login Failed',
          'Invalid username or password.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // Login failed, handle the error here
        print('Login failed! ${response.body}');
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Failed',
        'Check your email or internet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }finally{
      loading.value = false;
    }
  }

  Future<void> resetPassword2(String useriid) async {
    loading.value=true;
    print("::::::::: ${useriid} ${securityCode.value} ${newPassword.value}");
    // loading.value = true;
    // setloading(true);

    final formData = {
      'userid':'${useriid}',
      'otp':'${securityCode.value}',
      'password':'${newPassword.value}',
    };

    String apiUrl = 'https://dev.k1receipt.com/api/code_combination';
    //final url = '$baseurl/api/code_combination';

    try {
      final response = await http.post( Uri.parse(apiUrl),body: formData);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final msg = jsonData['msg'];
        // final data = jsonData['data']['resend_expired'];
        // user_id.value=jsonData['data']['userid'];
        // print(":::::::$jsonData");

        Get.offAll(() => LoginPage());
        Get.snackbar(
          'New passoword set successfully',
          '$msg',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
      else {
        loading.value = false;
        Get.snackbar(
          'Login Failed',
          'Invalid username or password.',
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
      print('Error occurred: $e');
    }finally{
      loading.value = false;
    }
  }

}
