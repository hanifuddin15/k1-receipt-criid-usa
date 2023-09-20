import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditExpenseController extends GetxController {
  final isLoading = false.obs;
  final expenseid = ''.obs;

  Rx<TextEditingController> expense_amount = TextEditingController().obs;
  Rx<TextEditingController> expense_description = TextEditingController().obs;
  Rx<TextEditingController> expense_shop_name = TextEditingController().obs;

  setexpense_amount(String value) => expense_amount.value.text = value;
  setexpense_description(String value) => expense_description.value.text = value;
  setexpense_shop_name(String value) => expense_shop_name.value.text = value;

  Future<void> editexpense() async {
    isLoading.value = true;

    final url = Uri.https(
      'dev.k1receipt.com',
      '/api/expense/${expenseid.value}/edit',
    );

    final body = {
      'expense_amount': expense_amount.value.text,
      'expense_description': expense_description.value.text,
      'expense_shop_name': expense_shop_name.value.text,
    };

    try {
      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
          'Edit Successfully',
          'Expense Updated Successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Handle other status codes if needed
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Failed',
        'Please check your internet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
