import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/login%20page/LoginPage.dart';
import 'package:k1recipt/View/paymentmethod/paymentMethod.dart';
import 'package:k1recipt/View/planStatistics/planStatistics.dart';
import 'package:k1recipt/controller/UserInfoController/edituserInfoController.dart';
import 'package:k1recipt/controller/UserInfoController/userInfoController.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addSubCat/addSubCat.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/addemployeecontroller/AddEmployeeController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/employeeListController/employeeListContoller.dart';
import 'package:k1recipt/controller/employee_registration/employee_registration.dart';
import 'package:k1recipt/controller/expenseController/expenseEditController.dart';
import 'package:k1recipt/controller/getListPlanController/getListPlanController.dart';
import 'package:k1recipt/controller/getserviceController/getServiceController.dart';
import 'package:k1recipt/controller/login/loginController.dart';
import 'package:k1recipt/controller/promocodeController/promocodeController.dart';
import 'package:k1recipt/controller/usageInformation/userUsageInfoController.dart';


class PlanSelection extends StatefulWidget {
   PlanSelection({Key? key,required this.mobile,required this.password}) : super(key: key);
  String mobile;
  String password;
  @override
  State<PlanSelection> createState() => _PlanSelectionState();
}

class _PlanSelectionState extends State<PlanSelection> {


  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      //Get.put(ServicesOfPlanController());

