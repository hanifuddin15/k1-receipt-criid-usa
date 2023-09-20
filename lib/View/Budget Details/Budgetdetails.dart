import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/View/Employee%20List/EmployeeList.dart';
import 'package:k1recipt/View/subcatagory/BussinessBudget.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addCatagory/deleteCatWithBugetController.dart';
import 'package:k1recipt/controller/addCatagory/editCatagoryWithBudget.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/model/budgetlistmodel.dart';

import '../subcatagory/VehicleBudget.dart';

class Budgetdetails extends StatefulWidget {
  Budgetdetails({Key? key}) : super(key: key);

  @override
  State<Budgetdetails> createState() => _BudgetdetailsState();
}

class _BudgetdetailsState extends State<Budgetdetails> {
  final BudgetController budgetController = Get.find();

  AddCatagoryController addCatagoryController = Get.find();

  EditCatWithBudget editCatWithBudget=Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // activepopup==true?addcat1():null;
    // Get.put(BudgetController());
    Get.put(AddCatagoryController());
    Get.put(DeleteCatWithBudgetController());
    budgetController.fetchBudgetList();
    fetchBudgetList();

  }

  List<Datum> budgetList = [];
  StreamController<List<Datum>> streamController = StreamController.broadcast();

  DeleteCatWithBudgetController deleteCatWithBudgetController=Get.find();


  // void fetchBudgetList() async {
  //   //final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/165');
  //   print("KKKKKKK $user_id");
  //   // final url =
  //   //     Uri.parse('https://$baseurl/api/allcategory/withbudgetList/$user_id');
  //   final url =
  //   Uri.parse('https://$baseurl/api/category/withbudgetList/$user_id');
  //   https://dev.k1receipt.com/api/category/withbudgetList/141
  //   final headers = {
  //     'Authorization': 'Bearer $usertoken',
  //   };
  // try{
  //   final response = await http.get(url, headers: headers);
  //   print("::::::::::::::::::::;kkkkkk ${response.body}");
  //
  //   if(response.body.toString().substring(0,14)=="<!DOCTYPE html"){
  //     final url1 = Uri.parse('https://$baseurl/api/budget/show/$user_id');
  //     print("::::::::::::::::::::re response ${response.body}");
  //     final responsee = await http.get(url1, headers: headers);
  //
  //     if (responsee.statusCode == 200) {
  //       getbudgets=true;
  //       final jsonData = json.decode(response.body);
  //       print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
  //       final budgetListData = BudgetList.fromJson(jsonData);
  //       budgetList.assignAll(budgetListData.data as List<Datum>);
  //       streamController.add(budgetListData.data);
  //       print("object ");
  //       setState(() {
  //         streamController.stream;
  //       });
  //
  //     } else {
  //       // Handle error
  //       print('Error fetching budget list');
  //     }
  //   }else {
  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
  //       final budgetListData = BudgetList.fromJson(jsonData);
  //       budgetList.assignAll(budgetListData.data as List<Datum>);
  //       streamController.add(budgetListData.data);
  //       print("object ");
  //       setState(() {
  //         streamController.stream;
  //       });
  //     } else {
  //       // Handle error
  //       print('Error fetching budget list');
  //     }
  //   }
  //
  //   } catch (e) {
  //   // Error occurred, handle the exception here
  //   print('Error occurred: $e');
  //   }
  // }


  void fetchBudgetList() async {
    //final url = Uri.parse('https://$baseurl/api/allcategory/withbudgetList/165');
    print("KKKKKKK $user_id");
    // final url =
    //     Uri.parse('https://$baseurl/api/allcategory/withbudgetList/$user_id');
    final url = Uri.parse('https://$baseurl/api/category/withbudgetList/$d_id');
    https://dev.k1receipt.com/api/category/withbudgetList/141
    final headers = {
      'Authorization': 'Bearer $usertoken',
    };
    try{
      final response = await http.get(url, headers: headers);
      print("::::::::::::::::::::;kkkkkk ${response.body}");

      if(response.body.toString().substring(0,14)=="<!DOCTYPE html"){
        final url1 = Uri.parse('https://$baseurl/api/budget/show/$d_id');
        print("::::::::::::::::::::re response ${response.body}");
        final responsee = await http.get(url1, headers: headers);

        if (responsee.statusCode == 200) {
          getbudgets=true;
          final jsonData = json.decode(response.body);
          print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
          final budgetListData = BudgetList.fromJson(jsonData);
          budgetList.assignAll(budgetListData.data as List<Datum>);
          streamController.add(budgetListData.data);
          print("object ");
          setState(() {
            streamController.stream;
          });

        } else {
          // Handle error
          print('Error fetching budget list');
        }

      }else {
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          print("::::::::::::::::::::;jjjjjjjjjj ${jsonData}");
          final budgetListData = BudgetList.fromJson(jsonData);
          budgetList.assignAll(budgetListData.data as List<Datum>);
          streamController.add(budgetListData.data);
          print("object ");
          setState(() {
            streamController.stream;
          });
        } else {
          // Handle error
          print('Error fetching budget list');
        }
      }

    } catch (e) {
      // Error occurred, handle the exception here
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: usertype == 'General_User'
            ? null
            : AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'K-1 Receipts',
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  usertype == 'Employee'
                      ? SizedBox()
                      : Row(
                    children: [
                      Text(
                        '$g_name',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                        maxLines: 2,
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.black),
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(1000, 80, 0, 0),
                            items: [
                              PopupMenuItem<String>(
                                value: 'Add Employee',
                                child: Text('Add Employee'),
                              ),
                              PopupMenuItem<String>(
                                value: 'Employee List',
                                child: Text('Employee List'),
                              ),
                            ],
                          ).then((value) {
                            if (value == 'Add Employee') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddEmployee()),
                              );
                            } else if (value == 'Employee List') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Employeelist()),
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 25.h,
                width: 466.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.sp, top: 2.sp),
                  child: Text(
                    "Budget detail",
                    style: GoogleFonts.mukta(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 270.h,
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Container(
              //       height: 384.h,
              //       width: 320.w,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10.sp),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.1),
              //             blurRadius: 8.sp,
              //             offset: Offset(0, 2),
              //           ),
              //         ],
              //       ),
              //       child: Column(
              //         children: [
              //
              //           Align(
              //             alignment: Alignment.topLeft,
              //             child: Row(
              //               children: [
              //                 Container(
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color(0xffffffff),
              //                       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12), // Adjust the padding values as desired
              //                       shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(4),
              //                       ),
              //                     ),
              //                     onPressed: () {},
              //                     child: Row(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         Icon(Icons.arrow_drop_down, color: Colors.black),
              //                         Text(
              //                           'Budget',
              //                           style: GoogleFonts.poppins(
              //                             textStyle: TextStyle(
              //                               fontSize: 12,
              //                               color: Colors.black,
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 Spacer(),// Adjust the spacing between buttons
              //                 Container(
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color(0xffffffff),
              //                       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12), // Adjust the padding values as desired
              //                       shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(4),
              //                       ),
              //                     ),
              //                     onPressed: () {},
              //                     child: Text(
              //                       'Export',
              //                       style: GoogleFonts.poppins(
              //                         textStyle: TextStyle(
              //                           fontSize: 12,
              //                           color: Colors.black,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(width: 10), // Adjust the spacing between buttons
              //                 Container(
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color(0xffffffff),
              //                       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12), // Adjust the padding values as desired
              //                       shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(4),
              //                       ),
              //                     ),
              //                     onPressed: () {},
              //                     child: Text(
              //                       'Search',
              //                       style: GoogleFonts.poppins(
              //                         textStyle: TextStyle(
              //                           fontSize: 12,
              //                           color: Colors.black,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //
              //
              //
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Budget Details',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.mukta(
              //                       textStyle: TextStyle(
              //                         fontSize: 14,
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ),
              //                   IconButton(
              //                     onPressed: () {
              //                       // Delete action
              //                     },
              //                     icon: Icon(Icons.delete),
              //                     color: Colors.red,
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Category Name',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Business Insurance',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Amount',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     '450.00',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Created By',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Nabila Akter Nabila',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Color(0xffaca500),
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 10),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'Sub Category',
              //                     textAlign: TextAlign.left,
              //                     style: GoogleFonts.inter(
              //                       textStyle: TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   ),
              //                   ClipRRect(
              //                     borderRadius: BorderRadius.circular(8.sp),
              //                     child: Container(
              //                       color: Color(0xff3461a6),
              //                       padding: EdgeInsets.symmetric(
              //                         horizontal: 2.sp,
              //                         vertical: 0.1.sp,
              //                       ),
              //                       child: TextButton(
              //                         onPressed: () {
              //                           // Handle delete button press here
              //                         },
              //                         child: Text(
              //                           "View",
              //                           style: GoogleFonts.inter(
              //                             color: Color(0xffffffff),
              //                             fontSize: 12.0.sp,
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(height: 15.h),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width, // Customize the width of the box
                    height: 555.sp, // Customize the height of the box
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   border: Border.all(
                    //     color: Colors.white, // Customize the color of the border
                    //     width: 0.8, // Customize the width of the border
                    //   ),
                    //   borderRadius: BorderRadius.circular(
                    //       10), // Customize the border radius
                    // ),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(left: 8.sp, top: 8.sp),
                        //       child: Container(
                        //         width: 70.sp, // Customize the width of the box
                        //         height:
                        //             26.sp, // Customize the height of the box
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors
                        //                 .grey, // Customize the color of the border
                        //             width:
                        //                 0.8, // Customize the width of the border
                        //           ),
                        //           borderRadius: BorderRadius.circular(
                        //               5.sp), // Customize the border radius
                        //         ),
                        //         child: Center(
                        //           child: Row(
                        //             children: [
                        //               Spacer(),
                        //               Text(
                        //                 "Expense",
                        //                 style: GoogleFonts.mukta(
                        //                   textStyle: TextStyle(
                        //                     fontSize: 14,
                        //                     color: Colors.grey,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsets.only(
                        //                   left: 1.sp,
                        //                 ),
                        //                 child: Icon(
                        //                   Icons.arrow_drop_down_sharp,
                        //                   size: 14.sp,
                        //                   color: Colors.grey,
                        //                 ),
                        //               ),
                        //               Spacer(),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Spacer(),
                        //     Padding(
                        //       padding: EdgeInsets.only(left: 8.sp, top: 8.sp),
                        //       child: Container(
                        //         width: 70.sp, // Customize the width of the box
                        //         height:
                        //             26.sp, // Customize the height of the box
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors
                        //                 .grey, // Customize the color of the border
                        //             width:
                        //                 0.8, // Customize the width of the border
                        //           ),
                        //           borderRadius: BorderRadius.circular(
                        //               5.sp), // Customize the border radius
                        //         ),
                        //         child: Center(
                        //           child: Row(
                        //             children: [
                        //               Spacer(),
                        //               Text(
                        //                 "Expense",
                        //                 style: GoogleFonts.mukta(
                        //                   textStyle: TextStyle(
                        //                     fontSize: 14,
                        //                     color: Colors.grey,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsets.only(
                        //                   left: 1.sp,
                        //                 ),
                        //                 child: Icon(
                        //                   Icons.arrow_drop_down_sharp,
                        //                   size: 14.sp,
                        //                   color: Colors.grey,
                        //                 ),
                        //               ),
                        //               Spacer(),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 4.w,
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsets.only(right: 8.sp, top: 8.sp),
                        //       child: Container(
                        //         width: 70.sp, // Customize the width of the box
                        //         height: 26.sp, // Customize the height of the box
                        //         decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: Colors.grey, // Customize the color of the border
                        //             width: 0.8, // Customize the width of the border
                        //           ),
                        //           borderRadius: BorderRadius.circular(5.sp), // Customize the border radius
                        //         ),
                        //         child: Center(
                        //           child: Row(
                        //             children: [
                        //               Spacer(),
                        //               Text(
                        //                 "Export",
                        //                 style: GoogleFonts.mukta(
                        //                   textStyle: TextStyle(
                        //                     fontSize: 14,
                        //                     color: Colors.grey,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsets.only(
                        //                   left: 1.sp,
                        //                 ),
                        //                 child: Icon(
                        //                   Icons.arrow_drop_down_sharp,
                        //                   size: 14.sp,
                        //                   color: Colors.grey,
                        //                 ),
                        //               ),
                        //               Spacer(),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                print(":::::::::::");
                                addcat(context);
                              },
                              child: Container(
                                height: 30.h,
                                width: 112.w,
                                decoration: BoxDecoration(
                                    color: Color(0xff3461A6),
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7.w,),
                                    Icon(Icons.add,color: Colors.white,size: 15.sp,),
                                    SizedBox(width: 5.w,),
                                    Center(
                                      child: Text(
                                        "Add Catagory",
                                        style: GoogleFonts.mukta(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 9.sp,
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 488.h,
                        //   child: ListView.builder(
                        //         itemCount: 3,
                        //         itemBuilder: (context,i){
                        //         //final budget = budgetController.budgetList[i];
                        //           print("klklklklklkkkkkkkkkkk ${budgetController.budgetList.length}");
                        //           return Text("KK $i");
                        //
                        //       })
                        //
                        //
                        // )
                        SizedBox(
                          height: 7.h,
                        ),
                        // Container(
                        //   height: 490.h,
                        //   width: MediaQuery.of(context).size.width,
                        //   // color: Colors.green,
                        //   child: StreamBuilder(
                        //       stream: streamController.stream,
                        //       builder:
                        //           (BuildContext context, AsyncSnapshot snapshot) {
                        //         print("%%%%%%%%% $snapshot");
                        //         switch (snapshot.connectionState) {
                        //           case ConnectionState.none:
                        //             return const Text(
                        //               " null",
                        //               style: TextStyle(color: Colors.white),
                        //             );
                        //           case ConnectionState.waiting:
                        //             return const SizedBox();
                        //           case ConnectionState.active:
                        //             return (snapshot.hasData == false)
                        //                 ? const CircularProgressIndicator()
                        //                 : ListView.builder(
                        //                     padding: const EdgeInsets.only(top: 0),
                        //                     shrinkWrap: true,
                        //                     physics: const BouncingScrollPhysics(),
                        //                     itemCount: budgetList.length,
                        //                     itemBuilder: (context, i) {
                        //                       // managetotalcontact = contact.length.toString();
                        //                       // return Text("${ attendance[index].timein} || ${ attendance[index].timeout}");
                        //                       final budget = budgetList[i];
                        //                       return Padding(
                        //                         padding: EdgeInsets.symmetric(horizontal: 15.0.sp, vertical: 10.sp),
                        //                         child: Container(
                        //                           height: 154.h,
                        //                           width: 320.w,
                        //                           decoration: BoxDecoration(
                        //                             color: Colors.white,
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     10.sp),
                        //                             boxShadow: [
                        //                               BoxShadow(
                        //                                 color: Colors.black
                        //                                     .withOpacity(0.1),
                        //                                 blurRadius: 8.sp,
                        //                                 offset: Offset(0, 2),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                           child: Padding(padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                        //                             child: Column(
                        //                               children: [
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Budget Details',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .mukta(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 14,
                        //                                           color: Colors
                        //                                               .black,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .bold,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     IconButton(
                        //                                       onPressed: () {
                        //                                         // Delete action
                        //                                       },
                        //                                       icon: Icon(
                        //                                           Icons.delete),
                        //                                       color: Colors.red,
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Category Name',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.catName}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Amount',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.amountPerYear}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     )
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Created By',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.createdBy}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Color(
                        //                                               0xffaca500),
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .bold,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Sub Category',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     ClipRRect(
                        //                                       borderRadius:
                        //                                           BorderRadius
                        //                                               .circular(
                        //                                                   8.sp),
                        //                                       child: Container(
                        //                                         color: Color(
                        //                                             0xff3461a6),
                        //                                         padding: EdgeInsets
                        //                                             .symmetric(
                        //                                           horizontal:
                        //                                               2.sp,
                        //                                           vertical:
                        //                                               0.1.sp,
                        //                                         ),
                        //                                         child: TextButton(
                        //                                           onPressed: () {
                        //                                             Navigator.of(
                        //                                                     context)
                        //                                                 .push(MaterialPageRoute(
                        //                                                     builder: (context) => VehicleBudget(
                        //                                                           catname: budget.catName.toString(),
                        //                                                           cat_id: budget.catId.toString(),
                        //                                                         )));
                        //
                        //                                             // Handle delete button press here
                        //                                           },
                        //                                           child: Text(
                        //                                             "View",
                        //                                             style:
                        //                                                 GoogleFonts
                        //                                                     .inter(
                        //                                               color: Color(
                        //                                                   0xffffffff),
                        //                                               fontSize:
                        //                                                   12.0.sp,
                        //                                               fontWeight:
                        //                                                   FontWeight
                        //                                                       .w500,
                        //                                             ),
                        //                                           ),
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       );
                        //                     });
                        //           case ConnectionState.done:
                        //             return (snapshot.hasData == false)
                        //                 ? const CircularProgressIndicator()
                        //                 : ListView.builder(
                        //                     padding:
                        //                         const EdgeInsets.only(top: 0),
                        //                     shrinkWrap: true,
                        //                     physics: const BouncingScrollPhysics(),
                        //                     itemCount: budgetList.length,
                        //                     itemBuilder: (context, i) {
                        //                       final budget = budgetList[i];
                        //                       return Padding(
                        //                         padding: EdgeInsets.symmetric(
                        //                             horizontal: 15.0.sp,
                        //                             vertical: 10.sp),
                        //                         child: Container(
                        //                           height: 154.h,
                        //                           width: 320.w,
                        //                           decoration: BoxDecoration(
                        //                             color: Colors.white,
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     10.sp),
                        //                             boxShadow: [
                        //                               BoxShadow(
                        //                                 color: Colors.black
                        //                                     .withOpacity(0.1),
                        //                                 blurRadius: 8.sp,
                        //                                 offset: Offset(0, 2),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                           child: Padding(
                        //                             padding: EdgeInsets.symmetric(
                        //                                 horizontal: 12.0.sp),
                        //                             child: Column(
                        //                               children: [
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Budget Details',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .mukta(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 14,
                        //                                           color: Colors
                        //                                               .black,
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .bold,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     IconButton(
                        //                                       onPressed: () {
                        //                                         // Delete action
                        //                                       },
                        //                                       icon: Icon(
                        //                                           Icons.delete),
                        //                                       color: Colors.red,
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Category Name',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.catName}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Amount',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.amountPerYear}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     )
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Created By',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     Text(
                        //                                       '${budget.createdBy}',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Color(
                        //                                               0xffaca500),
                        //                                           fontWeight:
                        //                                               FontWeight
                        //                                                   .bold,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                                 SizedBox(height: 10),
                        //                                 Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .spaceBetween,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Sub Category',
                        //                                       textAlign:
                        //                                           TextAlign.left,
                        //                                       style: GoogleFonts
                        //                                           .inter(
                        //                                         textStyle:
                        //                                             TextStyle(
                        //                                           fontSize: 10,
                        //                                           color: Colors
                        //                                               .black,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                     ClipRRect(
                        //                                       borderRadius:
                        //                                           BorderRadius
                        //                                               .circular(
                        //                                                   8.sp),
                        //                                       child: Container(
                        //                                         color: Color(
                        //                                             0xff3461a6),
                        //                                         padding: EdgeInsets
                        //                                             .symmetric(
                        //                                           horizontal:
                        //                                               2.sp,
                        //                                           vertical:
                        //                                               0.1.sp,
                        //                                         ),
                        //                                         child: TextButton(
                        //                                           onPressed: () {
                        //                                             Navigator.of(
                        //                                                     context)
                        //                                                 .push(MaterialPageRoute(
                        //                                                     builder: (context) => VehicleBudget(
                        //                                                           catname: budget.catName.toString(),
                        //                                                           cat_id: budget.catId.toString(),
                        //                                                         )));
                        //
                        //                                             // Handle delete button press here
                        //                                           },
                        //                                           child: Text(
                        //                                             "View",
                        //                                             style:
                        //                                                 GoogleFonts
                        //                                                     .inter(
                        //                                               color: Color(
                        //                                                   0xffffffff),
                        //                                               fontSize:
                        //                                                   12.0.sp,
                        //                                               fontWeight:
                        //                                                   FontWeight
                        //                                                       .w500,
                        //                                             ),
                        //                                           ),
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       );
                        //                     });
                        //           default:
                        //             return const Text("default",
                        //                 style: TextStyle(color: Colors.white));
                        //         }
                        //       }),
                        // ),
                        Container(
                          //color: Colors.red,
                          height: 475.h,
                          child: Obx(
                            () => budgetController.budgetList.isEmpty
                                ? budgetController.loader==true ? Center(child: Text("No Catagory found")): Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: budgetController.budgetList.length,
                                    itemBuilder: (context, i) {
                                      final budget = budgetController.budgetList[i];
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 11.0.sp,
                                            vertical: 10.sp),
                                        child: Container(
                                          height: 154.h,
                                          width: 330.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.sp),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 8.sp,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.0.sp),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Budget Details',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.mukta(
                                                        textStyle: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    IconButton(
                                                      onPressed: () {
                                                        updatecat(context,budget.catName.toString(),budget.amountPerYear.toString(),budget.catId.toString());
                                                      },
                                                      icon: Icon(Icons.edit),
                                                      color: Colors.red,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        delcat(context,budget.catId.toString(), budget.budgetId.toString());
                                                        // Delete action
                                                        //deleteCatWithBudgetController.deleteCatWithBudget(budget.catId.toString(), budget.budgetId.toString());
                                                      },
                                                      icon: Icon(Icons.delete),
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Category Name',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${budget.catName}',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Amount',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '\$${budget.amountPerYear}', // Added a backslash before the dollar sign
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Created By',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${g_name}',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              Color(0xffaca500),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '',
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.sp),
                                                      child: Container(
                                                        color:
                                                            Color(0xff3461a6),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 2.sp,
                                                          vertical: 0.1.sp,
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            VehicleBudget(
                                                                              catname: budget.catName.toString(),
                                                                              cat_id: budget.catId.toString(),
                                                                            )));

                                                            // Handle delete button press here
                                                          },
                                                          child: Text(
                                                            "View Sub Category",
                                                            style: GoogleFonts
                                                                .inter(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 9.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                        SizedBox()
                        // SizedBox(
                        //   height: 488.h,
                        //   child: Obx(()=>
                        //   budgetController.budgetList.isEmpty
                        //       ? Center(
                        //           child: CircularProgressIndicator(),
                        //         ) :
                        //      ListView.builder(
                        //       itemCount: budgetController.budgetList.length,
                        //       itemBuilder: (context,i){
                        //       final budget = budgetController.budgetList[i];
                        //         return  Padding(
                        //         padding:  EdgeInsets.symmetric(horizontal: 15.0.sp,vertical: 10.sp),
                        //         child: Container(
                        //           height: 154.h,
                        //           width: 320.w,
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(10.sp),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: Colors.black.withOpacity(0.1),
                        //                 blurRadius: 8.sp,
                        //                 offset: Offset(0, 2),
                        //               ),
                        //             ],
                        //           ),
                        //           child: Padding(
                        //             padding:  EdgeInsets.symmetric(horizontal: 12.0.sp),
                        //             child: Column(
                        //               children: [
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text(
                        //                       'Budget Details',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.mukta(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 14,
                        //                           color: Colors.black,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     IconButton(
                        //                       onPressed: () {
                        //                         // Delete action
                        //                       },
                        //                       icon: Icon(Icons.delete),
                        //                       color: Colors.red,
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text(
                        //                       'Category Name',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Text(
                        //                       '${budget.catName}',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 SizedBox(height: 10),
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text('Amount',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Text('${budget.amountPerYear}',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //                 SizedBox(height: 10),
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text(
                        //                       'Created By',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     Text(
                        //                       '${budget.createdBy}',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Color(0xffaca500),
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 SizedBox(height: 10),
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text(
                        //                       'Sub Category',
                        //                       textAlign: TextAlign.left,
                        //                       style: GoogleFonts.inter(
                        //                         textStyle: TextStyle(
                        //                           fontSize: 10,
                        //                           color: Colors.black,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     ClipRRect(
                        //                       borderRadius: BorderRadius.circular(8.sp),
                        //                       child: Container(
                        //                         color: Color(0xff3461a6),
                        //                         padding: EdgeInsets.symmetric(
                        //                           horizontal: 2.sp,
                        //                           vertical: 0.1.sp,
                        //                         ),
                        //                         child: TextButton(
                        //                           onPressed: () {
                        //
                        //                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleBudget(catname: budget.catName.toString(),cat_id: budget.catId.toString(),)));
                        //
                        //                             // Handle delete button press here
                        //                           },
                        //                           child: Text(
                        //                             "View",
                        //                             style: GoogleFonts.inter(
                        //                               color: Color(0xffffffff),
                        //                               fontSize: 12.0.sp,
                        //                               fontWeight: FontWeight.w500,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                        //   ),
                        // ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );

  }

  delcat(context,String catid,String budgetid) {

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 390.w,
            height: 150.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Text('Are you sure you want to delete?',style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),),
                SizedBox(height: 10.h,),
                ElevatedButton(
                  onPressed: () {
                    deleteCatWithBudgetController.deleteCatWithBudget(catid,budgetid);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor:
                    const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(
                        120, 48), // Increase width and height of the button
                     ),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  TextEditingController _categoryController = TextEditingController();
  TextEditingController _otherFieldController = TextEditingController();

  addcat(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 390.w,
            height: 300.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Add Category',
                  style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: addCatagoryController.setcat_name,
                  decoration: InputDecoration(
                    hintText: 'Category Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: addCatagoryController.budget_amount_per_year,
                  decoration: InputDecoration(
                    hintText: 'Category Budget Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      activepopup=false;
                    });
                    // Handle button press inside the dialog box
                    addCatagoryController.addcat();
                    // Perform desired action with the entered category and other field
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor:
                        const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(
                        120, 48), // Increase width and height of the button
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addcat1() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 390.w,
            height: 300.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Add Category',
                  style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: addCatagoryController.setcat_name,
                  decoration: InputDecoration(
                    hintText: 'Category Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: addCatagoryController.budget_amount_per_year,
                  decoration: InputDecoration(
                    hintText: 'Category Budget Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      activepopup=false;
                    });
                    // Handle button press inside the dialog box
                    addCatagoryController.addcat();
                    // Perform desired action with the entered category and other field
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor:
                    const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(
                        120, 48), // Increase width and height of the button
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextEditingController updateCategoryController = TextEditingController();
  TextEditingController updateAmountController = TextEditingController();

  updatecat(context,String catname,String amount,String catid) {
    updateCategoryController.text=catname;
    updateAmountController.text=amount;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 390.w,
            height: 300.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Text('Update Category',style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),),
                SizedBox(height: 16),
                TextField(
                  //enableInteractiveSelection: true,
                  controller: updateCategoryController,
                  onChanged: editCatWithBudget.setcat_name,
                  decoration: InputDecoration(
                    hintText: 'Category Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                // Text("Catagory Name: $catname", style: GoogleFonts.mukta(textStyle: TextStyle(
                //   fontSize: 14,
                //   color: Colors.black,
                //   fontWeight:
                //   FontWeight.bold,
                // ),),),
                SizedBox(height: 16),
                TextField(
                  keyboardType:TextInputType.number ,
                  controller: updateAmountController,
                  onChanged: editCatWithBudget.setupdatebudget_amount_per_year,
                  decoration: InputDecoration(
                    hintText: 'Category Budget Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    editCatWithBudget.cat_id.value=catid;

                    if(editCatWithBudget.cat_name.value==catname) {
                      editCatWithBudget.cat_name.value = catname;
                    }else{
                      editCatWithBudget.cat_name.value = updateCategoryController.text;
                    }

                    print("hamary pas ${editCatWithBudget.updatebudget_amount_per_year.value}::: ${updateAmountController.text}");
                    if(editCatWithBudget.updatebudget_amount_per_year.value.isEmpty){
                      editCatWithBudget.updatebudget_amount_per_year.value=updateAmountController.text;
                    }
                    // else if(){
                    //
                    // }

                    editCatWithBudget.editCat();

                    print("::::::::::::: ${editCatWithBudget.cat_name.value} :: ${editCatWithBudget.updatebudget_amount_per_year.value}");

                    // Handle button press inside the dialog box
                    // addCatagoryController.addcat();
                    // Perform desired action with the entered category and other field

                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor: const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(120, 48),
                      ),
                      child:editCatWithBudget.isLoading==true ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 1.1.w,
                        ),
                      ): Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                    ),

              ],
            ),
          ),
        );
      },
    );
  }

}
