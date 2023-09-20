import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/login%20page/LoginPage.dart';
import 'package:k1recipt/View/planSelection/planSelection.dart';
import 'package:k1recipt/constants/global.dart';

class EmployeeRegistrationController extends GetxController {
  final isloading = false.obs;
  final userId = ''.obs;
  final firstName = ''.obs;
  final lastName = ''.obs;
  final mobile = ''.obs;
  final email = ''.obs;
  final userType = ''.obs;
  final password = ''.obs;
  final conformpassword = ''.obs;
  final registeredBy = ''.obs;
  final companyId = ''.obs;
  final obscurePassword = true.obs;
  final conformobscurePassword = true.obs;

  void conformtogglePasswordVisibility() => conformobscurePassword.toggle();
  void togglePasswordVisibility() => obscurePassword.toggle();
  void setCompanyId(String value) => companyId.value = value;
  void setUserId(String value) => userId.value = value;
  void setFirstName(String value) => firstName.value = value;
  void setLastName(String value) => lastName.value = value;
  void setMobile(String value) => mobile.value = value;
  void setEmail(String value) => email.value = value;
  void setUserType(String value) => userType.value = value;
  void setPassword(String value) => password.value = value;
  void setconfromPassword(String value) => conformpassword.value = value;
  void setRegisteredBy(String value) => registeredBy.value = value;