      // if(servicesOfPlanController.servicenumber.value.isEmpty|| servicesOfPlanController.servicenumber.value=='1'){
      //
      //   setState(() {
      //     servicesOfPlanController.servicenumber.value='1';
      //   });
      //   print("SADASD ${servicesOfPlanController.servicenumber.value}");
      //   servicesOfPlanController.fetchServices().then((value) {
      //     setState(() {
      //       servicesOfPlanController.servicenumber.value='2';
      //     });
      //     print("SADASD ${servicesOfPlanController.servicenumber.value}");
      //
      //     servicesOfPlanController.fetchServices().then((value) {
      //       setState(() {
      //         servicesOfPlanController.servicenumber.value='3';
      //       });
      //       print("SADASD ${servicesOfPlanController.servicenumber.value}");
      //
      //       servicesOfPlanController.fetchServices().then((value) {
      //         setState(() {
      //           servicesOfPlanController.servicenumber.value='4';
      //         });
      //         print("SADASD ${servicesOfPlanController.servicenumber.value}");
      //
      //         servicesOfPlanController.fetchServices().then((value) {
      //           setState(() {
      //             servicesOfPlanController.servicenumber.value='5';
      //           });
      //           print("SADASD ${servicesOfPlanController.servicenumber.value}");
      //           servicesOfPlanController.fetchServices();
      //           // servicesOfPlanController.services.value.forEach((element) {
      //           //   print("::::::::::::::::::::: ${element.data.first.planName}");
      //           // });
      //         });
      //       });
      //     });
      //   });
      // }
    }

    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool isDropdownOpen = false;
  void toggleDropdown() {
    print(" :::::::: ${widget.mobile} :::: ${widget.password}");
    setState(() {
      // isDropdownOpen1=false;
      // isDropdownOpen2=false;
      // isDropdownOpen3=false;
      // isDropdownOpen4=false;
      servicesOfPlanController.servicenumber.value='1';
      isDropdownOpen = !isDropdownOpen;
    });
    servicesOfPlanController.fetchServices();
    print("L:L:L::::::: ${servicesOfPlanController.servicenumber}");
  }

  bool isDropdownOpen1 = false;
  void toggleDropdown1() {


    setState(() {
    //  servicesOfPlanController.servicenumber.value='2';

      isDropdownOpen1 = !isDropdownOpen1;
    });
    servicesOfPlanController.fetchServices1();

  }

  bool isDropdownOpen2 = false;
  void toggleDropdown2() {


    setState(() {
    //  servicesOfPlanController.servicenumber.value='3';

      isDropdownOpen2 = !isDropdownOpen2;
    });
    servicesOfPlanController.fetchServices2();
  }

  bool isDropdownOpen3 = false;
  void toggleDropdown3() {

    setState(() {
    //  servicesOfPlanController.servicenumber.value='4';
      isDropdownOpen3 = !isDropdownOpen3;
    });
    servicesOfPlanController.fetchServices3();

  }

  bool isDropdownOpen4 = false;
  void toggleDropdown4() {
    setState(() {
     // servicesOfPlanController.servicenumber.value='5';
      isDropdownOpen4 = !isDropdownOpen4;
    });
    servicesOfPlanController.fetchServices4();

  }

  String a='';
  String img='assets/Group 91.svg';
  String heading='Basic';
  final PlanController planController = Get.put(PlanController());
  final ServicesOfPlanController servicesOfPlanController=Get.put(ServicesOfPlanController());

  List<String> imgs=["assets/Group 91.svg","assets/Group 92.svg","assets/Group 93.svg","assets/Group 94.svg","assets/Group 95.svg","assets/Group 95.svg","assets/Group 95.svg","assets/Group 95.svg",];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130.h,
                  // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/logo.png',height: 87.h,width: 178,)
                ),
                GestureDetector(
                    onTap: (){
                     var a= servicesOfPlanController.services.value.length;
                      servicesOfPlanController.services.value.forEach((element) {
                        //print("::::::::::::::::::::: ${element.data}");
                        for(int i=0;i<element.data.length;i++){
                          print("::::::::::::::::::::: ${element.data[i].budget} :: $a");
                        }
                      });

                    },
                    child: Text("Plan Selection",style: GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 18.sp,fontWeight:FontWeight.w500  ),)),
                SizedBox(height: 25.h,),

                // GestureDetector(
                //   onTap: toggleDropdown,
                //   child: Container(
                //     //color: Colors.red,
                //     alignment: Alignment.topLeft,
                //     width: MediaQuery.of(context).size.width,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 25.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           HeadingOfDropdown(width:32.w,img: img, heading: heading, isDropdownOpen: isDropdownOpen),
                //           AnimatedContainer(
                //             duration: Duration(milliseconds: 300),
                //             height: isDropdownOpen ? 271.0.h : 0.0, // Adjust the height as needed
                //             child: Padding(
                //               padding: EdgeInsets.all(20.0.sp),
                //               child: SizedBox(
                //                 height: 229.h,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: 0.5.h,),
                //                     Container(
                //                       height: 232.h,
                //                       decoration: BoxDecoration(
                //                         //color: Colors.red,
                //                         //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                //                         border: Border.all(color:Colors.grey ),
                //                         borderRadius: BorderRadius.circular(14.sp),
                //                       ),
                //                       child: ListView(
                //                         children: [
                //                           SizedBox(height: 3.h,),
                //                           Subheadingofdropdown(a: "Category Itemization (10)"),
                //                           Subheadingofdropdown(a: "Sub Category (0)"),
                //                           Subheadingofdropdown(a: """Budget \\\$40"""),
                //                           Subheadingofdropdown(a: "Number of user (1)"),
                //                           Subheadingofdropdown(a: "Number of receipts per month (25)"),
                //                           Subheadingofdropdown(a: "Reports per month (25)"),
                //                           Subheadingofdropdown(a: "Basic alerts available"),
                //                           Subheadingofdropdown(a: "Tech Support (Email)"),
                //                           SizedBox(height: 12.h,),
                //                           PurchaseBtn(),
                //
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5.h,),
                // GestureDetector(
                //   onTap: toggleDropdown1,
                //   child: Container(
                //     //color: Colors.red,
                //     alignment: Alignment.topLeft,
                //     width: MediaQuery.of(context).size.width,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 25.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           HeadingOfDropdown(width:3.w,img: "assets/Group 92.svg", heading: "Extended", isDropdownOpen: isDropdownOpen1),
                //           AnimatedContainer(
                //             duration: Duration(milliseconds: 300),
                //             height: isDropdownOpen1 ? 271.0.h : 0.0, // Adjust the height as needed
                //             child: Padding(
                //               padding: EdgeInsets.all(20.0.sp),
                //               child: SizedBox(
                //                 height: 229.h,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: 0.5.h,),
                //                     Container(
                //                       height: 232.h,
                //                       decoration: BoxDecoration(
                //                         //color: Colors.red,
                //                         //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                //                         border: Border.all(color:Colors.grey ),
                //                         borderRadius: BorderRadius.circular(14.sp),
                //                       ),
                //                       child: ListView(
                //                         children: [
                //                           SizedBox(height: 3.h,),
                //                           Subheadingofdropdown(a: "Category Itemization (10)"),
                //                           Subheadingofdropdown(a: "Sub Category (0)"),
                //                           Subheadingofdropdown(a: """Budget \\\$40"""),
                //                           Subheadingofdropdown(a: "Number of user (1)"),
                //                           Subheadingofdropdown(a: "Number of receipts per month (25)"),
                //                           Subheadingofdropdown(a: "Reports per month (25)"),
                //                           Subheadingofdropdown(a: "Basic alerts available"),
                //                           Subheadingofdropdown(a: "Tech Support (Email)"),
                //                           SizedBox(height: 12.h,),
                //                           PurchaseBtn(),
                //
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5.h,),
                // GestureDetector(
                //   onTap: toggleDropdown2,
                //   child: Container(
                //     //color: Colors.red,
                //     alignment: Alignment.topLeft,
                //     width: MediaQuery.of(context).size.width,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 25.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           HeadingOfDropdown(width:29.5.w,img: "assets/Group 93.svg", heading:"Silver", isDropdownOpen: isDropdownOpen2),
                //           AnimatedContainer(
                //             duration: Duration(milliseconds: 300),
                //             height: isDropdownOpen2 ? 271.0.h : 0.0, // Adjust the height as needed
                //             child: Padding(
                //               padding: EdgeInsets.all(20.0.sp),
                //               child: SizedBox(
                //                 height: 229.h,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: 0.5.h,),
                //                     Container(
                //                       height: 232.h,
                //                       decoration: BoxDecoration(
                //                         //color: Colors.red,
                //                         //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                //                         border: Border.all(color:Colors.grey ),
                //                         borderRadius: BorderRadius.circular(14.sp),
                //                       ),
                //                       child: ListView(
                //                         children: [
                //                           SizedBox(height: 3.h,),
                //                           Subheadingofdropdown(a: "Category Itemization (10)"),
                //                           Subheadingofdropdown(a: "Sub Category (0)"),
                //                           Subheadingofdropdown(a: """Budget \\\$40"""),
                //                           Subheadingofdropdown(a: "Number of user (1)"),
                //                           Subheadingofdropdown(a: "Number of receipts per month (25)"),
                //                           Subheadingofdropdown(a: "Reports per month (25)"),
                //                           Subheadingofdropdown(a: "Basic alerts available"),
                //                           Subheadingofdropdown(a: "Tech Support (Email)"),
                //                           SizedBox(height: 12.h,),
                //                           PurchaseBtn(),
                //
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5.h,),
                // GestureDetector(
                //   onTap: toggleDropdown3,
                //   child: Container(
                //     //color: Colors.red,
                //     alignment: Alignment.topLeft,
                //     width: MediaQuery.of(context).size.width,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 25.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           HeadingOfDropdown(width:35.w,img: "assets/Group 94.svg", heading:"Gold", isDropdownOpen: isDropdownOpen3),
                //           AnimatedContainer(
                //             duration: Duration(milliseconds: 300),
                //             height: isDropdownOpen3 ? 271.0.h : 0.0, // Adjust the height as needed
                //             child: Padding(
                //               padding: EdgeInsets.all(20.0.sp),
                //               child: SizedBox(
                //                 height: 229.h,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: 0.5.h,),
                //                     Container(
                //                       height: 232.h,
                //                       decoration: BoxDecoration(
                //                         //color: Colors.red,
                //                         //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                //                         border: Border.all(color:Colors.grey ),
                //                         borderRadius: BorderRadius.circular(14.sp),
                //                       ),
                //                       child: ListView(
                //                         children: [
                //                           SizedBox(height: 3.h,),
                //                           Subheadingofdropdown(a: "Category Itemization (10)"),
                //                           Subheadingofdropdown(a: "Sub Category (0)"),
                //                           Subheadingofdropdown(a: """Budget \\\$40"""),
                //                           Subheadingofdropdown(a: "Number of user (1)"),
                //                           Subheadingofdropdown(a: "Number of receipts per month (25)"),
                //                           Subheadingofdropdown(a: "Reports per month (25)"),
                //                           Subheadingofdropdown(a: "Basic alerts available"),
                //                           Subheadingofdropdown(a: "Tech Support (Email)"),
                //                           SizedBox(height: 12.h,),
                //                           PurchaseBtn(),
                //
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 5.h,),
                // GestureDetector(
                //   onTap: toggleDropdown4,
                //   child: Container(
                //     //color: Colors.red,
                //     alignment: Alignment.topLeft,
                //     width: MediaQuery.of(context).size.width,
                //     child: Padding(
                //       padding: EdgeInsets.only(left: 25.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           HeadingOfDropdown(width:4.5.w,img: "assets/Group 95.svg", heading:"Premium", isDropdownOpen: isDropdownOpen4),
                //           AnimatedContainer(
                //             duration: Duration(milliseconds: 300),
                //             height: isDropdownOpen4 ? 271.0.h : 0.0, // Adjust the height as needed
                //             child: Padding(
                //               padding: EdgeInsets.all(20.0.sp),
                //               child: SizedBox(
                //                 height: 229.h,
                //                 child: Column(
                //                   children: [
                //                     SizedBox(height: 0.5.h,),
                //                     Container(
                //                       height: 232.h,
                //                       decoration: BoxDecoration(
                //                         //color: Colors.red,
                //                         //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                //                         border: Border.all(color:Colors.grey ),
                //                         borderRadius: BorderRadius.circular(14.sp),
                //                       ),
                //                       child: ListView(
                //                         children: [
                //                           SizedBox(height: 3.h,),
                //                           Subheadingofdropdown(a: "Category Itemization (10)"),
                //                           Subheadingofdropdown(a: "Sub Category (0)"),
                //                           Subheadingofdropdown(a: """Budget \\\$40"""),
                //                           Subheadingofdropdown(a: "Number of user (1)"),
                //                           Subheadingofdropdown(a: "Number of receipts per month (25)"),
                //                           Subheadingofdropdown(a: "Reports per month (25)"),
                //                           Subheadingofdropdown(a: "Basic alerts available"),
                //                           Subheadingofdropdown(a: "Tech Support (Email)"),
                //                           SizedBox(height: 12.h,),
                //                           PurchaseBtn(),
                //
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                Container(
                  height: 485.h,
                  //color: Colors.red,
                  child: Obx(
                        () => planController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: planController.plans.length,
                          itemBuilder: (context, index) {

                            final plan = planController.plans[index];
                            print("${planController.plans.length}");
                            final isDropdownOpen = _getIsDropdownOpen(index); // Get the respective isDropdownOpen variable
                            final toggleDropdown = _getToggleDropdownFunction(index); // Get the respective toggleDropdown function
                            // return ListTile(
                            //   title: Text(plan.name),
                            //   subtitle: Text('ID: ${plan.id}'),
                            // );
                            return GestureDetector(
                              onTap: toggleDropdown,
                              child: Container(
                                //color: Colors.red,
                                alignment: Alignment.topLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      HeadingOfDropdown(width:0.w,img: imgs[index], heading: "${plan.name}", isDropdownOpen: isDropdownOpen),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        height: isDropdownOpen ? 271.0.h : 0.0, // Adjust the height as needed
                                        child: Padding(
                                          padding: EdgeInsets.all(20.0.sp),
                                          child: SizedBox(
                                            height: 229.h,
                                            child: Column(
                                              children: [
                                                SizedBox(height: 0.5.h,),
                                                Container(
                                                  height: 232.h,
                                                  decoration: BoxDecoration(
                                                    //color: Colors.red,
                                                    //   border: Border.all(color:isDropdownOpen? Colors.grey :Colors.transparent)
                                                    border: Border.all(color:Colors.grey ),
                                                    borderRadius: BorderRadius.circular(14.sp),
                                                  ),
                                                  child:
                                                              index==0 ?
                                                              Obx(
                                                                    () => servicesOfPlanController.isLoading.value ||  planController.isLoading.value
                                                                    ? Center(child: CircularProgressIndicator()):
                                                                    ListView(
                                                                      children: [
                                                                        SizedBox(height: 3.h,),
                                                                        // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                                        // Subheadingofdropdown(a: "Sub Category (0)"),
                                                                        // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                                        // Subheadingofdropdown(a: "Number of user (1)"),
                                                                        // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                                        // Subheadingofdropdown(a: "Reports per month (25)"),
                                                                        // Subheadingofdropdown(a: "Basic alerts available"),
                                                                        // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                                        Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services[0].data.first.categoryNum}"),
                                                                        Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services[0].data.first.subCategoryNum}"),
                                                                        Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services[0].data.first.budget}"""),
                                                                        Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services[0].data.first.userNumber}"),
                                                                        Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services[0].data.first.numberOfReceipt}"),
                                                                        Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services[0].data.first.reportPerMonth}"),
                                                                        Subheadingofdropdown(a: "${servicesOfPlanController.services[0].data.first.alert}"),
                                                                        Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services[0].data.first.techSupport}"),
                                                                        SizedBox(height: 4.h,),
                                                                        PurchaseBtn(planid: "1",mobile: widget.mobile,password: widget.password,amount:"${servicesOfPlanController.services[0].data.first.pricePerMonth}",),
                                                                  ],
                                                                )
                                                              )
                                                             :index==1 ?
                                                              Obx(
                                                                      () => servicesOfPlanController.isLoading1.value ||  planController.isLoading.value
                                                                      ? Center(child: CircularProgressIndicator()):
                                                                      ListView(
                                                                        children: [
                                                                          SizedBox(height: 3.h,),
                                                                          // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                                          // Subheadingofdropdown(a: "Sub Category (0)"),
                                                                          // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                                          // Subheadingofdropdown(a: "Number of user (1)"),
                                                                          // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                                          // Subheadingofdropdown(a: "Reports per month (25)"),
                                                                          // Subheadingofdropdown(a: "Basic alerts available"),
                                                                          // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                                          Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services1[0].data.first.categoryNum}"),
                                                                          Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services1[0].data.first.subCategoryNum}"),
                                                                          Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services1[0].data.first.budget}"""),
                                                                          Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services1[0].data.first.userNumber}"),
                                                                          Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services1[0].data.first.numberOfReceipt}"),
                                                                          Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services1[0].data.first.reportPerMonth}"),
                                                                          Subheadingofdropdown(a: "${servicesOfPlanController.services1[0].data.first.alert}"),
                                                                          Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services1[0].data.first.techSupport}"),
                                                                          SizedBox(height: 4.h,),
                                                                          PurchaseBtn(mobile: widget.mobile,password: widget.password,amount: "${servicesOfPlanController.services1[0].data.first.pricePerMonth}", planid:"2" '',),

                                                                ],
                                                              )):
                                                              index==2 ?
                                                              Obx(
                                                                      () => servicesOfPlanController.isLoading2.value ||  planController.isLoading.value
                                                                      ? Center(child: CircularProgressIndicator()):
                                                                      ListView(
                                                                        children: [
                                                                          SizedBox(height: 3.h,),
                                                                          // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                                          // Subheadingofdropdown(a: "Sub Category (0)"),
                                                                          // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                                          // Subheadingofdropdown(a: "Number of user (1)"),
                                                                          // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                                          // Subheadingofdropdown(a: "Reports per month (25)"),
                                                                          // Subheadingofdropdown(a: "Basic alerts available"),
                                                                          // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                                          Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services2[0].data.first.categoryNum}"),
                                                                          Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services2[0].data.first.subCategoryNum}"),
                                                                          Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services2[0].data.first.budget}"""),
                                                                          Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services2[0].data.first.userNumber}"),
                                                                          Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services2[0].data.first.numberOfReceipt}"),
                                                                          Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services2[0].data.first.reportPerMonth}"),
                                                                          Subheadingofdropdown(a: "${servicesOfPlanController.services2[0].data.first.alert}"),
                                                                          Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services2[0].data.first.techSupport}"),
                                                                          SizedBox(height: 4.h,),
                                                                          PurchaseBtn(planid: "3",mobile: widget.mobile,password: widget.password,amount: "${servicesOfPlanController.services2[0].data.first.pricePerMonth}",),

                                                                        ],
                                                                  )):
                                                              index==3 ?
                                                              Obx(
                                                                      () => servicesOfPlanController.isLoading3.value ||  planController.isLoading.value
                                                                      ? Center(child: CircularProgressIndicator()):
                                                                      ListView(
                                                                        children: [
                                                                          SizedBox(height: 3.h,),
                                                                          // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                                          // Subheadingofdropdown(a: "Sub Category (0)"),
                                                                          // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                                          // Subheadingofdropdown(a: "Number of user (1)"),
                                                                          // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                                          // Subheadingofdropdown(a: "Reports per month (25)"),
                                                                          // Subheadingofdropdown(a: "Basic alerts available"),
                                                                          // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                                            Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services3[0].data.first.categoryNum}"),
                                                                            Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services3[0].data.first.subCategoryNum}"),
                                                                            Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services3[0].data.first.budget}"""),
                                                                            Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services3[0].data.first.userNumber}"),
                                                                            Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services3[0].data.first.numberOfReceipt}"),
                                                                            Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services3[0].data.first.reportPerMonth}"),
                                                                            Subheadingofdropdown(a: "${servicesOfPlanController.services3[0].data.first.alert}"),
                                                                            Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services3[0].data.first.techSupport}"),
                                                                          SizedBox(height: 4.h,),
                                                                          PurchaseBtn(planid: "4",mobile: widget.mobile,password: widget.password,amount: "${servicesOfPlanController.services3[0].data.first.pricePerMonth}",),
                                                                        ],
                                                                      )):
                                                              index==4 ?
                                                              Obx(
                                                                      () => servicesOfPlanController.isLoading4.value ||  planController.isLoading.value
                                                                      ? Center(child: CircularProgressIndicator()):
                                                                      ListView(
                                                                        children: [
                                                                          SizedBox(height: 3.h,),
                                                                          // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                                          // Subheadingofdropdown(a: "Sub Category (0)"),
                                                                          // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                                          // Subheadingofdropdown(a: "Number of user (1)"),
                                                                          // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                                          // Subheadingofdropdown(a: "Reports per month (25)"),
                                                                          // Subheadingofdropdown(a: "Basic alerts available"),
                                                                          // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                                          Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services4[0].data.first.categoryNum}"),
                                                                          Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services4[0].data.first.subCategoryNum}"),
                                                                          Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services4[0].data.first.budget}"""),
                                                                          Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services4[0].data.first.userNumber}"),
                                                                          Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services4[0].data.first.numberOfReceipt}"),
                                                                          Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services4[0].data.first.reportPerMonth}"),
                                                                          Subheadingofdropdown(a: "${servicesOfPlanController.services4[0].data.first.alert}"),
                                                                          Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services4[0].data.first.techSupport}"),
                                                                          SizedBox(height: 4.h,),
                                                                          PurchaseBtn(planid: "5",mobile: widget.mobile,password: widget.password,amount: "${servicesOfPlanController.services4[0].data.first.pricePerMonth}",),
                                                                        ],
                                                                  ))
                                                               // ListView(
                                                               //   children: [
                                                               //     SizedBox(height: 3.h,),
                                                               //     // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                               //     // Subheadingofdropdown(a: "Sub Category (0)"),
                                                               //     // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                               //     // Subheadingofdropdown(a: "Number of user (1)"),
                                                               //     // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                               //     // Subheadingofdropdown(a: "Reports per month (25)"),
                                                               //     // Subheadingofdropdown(a: "Basic alerts available"),
                                                               //     // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                               //     Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services[1].data[1].categoryNum}"),
                                                               //     Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services[1].data[1].subCategoryNum}"),
                                                               //     Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services[1].data[1].budget}"""),
                                                               //     Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services[1].data.first.userNumber}"),
                                                               //     Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services[1].data.first.numberOfReceipt}"),
                                                               //     Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services[1].data.first.reportPerMonth}"),
                                                               //     Subheadingofdropdown(a: "${servicesOfPlanController.services[1].data.first.alert}"),
                                                               //     Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services[1].data.first.techSupport}"),
                                                               //     SizedBox(height: 12.h,),
                                                               //     PurchaseBtn(),
                                                               //
                                                               //   ],
                                                               // )
                                                               //     :index==2 && servicesOfPlanController.services.length>2?
                                                               // ListView(
                                                               //   children: [
                                                               //     SizedBox(height: 3.h,),
                                                               //     // Subheadingofdropdown(a: "Category Itemization (10)"),
                                                               //     // Subheadingofdropdown(a: "Sub Category (0)"),
                                                               //     // Subheadingofdropdown(a: """Budget \\\$40"""),
                                                               //     // Subheadingofdropdown(a: "Number of user (1)"),
                                                               //     // Subheadingofdropdown(a: "Number of receipts per month (25)"),
                                                               //     // Subheadingofdropdown(a: "Reports per month (25)"),
                                                               //     // Subheadingofdropdown(a: "Basic alerts available"),
                                                               //     // Subheadingofdropdown(a: "Tech Support (Email)"),
                                                               //     Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services[2].data[2].categoryNum}"),
                                                               //     Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services[2].data[2].subCategoryNum}"),
                                                               //     Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services[2].data[2].budget}"""),
                                                               //     Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services[2].data[2].userNumber}"),
                                                               //     Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services[2].data[2].numberOfReceipt}"),
                                                               //     Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services[2].data[2].reportPerMonth}"),
                                                               //     Subheadingofdropdown(a: "${servicesOfPlanController.services[2].data[2].alert}"),
                                                               //     Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services[2].data[2].techSupport}"),
                                                               //     SizedBox(height: 12.h,),
                                                               //     PurchaseBtn(),
                                                               //
                                                               //   ],
                                                               // )
                                                               //     :index==2?
                                                               //
                                                               // ListView(
                                                               //   children: [
                                                               //     SizedBox(height: 3.h,),
                                                               //
                                                               //     Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services[2].categoryNum}"),
                                                               //     Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services[2].subCategoryNum}"),
                                                               //     Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services[2].budget}"""),
                                                               //     Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services[2].userNumber}"),
                                                               //     Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services[2].numberOfReceipt}"),
                                                               //     Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services[2].reportPerMonth}"),
                                                               //     Subheadingofdropdown(a: "${servicesOfPlanController.services[2].alert}"),
                                                               //     Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services[2].techSupport}"),
                                                               //     SizedBox(height: 12.h,),
                                                               //     PurchaseBtn(),
                                                               //
                                                               //   ],
                                                               // )
                                                               //
                                                               //
                                                               //     :index==3?
                                                               //
                                                               // ListView(
                                                               //   children: [
                                                               //     SizedBox(height: 3.h,),
                                                               //
                                                               //     Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services[3].categoryNum}"),
                                                               //     Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services[3].subCategoryNum}"),
                                                               //     Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services[3].budget}"""),
                                                               //     Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services[3].userNumber}"),
                                                               //     Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services[3].numberOfReceipt}"),
                                                               //     Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services[3].reportPerMonth}"),
                                                               //     Subheadingofdropdown(a: "${servicesOfPlanController.services.first.alert}"),
                                                               //     Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services[3].techSupport}"),
                                                               //     SizedBox(height: 12.h,),
                                                               //     PurchaseBtn(),
                                                               //
                                                               //   ],
                                                               // )
                                                               //
                                                               //
                                                               //     :index==4?
                                                               //
                                                               // ListView(
                                                               //   children: [
                                                               //     SizedBox(height: 3.h,),
                                                               //
                                                               //     Subheadingofdropdown(a: "Category Itemization ${servicesOfPlanController.services.first.categoryNum}"),
                                                               //     Subheadingofdropdown(a: "Sub Category ${servicesOfPlanController.services.first.subCategoryNum}"),
                                                               //     Subheadingofdropdown(a: """Budget \\\$${servicesOfPlanController.services.first.budget}"""),
                                                               //     Subheadingofdropdown(a: "Number of user ${servicesOfPlanController.services.first.userNumber}"),
                                                               //     Subheadingofdropdown(a: "Number of receipts per month ${servicesOfPlanController.services.first.numberOfReceipt}"),
                                                               //     Subheadingofdropdown(a: "Reports per month ${servicesOfPlanController.services.first.reportPerMonth}"),
                                                               //     Subheadingofdropdown(a: "${servicesOfPlanController.services.first.alert}"),
                                                               //     Subheadingofdropdown(a: "Tech Support ${servicesOfPlanController.services.first.techSupport}"),
                                                               //     SizedBox(height: 12.h,),
                                                               //     PurchaseBtn(),
                                                               //
                                                               //   ],
                                                               // )
                                                             :SizedBox(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  // Helper function to get the respective isDropdownOpen variable based on the index
  bool _getIsDropdownOpen(int index) {
    switch (index) {
      case 0:
        return isDropdownOpen;
      case 1:
        return isDropdownOpen1;
      case 2:
        return isDropdownOpen2;
      case 3:
        return isDropdownOpen3;
      case 4:
        return isDropdownOpen4;
      default:
        return false;
    }
  }

  // Helper function to get the respective toggleDropdown function based on the index
  VoidCallback _getToggleDropdownFunction(int index) {
    switch (index) {
      case 0:
        return toggleDropdown;
      case 1:
        return toggleDropdown1;
      case 2:
        return toggleDropdown2;
      case 3:
        return toggleDropdown3;
      case 4:
        return toggleDropdown4;
      default:
        return () {}; // Empty function as default
    }
  }


}

