import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/userinfoprofilemodel.dart';

class UserInfoProfileController extends GetxController {
  final userinfoProfile = <Data>[].obs;
  final isLoading = false.obs;
  Rx<TextEditingController> myTextEditingController = TextEditingController().obs;
  Rx<TextEditingController> myTextEditingController1 = TextEditingController().obs;
  Rx<TextEditingController> myTextEditingController2 = TextEditingController().obs;
  Rx<TextEditingController> myTextEditingController3 = TextEditingController().obs;
  Rx<TextEditingController> myTextEditingController4 = TextEditingController().obs;
  Rx<TextEditingController> myTextEditingController5 = TextEditingController().obs;


  @override
  void onInit() {
    fetchUserinfoProfile();
    super.onInit();


  }

  Future<void> fetchUserinfoProfile() async {
    try {
      isLoading.value = true;

      final headers={
        'headers':"Bearer ${usertoken}"
      };

      final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/profile/$d_id'),headers: headers);

      if (response.statusCode == 200) {
        final jsonString = response.body;
        print("::: your info $jsonString");
        final getUserinfoProfile = userInfoProfileModelFromJson(jsonString);
        userinfoProfile.value = [getUserinfoProfile.data];
      }
      else {
        isLoading.value = false;
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      isLoading.value = false;
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
