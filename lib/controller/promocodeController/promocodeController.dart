import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Sign%20Up/SignUp.dart';
import 'package:k1recipt/View/planSelection/planSelection.dart';
import 'package:k1recipt/constants/global.dart';

class PromoCodeController extends GetxController {
  final promo1 = ''.obs;
  final promo2 = ''.obs;
  final promo3 = ''.obs;
  final promo4 = ''.obs;
  final promo5 = ''.obs;


  void setpromo1(String value) => promo1.value = value;
  void setpromo2(String value) => promo2.value = value;
  void setpromo3(String value) => promo3.value = value;
  void setpromo4(String value) => promo4.value = value;
  void setpromo5(String value) => promo5.value = value;


  Future<void> promoCodeCheck() async {
    final formData = {'promocode': "${promo1.value}${promo2.value}${promo3.value}${promo4.value}${promo5.value}",};
    print("::::::::: ${promo1.value}${promo2.value}${promo3.value}${promo4.value}${promo5.value} ");
    final url = Uri.https(
      '$baseurl',
      '/api/promocode-check',
    );

    if(promo1.value.isEmpty ||promo2.value.isEmpty ||promo3.value.isEmpty ||promo4.value.isEmpty ||promo5.value.isEmpty ){

      Get.snackbar(
        'Failed',
        'Please fill all the fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    else {
      try {
        final response = await http.post(url, body: formData);

        if (response.statusCode == 200) {
          // Login successful, handle the response here
          print('Login successful!  ${response.body}');
          fromPromoCode=true;
          Get.offAll(SignUp());
        }
        else {
          fromPromoCode=false;
        Get.snackbar(
          'Promocode Invalid',
          'Your promodcode is not valid',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // Login failed, handle the error here
        print('Login failed! ${response.body}');
        }
      } catch (e) {
        Get.snackbar(
          'Failed',
          'Check your internet',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        // Error occurred, handle the exception here
        print('Error occurred: $e');
      }
    }
  }
  //
  // Future<void> promoCodeCheck() async {
  //   print(":::::::::::::::");
  //   final formData = {'promocode': "${promo1.value}${promo2.value}${promo3.value}${promo4.value}${promo5.value}",};
  //
  //   print("::::::::: ${promo1.value}${promo2.value}${promo3.value}${promo4.value}${promo5.value} ");
  //   final url = Uri.https(
  //     '$baseurl',
  //     '/api/promocode-check',
  //   );
  //
  //   if(promo1.value.isEmpty ||promo2.value.isEmpty ||promo3.value.isEmpty ||promo4.value.isEmpty ||promo5.value.isEmpty ){
  //     Get.snackbar(
  //       'Failed',
  //       'Please fill all the fields',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  //   else {
  //     try {
  //       final response = await http.post(url, body: formData);
  //
  //       if (response.statusCode == 200) {
  //         // Login successful, handle the response here
  //         print('Login successful!  ${response.body}');
  //        // Get.offAll(SignUp());
  //         Get.offAll((PlanSelection()));
  //       }
  //       else {
  //         Get.snackbar(
  //           'Promocode Invalid',
  //           'Your promodcode is not valid',
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //         );
  //         // Login failed, handle the error here
  //         print('Login failed! ${response.body}');
  //       }
  //     } catch (e) {
  //       Get.snackbar(
  //         'Failed',
  //         'Check your internet',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       // Error occurred, handle the exception here
  //       print('Error occurred: $e');
  //     }
  //   }
  // }

}