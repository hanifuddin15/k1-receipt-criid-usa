import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Promo%20Code/Promocode.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/UserInfoController/edituserInfoController.dart';
import 'package:k1recipt/controller/UserInfoController/userInfoController.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addCatagory/deleteCatWithBugetController.dart';
import 'package:k1recipt/controller/addCatagory/editCatagoryWithBudget.dart';
import 'package:k1recipt/controller/addSubCat/addSubCat.dart';
import 'package:k1recipt/controller/addSubCat/checkSubCatReaming.dart';
import 'package:k1recipt/controller/addSubCat/delSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/editSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/addemployeecontroller/AddEmployeeController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/employeeListController/employeeListContoller.dart';
import 'package:k1recipt/controller/employee_registration/employee_registration.dart';
import 'package:k1recipt/controller/expenseController/expenseEditController.dart';
import 'package:k1recipt/controller/promocodeController/promocodeController.dart';
import 'package:k1recipt/controller/usageInformation/userUsageInfoController.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  final username = ''.obs;
  final password = ''.obs;
  final loading=false.obs;
  final obscurePassword = true.obs;
  final isChecked = false.obs;

  // TextEditingController a=''.obs as TextEditingController;
  // TextEditingController b=''.obs as TextEditingController;

  void togglePasswordVisibility() => obscurePassword.toggle();
  void setUsername(String value) => username.value = value;
  void setPassword(String value) => password.value = value;
  void setloading(bool value) => loading.value = value;

  void handleRemeberme(bool val) {

    isChecked.value = val;
    print("Handle Rember Me $isChecked");

    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", val);
        prefs.setString('email', username.value.toString());
        prefs.setString('password', password.value.toString());
      },
    );
      isChecked.value = val;
  }

  void loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);

      if (_remeberMe) {
          isChecked.value = true;
          username.value= _email ?? "";
          password.value = _password ?? "";
          setUsername(username.value);
          setPassword(password.value);
          // a.text=username.value.toString();
          // b.text=password.value.toString();

      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login() async {
    loading.value=true;

    print("::::::::: ${username.value} ${password.value}");
    // loading.value = true;
    // setloading(true);
    print("JKJKJ ${loading.value}");
    final url = Uri.https(
      'dev.k1receipt.com',
      '/api/user_login',
      {'username': username.value, 'password': password.value},
    );

    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        // Login successful, handle the response here
        print('Login successful!  ${response.body}');
        final jsonData = jsonDecode(response.body);
        var userType = jsonData['data']['usertype'];

        final data = jsonData['data'];
        final mobileid = jsonData['data']['mobile'];
        final id = jsonData['data']['id'];

        final name = jsonData['data']['name'];
        final email = jsonData['data']['email'];
        final address = jsonData['data']['address'];
        final username = jsonData['data']['username'];
        final unique_id = jsonData['data']['id'];

        g_name=name;
        g_email=email;
        g_username=username;
        g_address=address;
        d_id=unique_id.toString();

        var accessToken = data['jwt_token'][0]['original']['access_token'];
        print("::::::userrrrrrrrrrrr $accessToken :::: $mobileid :::: $userType ::: $id");
        usertoken=accessToken.toString();
        user_id=mobileid.toString();
        usertype=userType.toString();
        databaseid=id.toString();

        //print("::::::userrrrrrrrrrrr $accessToken");
        print("User Type: $userType");
        Get.put(BudgetController());
        Get.put(EmployeeRegistrationController());
        Get.put(AddCatagoryController());
        Get.put(GetListSubCatController());
        Get.put(SubCatagoryAddController());
        Get.put(PromoCodeController());
        Get.put(AddEmployeeController());
        Get.put(EditUserInfoController());
        Get.put(UserInfoProfileController());
        Get.put(UserUsageInfoController());
        Get.put(EditExpenseController());
        Get.put(DeleteCatWithBudgetController());
        Get.put(DeleteSubCatController());
        Get.put(CheckSubCatReamingController());
        Get.put(EmployeeListController());

        BudgetController ll= Get.put(BudgetController());
        if(userType=='Employee' || getbudgets==true){
          Get.offAll(() => BottomAnimatedBar());
        }
        else{
        if(getbudgets==false||ll.budgetList.isEmpty){
          print("lllllll ${ll.budgetList.length}");
          Timer(Duration(seconds: 2), () {

            if(getbudgets==false){
              Timer(Duration(seconds: 2), () {
                if(getbudgets==false){
                  Timer(Duration(seconds: 2), () {
                    if(getbudgets==false){
                    }else{
                      loading.value = false;
                      Get.offAll(() => BottomAnimatedBar());
                    }
                    // Code to be executed after the delay
                  });
                }
                else{
                  loading.value = false;
                  Get.offAll(() => BottomAnimatedBar());
                }
                // Code to be executed after the delay
              });
            }
            else{
              loading.value = false;
              Get.offAll(() => BottomAnimatedBar());
            }

          });
        }
        else{
          print(":::::::; ${ll.budgetList.length}");
          if(userType=="Employee"){
            Get.offAll(BottomAnimatedBar());
          }
          else if(userType=="Company"){
            print(":::::::::::::::: ");
            Get.offAll(BottomAnimatedBar());
            //  Get.offAll(PromocodePage());
          }
          else if(userType=="General_User"){
          print(":::::::::::::::: ");
          Get.offAll(BottomAnimatedBar());
          //  Get.offAll(PromocodePage());
        }
        }
        }
        //Get.offAll(BottomAnimatedBar());
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

      // Error occurred, handle the exception here
      print('Error occurred: $e');

    }
    loading.value = false;
  }

}