  Future<void> registerEmployee() async {
    final random = Random();
    final random1 = Random();
    final randomNumber = random.nextInt(823) * random1.nextInt(121);
    final url = Uri.https(
      'dev.k1receipt.com',
      '/api/employee_registration',
    );
    final formData = {
      'user_id': randomNumber.toString(),
      'firstname': firstName.value,
      'lastname': lastName.value,
      'mobile': mobile.value,
      'email': email.value,
      'usertype':"Employee",
      'password': password.value,
      'registered_by': registeredBy.value,
    };
    print(":::::::::::::: klklkl ${userType.value}");
    try {
      isloading.value=true;
      if(firstName.value.isEmpty || lastName.value.isEmpty || mobile.value.isEmpty || password.value.isEmpty){
        print("::::::;; ${firstName.value}");
        Get.snackbar(
          'Incomplete Form',
          'Please fill all the required fields below',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if(conformpassword.value!=password.value){
        Get.snackbar(
          '''Passwords doesn't Match''',
          '''Password and Confirm Password should be same''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if(!email.value.contains('@') || !email.value.contains('.')){
        Get.snackbar(
          '''Email Format''',
          '''Please insert valid email''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else{
        final response = await http.post(url, body: formData);

        if (response.statusCode == 200) {
          // Registration successful, handle the response here
          print('Employee registration successful! ${response.body}');
          Get.offAll(LoginPage());

        } else {
          final decodedResponse = jsonDecode(response.body);
          final msg = decodedResponse['msg'];

          if(msg.toString().contains('exists in server.')){
            Get.snackbar(
              '''Already exists''',
              '''Email or Mobile number already exists''',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
          // Registration failed, handle the error here
          print('Employee registration failed! ${msg} \n ${response.body}');
        }
      }
      var a;
      // final response = await http.post(url, body: formData);
      //
      // if (response.statusCode == 200) {
      //   // Registration successful, handle the response here
      //   print('Employee registration successful! ${response.body}');
      //
      //
      // } else {
      //   // Registration failed, handle the error here
      //   print('Employee registration failed!');
      // }
    } catch (e) {
      isloading.value=false;
      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }finally{
      isloading.value=false;
    }
  }

  Future<void> registerCompany() async {

    final random = Random();
    final random1 = Random();
    final randomNumber = random.nextInt(823) * random1.nextInt(121);
    final url = Uri.https('$baseurl', '/api/user_registration');

    print("::::::::: ${firstName.value}  ::: ${ lastName.value.toString()} ::: ${mobile.value.toString()} ::: ${email.value.toString()} ::: ${userType.value} ::: ${password.value.toString()} ::: ${registeredBy.value.toString()}");

    final formData = {
      //'user_id': randomNumber.toString(),
      'firstname': firstName.value.toString(),
      'lastname': lastName.value.toString(),
      'mobile': "${mobile.value.toString()}",
      'email': email.value.toString(),
      'usertype': "${userType.value}",
      'password': password.value.toString(),
      "promocode":''
      // 'registered_by': registeredBy.value.toString(),
    };

    try {
      isloading.value=true;
      if (firstName.value.isEmpty || lastName.value.isEmpty || mobile.value.isEmpty || password.value.isEmpty) {
        Get.snackbar(
          'Incomplete Form',
          'Please fill all the required fields below',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if (conformpassword.value != password.value) {
        Get.snackbar(
          '''Passwords don't Match''',
          '''Password and Confirm Password should be the same''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if (!email.value.contains('@') || !email.value.contains('.')) {
        Get.snackbar(
          '''Email Format''',
          '''Please insert a valid email''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else {
        final response = await http.post(url, body: formData);
        print("kia kkk ${response.statusCode}");
        if (response.statusCode == 200) {
          print("fasd");
          final decodedResponse = jsonDecode(response.body);
          final taha=decodedResponse['data']['id'].toString();
            d_id="${taha.toString()}";
          print("::::::::::::: $d_id  $decodedResponse");
          // Registration successful, handle the response here
          print('Employee registration successful! ${response.body}');
          if (fromPromoCode == true) {
            Get.offAll(PlanSelection(mobile:  mobile.value,password: password.value,));
          } else {
            Get.offAll(LoginPage());
          }
        }
        else {
          final decodedResponse = jsonDecode(response.body);
          final msg = decodedResponse['msg'];
          d_id=decodedResponse['data']['id'].toString();
          print("::::::::::::: $d_id");
          if (msg.toString().contains('exists in server.')) {
            Get.snackbar(
              '''Already exists''',
              '''Email or Mobile number already exists''',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
          // Registration failed, handle the error here
          print('Employee registration failed! $msg \n ${response.body}');
        }
      }
    } catch (e) {
      isloading.value=false;
      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }finally{
      isloading.value=false;
    }

  }

  // Future<void> registerCompany() async {
  //   final random = Random();
  //   final random1 = Random();
  //
  //   final randomNumber = random.nextInt(823) * random1.nextInt(121);
  //   final url = Uri.https(
  //     '$baseurl',
  //     '/api/user_registration',
  //   );
  //
  //   final formData = {
  //     'user_id': randomNumber.toString(),
  //     'firstname': firstName.value,
  //     'lastname': lastName.value,
  //     'mobile': mobile.value,
  //     'email': email.value,
  //     'usertype':"${userType.value}",
  //     'password': password.value,
  //     'registered_by': registeredBy.value,
  //   };
  //
  //   print(":::::::::::::aksjd ${userType.value}");
  //   try {
  //
  //     if(firstName.value.isEmpty || lastName.value.isEmpty || mobile.value.isEmpty || password.value.isEmpty){
  //       print("::::::;; ${firstName.value}");
  //       Get.snackbar(
  //         'Incomplete Form',
  //         'Please fill all the required fields below',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //     else if(conformpassword.value!=password.value){
  //       Get.snackbar(
  //         '''Passwords doesn't Match''',
  //         '''Password and Confirm Password should be same''',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //     else if(!email.value.contains('@') || !email.value.contains('.')){
  //       Get.snackbar(
  //         '''Email Format''',
  //         '''Please insert valid email''',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //     else{
  //
  //       final response = await http.post(url, body: formData);
  //       if (response.statusCode == 200) {
  //         // Registration successful, handle the response here
  //         print('Employee registration successful! ${response.body}');
  //         Get.offAll(LoginPage());
  //       } else {
  //         final decodedResponse = jsonDecode(response.body);
  //         final msg = decodedResponse['msg'];
  //         if(msg.toString().contains('exists in server.')){
  //           Get.snackbar(
  //             '''Already exists''',
  //             '''Email or Mobile number already exists''',
  //             backgroundColor: Colors.red,
  //             colorText: Colors.white,
  //           );
  //         }
  //         // Registration failed, handle the error here
  //         print('Employee registration failed! ${msg} \n ${response.body}');
  //       }
  //     }
  //
  //     var a;
  //
  //     // final response = await http.post(url, body: formData);
  //     //
  //     // if (response.statusCode == 200) {
  //     //   // Registration successful, handle the response here
  //     //   print('Employee registration successful! ${response.body}');
  //     //
  //     //
  //     // } else {
  //     //   // Registration failed, handle the error here
  //     //   print('Employee registration failed!');
  //     // }
  //
  //   } catch (e) {
  //
  //     // Error occurred, handle the exception here
  //     print('Error occurred: $e');
  //
  //   }
  // }

  Future<void> registerGeneralUser() async {

    print("LLLLLLLLLLLLL ");
    final random = Random();
    final random1 = Random();

    final randomNumber = random.nextInt(823) * random1.nextInt(121);

    final url = Uri.https(
      'dev.k1receipt.com',
      '/api/LoginWithThirdPartyApi',
    );

    final formData = {
      'user_id': randomNumber.toString(),
      'firstname': firstName.value,
      'lastname': lastName.value,
      'mobile': mobile.value,
      'email': email.value,
      'usertype': "General_User",
      'password': password.value,
      'registered_by': "App",
      "promocode":"",
      "plan_id":"",
    };

    print(":::::::::::::: klklkl ${userType.value}");
    try {
      isloading.value=true;

      if(firstName.value.isEmpty || lastName.value.isEmpty || mobile.value.isEmpty || password.value.isEmpty){
        print("::::::;; ${firstName.value}");
        Get.snackbar(
          'Incomplete Form',
          'Please fill all the required fields below',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if(conformpassword.value!=password.value){
        Get.snackbar(
          '''Passwords doesn't Match''',
          '''Password and Confirm Password should be same''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else if(!email.value.contains('@') || !email.value.contains('.')){
        Get.snackbar(
          '''Email Format''',
          '''Please insert valid email''',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      else{
        final response = await http.post(url, body: formData);

        if (response.statusCode == 200) {
          // Registration successful, handle the response here
          print('General User registration successful! ${response.body}');
          Get.offAll(LoginPage());

        } else {
          final decodedResponse = jsonDecode(response.body);
          final msg = decodedResponse['msg'];

          if(msg.toString().contains('exists in server.')){
            Get.snackbar(
              '''Already exists''',
              '''Email or Mobile number already exists''',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
          // Registration failed, handle the error here
          print('Employee registration failed! ${msg} \n ${response.body}');
        }
      }

      var a;

      // final response = await http.post(url, body: formData);
      //
      // if (response.statusCode == 200) {
      //   // Registration successful, handle the response here
      //   print('Employee registration successful! ${response.body}');
      //
      //
      // } else {
      //   // Registration failed, handle the error here
      //   print('Employee registration failed!');
      // }

    } catch (e) {
      isloading.value=false;

      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }finally{
      isloading.value=false;

    }
  }

}

