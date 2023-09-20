import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/getServiceModel.dart';
import 'package:k1recipt/model/getServiceModel1.dart';
import 'package:k1recipt/model/getServiceModel2.dart';
import 'package:k1recipt/model/getServiceModel3.dart';
import 'package:k1recipt/model/getServiceModel4.dart';

class ServicesOfPlanController extends GetxController {
  final services = <GetServicesOfPlan>[].obs;
  final services1 = <GetServicesOfPlan1>[].obs;
  final services2 = <GetServicesOfPlan2>[].obs;
  final services3 = <GetServicesOfPlan3>[].obs;
  final services4 = <GetServicesOfPlan4>[].obs;


  final isLoading = false.obs;
  final isLoading1 = false.obs;
  final isLoading2 = false.obs;
  final isLoading3 = false.obs;
  final isLoading4 = false.obs;
  final servicenumber = ''.obs;

  @override
  void onInit() {
    fetchServices();
    super.onInit();
  }

  Future<void> fetchServices() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-service/1'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        print(":::::::    $servicenumber     ${response.body}");
        final getServicesOfPlan = getServicesOfPlanFromJson(jsonString);
        // services.value = [getServicesOfPlan]; // Save the fetched services in the list
        services.value.add(getServicesOfPlan);

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchServices1() async {
    try {
      isLoading1.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-service/2'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        print(":::::::    $servicenumber     ${response.body}");
        final getServicesOfPlan1 = getServicesOfPlan1FromJson(jsonString);
        // services.value = [getServicesOfPlan1]; // Save the fetched services in the list
        services1.value.add(getServicesOfPlan1);

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading1.value = false;
    }
  }

  Future<void> fetchServices2() async {
    try {
      isLoading2.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-service/3'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        print(":::::::    $servicenumber     ${response.body}");
        final getServicesOfPlan2 = getServicesOfPlan2FromJson(jsonString);
        // services.value = [getServicesOfPlan]; // Save the fetched services in the list
        services2.value.add(getServicesOfPlan2 );

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading2.value = false;
    }
  }

  Future<void> fetchServices3() async {
    try {
      isLoading3.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-service/4'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        print(":::::::    $servicenumber     ${response.body}");
        final getServicesOfPlan3 = getServicesOfPlan3FromJson(jsonString);
        // services.value = [getServicesOfPlan]; // Save the fetched services in the list
        services3.value.add(getServicesOfPlan3 );

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading3.value = false;
    }
  }

  Future<void> fetchServices4() async {
    try {
      isLoading4.value = true;
      final response = await http.get(Uri.parse('https://$baseurl/api/get-service/5'));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        print(":::::::    $servicenumber     ${response.body}");
        final getServicesOfPlan4 = getServicesOfPlan4FromJson(jsonString);
        // services.value = [getServicesOfPlan]; // Save the fetched services in the list
        services4.value.add(getServicesOfPlan4);

      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading4.value = false;
    }
  }




}









// class ServicesOfPlanController extends GetxController {
//   // final services = <GetServicesOfPlan>[].obs;
//   final services = <Datum>[].obs;
//   final isLoading = false.obs;
//   final servicenumber = ''.obs;
//
//   @override
//   void onInit() {
//     fetchServices();
//     super.onInit();
//   }
//
//   Future<void> fetchServices() async {
//
//     try {
//       isLoading.value = true;
//       final response = await http.get(Uri.parse('https://$baseurl/api/get-service/${servicenumber.isEmpty?'1':servicenumber}'));
//       if (response.statusCode == 200) {
//         final jsonString = response.body;
//         print("object :::::::: ${jsonString}");
//         final getServicesOfPlan = getServicesOfPlanFromJson(jsonString);
//         services.value = getServicesOfPlan.data;
//
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Exception: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
// }
