import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/model/getUserMonthlyExpenseModel.dart';
import 'package:k1recipt/model/getUserOverallExpenseModel.dart';

class UserMonthlyExpenseController extends GetxController {
  var isLoading = true.obs;
  var userMonthlyExpenseList = List<Datum>.empty().obs;
  var errorMsg = ''.obs;


  var isLoading1 = true.obs;
  var userOverallExpenseList = List<Datum1>.empty().obs;
  var errorMsg1 = ''.obs;


  Future<void> getUserMonthlyExpenseData(String userId, String categoryId,String month) async {
    userMonthlyExpenseList.clear();
    print("::::::: koi na jany $month");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/user_monthly_expense?user_id=$userId&category_id=$categoryId &month=7'));

      // final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/user_monthly_expense?user_id=335&category_id=204 &month=7'));

      if (response.statusCode == 200) {
        print("::::::getUserMonthlyExpenseData ${response.body} ");
        final getUserMonthlyExpenseModel = getUserMonthlyExpenseModelFromJson(response.body);
        userMonthlyExpenseList.value = getUserMonthlyExpenseModel.data;
        errorMsg.value = '';
      }
      else {
        // If the API call is not successful, set the error message
        errorMsg.value = 'Failed to fetch data';
      }
    } catch (e) {
      // If an error occurs, set the error message
      errorMsg.value = 'Something went wrong';
    } finally {
      isLoading.value = false;
    }
  }

  void getUserOverallExpenseData(String userId, String categoryId) async {
    userOverallExpenseList.clear();
    try {
      isLoading1.value = true;
      final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/user_analytics_expense?user_id=$userId&category_id=$categoryId'));
      // final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/user_monthly_expense?user_id=335&category_id=204 &month=7'));
      if (response.statusCode == 200) {
        print("::::::LLLLLL ::: ${response.body} ");
        final getUserOverallExpenseModel = getUserOverallExpenseModelFromJson(response.body);
        userOverallExpenseList.value = getUserOverallExpenseModel.data;
        errorMsg1.value = '';
      }
      else {
        // If the API call is not successful, set the error message
        errorMsg.value = 'Failed to fetch data';
      }
    } catch (e) {
      // If an error occurs, set the error message
      errorMsg1.value = 'Something went wrong';
      isLoading1.value = false;
    } finally {
      isLoading1.value = false;
    }
  }



}