class HeadingOfDropdown extends StatelessWidget {
  HeadingOfDropdown({
    super.key,
    required this.img,
    required this.width,
    required this.heading,
    required this.isDropdownOpen,
  });

  final String img;
  final String heading;
  final bool isDropdownOpen;
  double width;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          // Replace with your SvgPicture.asset widget
          SvgPicture.asset(img,width: 20.w,),
          SizedBox(width: 7.0.h),
          SizedBox(
            width: 95.w,
            child: Text(
              "${heading=="Basic"? "Basic \$0.0":heading=="Extend"? "Extend \$2.99":heading=="Silver"? "Silver \$3.99":heading=="Gold"? "Gold \$9.99":heading=="Premium"? "Premium \$24.99":""}",
              style: GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 13.0.sp,fontWeight:FontWeight.w500  ),
              // style: TextStyle(
              //   color: Color(0xff1E1C1C),
              //   fontSize: 14.0.sp,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
          SizedBox(width: width),
          isDropdownOpen ? Icon(Icons.arrow_drop_down_sharp):Icon(Icons.arrow_right),
        ],
      );
    }
  }

class PurchaseBtn extends StatelessWidget {
  PurchaseBtn({super.key, required this.mobile, required this.password, required this.amount, required this.planid,});

  LoginController loginController=Get.find();
  final String mobile;
  final String password;
  final String amount;
  final String planid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          if(planid=="1"){
            print("::::: kajshdkjasd $mobile $password");
            Get.snackbar(
              'Already given',
              'Basic plan is already been given to you.',
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            mobile==password ? Navigator.pop(context): Get.offAll(() => LoginPage());
          }
          else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  Paymentmethod(amount: amount, planid: planid,),),
            );
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) =>
            //         Paymentmethod(amount: amount, planid: planid,),)
            // );
          }
        // print(":::::::::: ${mobile} ${password} ");
        // loginController.setUsername(mobile);
        // loginController.setPassword(password);
        //
        // print(":::::::::: ${loginController.username} ${loginController.password} ");
        // loginController.login().then((value) {
        //   Get.put(BudgetController());
        //   Get.put(EmployeeRegistrationController());
        //   Get.put(AddCatagoryController());
        //   Get.put(GetListSubCatController());
        //   Get.put(SubCatagoryAddController());
        //   Get.put(PromoCodeController());
        //   Get.put(AddEmployeeController());
        //   Get.put(EditUserInfoController());
        //   Get.put(UserInfoProfileController());
        //   Get.put(UserUsageInfoController());
        //   Get.put(EditExpenseController());
        //   Get.put(EmployeeListController());
        // }).then((value) {
        //   Get.put(BudgetController());
        //   Get.put(EmployeeRegistrationController());
        //   Get.put(AddCatagoryController());
        //   Get.put(GetListSubCatController());
        //   Get.put(SubCatagoryAddController());
        //   Get.put(PromoCodeController());
        //   Get.put(AddEmployeeController());
        //   Get.put(EditUserInfoController());
        //   Get.put(UserInfoProfileController());
        //   Get.put(UserUsageInfoController());
        //   Get.put(EditExpenseController());
        //   Get.put(EmployeeListController());
        // });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("${planid=='1' ?"Subscription free":"Subscription fee \$$amount"}",style: GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 18.sp,fontWeight:FontWeight.w500  ),),
              Container(
                height: 30.h,
                width: 105.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.sp),
                    color: Color(0xff4A0838)
                ),
                child: Center(child: Text("Purchase",style: GoogleFonts.mukta(color: Colors.white,fontSize: 18.sp,fontWeight:FontWeight.w500  ),)),
              ),
            ],
      )),
    );
  }
}

class Subheadingofdropdown extends StatelessWidget {
  const Subheadingofdropdown({
    super.key,
    required this.a,
  });

  final String a;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_right),
        SizedBox(width: 4.0.h),
        Text(a, style: GoogleFonts.mukta(color: Color(0xff055913),fontSize: 11.0.sp,fontWeight:FontWeight.w500,),

           // style: TextStyle(
          //   color: Color(0xff055913),
          //   fontSize: 14.0.sp,
          //   fontWeight: FontWeight.w500,
          // ),

        ),
      ],
    );
  }
}
