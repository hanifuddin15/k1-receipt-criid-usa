import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/Analytics/Analytics.dart';
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Budget%20Details/Budgetdetails.dart';
import 'package:k1recipt/View/GeneralUserExpenseList/generalUserExpenseList.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';

class DeleteExpenseController extends GetxController {
  final cat_name = ''.obs;
  final budget_amount_per_year = ''.obs;

  void setcat_name(String value) => cat_name.value = value;
  void setbudget_amount_per_year(String value) =>
      budget_amount_per_year.value = value;

  Future<void> deletecat(String expenseid) async {
    BudgetController budgetController = Get.find();
    print(
        "::::::::: ${usertype} ${cat_name.value} ${budget_amount_per_year.value} ${user_id}");

    final formData = {
      'user_id': '$d_id',
      'cat_name': '${cat_name.value}',
      'budget_amount_per_year': '${budget_amount_per_year.value}',
      'usertype': '$usertype',
    };

    final url = Uri.parse(
      'https://$baseurl/api/expense/$expenseid/delete',
    );

    final headers = {
      'headers': "Bearer ${usertoken}"
    };

    try {
      final response =
      await http.delete(url, body: formData, headers: headers);

      print("KKKKKKK ${response.body}");

      if (response.body.toString().substring(0, 14) == "<!DOCTYPE html") {
      } else {
        print(":::::::::::::Delete Expense ${response.body}");
        if (response.statusCode == 200) {
          // Login successful, handle the response here
          print('Login successful!  ${response.body}');
          budgetController.fetchBudgetList();
          Get.back();
          Get.snackbar(
            'Deleted successfully',
            'Your expense ${cat_name.value} Deleted successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Delay the navigation to allow the snackbar to be visible
          // WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAll(() => BottomAnimatedBar2()); // Navigate to the expense list screen
          // );
        } else {
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
