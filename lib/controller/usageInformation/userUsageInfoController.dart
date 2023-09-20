import 'dart:convert';

import 'package:get/get.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/model/userUsageInfoPackageModel.dart';
import 'package:http/http.dart' as http;

class UserUsageInfoController extends GetxController{

  final userinfousagepackagedata = <Data>[].obs;
  final isLoading =false.obs;
  final userinfousagepackageUserService = <UserService>[].obs;
  final userinfousagepackage= <UserInfoPackageModel>[].obs;


  @override
  void onInit(){
    fetchUserUsageInfo();
    super.onInit();
  }

  Future<void> fetchUserUsageInfo() async{

    try{
      isLoading.value=true;

      final headers={
        'headers':"Bearer ${usertoken}"
      };

      final response = await http.get(Uri.parse('https://dev.k1receipt.com/api/usage-information/$d_id'), headers: headers);

      if(response.statusCode==200){
        final jsonString =response.body;
        print("::::${response.body}");
        final userInfoPackageModel=userInfoPackageModelFromJson(jsonString);
        //userinfousagepackage.value=userInfoPackageModel as List<UserInfoPackageModel>;
        userinfousagepackagedata.value = [userInfoPackageModel.data];
        userinfousagepackageUserService.value=[userInfoPackageModel.data.userService];
      }
      else{
        print("Exception:::::::::: ${response.body}");
      }

    }catch(e){
      isLoading.value=false;
      print("Exception: $e");
    }finally{
      isLoading.value=false;
    }


    // userInfoPackageModelFromJson();

  }

}
