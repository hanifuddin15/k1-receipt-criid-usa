
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/getPlanListModel.dart';

class PlanController extends GetxController {
  final plans = <Datum>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }

  Future<void> fetchPlans() async {
    baseurl;
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-plan-list'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        final getPlanModel = getPlanModelFromJson(jsonString);
        plans.value = getPlanModel.data;
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

}

