import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/controller/employeeListController/employeeListContoller.dart';

class Employeelist extends StatefulWidget {
  Employeelist({Key? key}) : super(key: key);

  @override
  State<Employeelist> createState() => _EmployeelistState();
}

class _EmployeelistState extends State<Employeelist> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeListController.fetchemployeeList;
  }

  EmployeeListController employeeListController=Get.put(EmployeeListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 8.sp),
                child: Row(
                  children: [
                    SizedBox(width: 10.w,),
                    Text(
                      "K-1 Receipts",
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    // SvgPicture.asset(
                    //   "assets/setting.svg",
                    //   height: 18.h,
                    //   width: 18.w,
                    // ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const PlanStatistics()),
                  // );
                },
                child: Container(
                  height: 25.h,
                  width: 426.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.sp),
                      color: Color(0xff3461a6)
                  ),
                  child: Center(child: Text("Employee List",style: GoogleFonts.mukta(color: Colors.white,fontSize: 12.sp,fontWeight:FontWeight.w500  ),)),

                ),
              ),
              SizedBox(height: 12.h,),
              
              // Expanded(
              //     child: ListView.builder(
              //       itemCount: 50,
              //       itemBuilder: (context, i) {
              //         return Padding(
              //           padding: EdgeInsets.only(bottom: 12.0.sp, left: 9.sp, right: 9.sp),
              //           child: Container(
              //             height: 30.sp,
              //             width: MediaQuery.of(context).size.width,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(5.sp),
              //               color: Color(0xffffffff),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.grey.withOpacity(0.5),
              //                   spreadRadius: 2,
              //                   blurRadius: 5,
              //                   offset: Offset(0, 2),
              //                 ),
              //               ],
              //             ),
              //             child: Row(
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.symmetric(horizontal: 12.sp),
              //                   child: Text(
              //                     "Sabariya Muzumder",
              //                     style: GoogleFonts.mukta(
              //                       color: Color(0xff1E1C1C),
              //                       fontSize: 14.0.sp,
              //                       fontWeight: FontWeight.w500,
              //                     ),
              //                   ),
              //                 ),
              //                 Spacer(),
              //                 ClipRRect(
              //                   borderRadius: BorderRadius.circular(8.sp),
              //                   child: Container(
              //                     color: Color(0xff3461a6),
              //                     padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 0.sp),
              //                     child: TextButton(
              //                       onPressed: () {
              //                         // Handle delete button press here
              //                       },
              //                       child: Text(
              //                         "Delete",
              //                         style: GoogleFonts.mukta(
              //                           color: Color(0xffffffff),
              //                           fontSize: 12.0.sp,
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(width: 14.w),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print(":::::::::::");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEmployee()),
                      );
                    },
                    child: Container(
                      height: 20.h,
                      width: 93.w,
                      decoration: BoxDecoration(
                          color: Color(0xff3461A6),
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: Row(
                        children: [
                          SizedBox(width: 7.w,),
                          Icon(Icons.add,color: Colors.white,size: 15.sp,),
                          SizedBox(width: 2.w,),
                          Center(
                            child: Text(
                              "Add Employee",
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 9.sp,
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
              SizedBox(
                height: 9.h,
              ),
            Container(
              //color: Colors.blueAccent,
              height: 557.h,
              child: Obx(() =>  ListView.builder(
                      itemCount: employeeListController.budgetList.length,
                      itemBuilder: (context, i) {
                        print(":::::::::::::: JHJHJHJHJ ${employeeListController.budgetList[i].name}");
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0.sp, left: 9.sp, right: 9.sp),
                          child: Container(
                            height: 30.sp,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                                  child: Text(
                                    "${employeeListController.budgetList[i].name}",
                                    style: GoogleFonts.mukta(
                                      color: Color(0xff1E1C1C),
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                // Container(
                                //   height: 20.h,
                                //   width: 50.w,
                                //
                                //   decoration: BoxDecoration(
                                //     color: Color(0xff3461a6),
                                //     borderRadius: BorderRadius.circular(7.sp),
                                //
                                //   ),
                                //   child: Center(
                                //     child: Text(
                                //               "Details",
                                //               style: GoogleFonts.mukta(
                                //                 color: Color(0xffffffff),
                                //                 fontSize: 10.0.sp,
                                //                 fontWeight: FontWeight.w500,
                                //               ),
                                //             ),
                                //   ),
                                //
                                // ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(8.sp),
                                //   child: Container(
                                //     color: Color(0xff3461a6),
                                //     padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 0.sp),
                                //     child: TextButton(
                                //       onPressed: () {
                                //         // Handle delete button press here
                                //       },
                                //       child: Text(
                                //         "Delete",
                                //         style: GoogleFonts.mukta(
                                //           color: Color(0xffffffff),
                                //           fontSize: 12.0.sp,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(width: 14.w),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              // Padding(
              //   padding:  EdgeInsets.only(bottom: 12.0.sp,left: 9.sp,right: 9.sp),
              //   child: Container(
              //     height: 30.sp,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.sp),
              //       color: Colors.grey
              //     ),
              //
              //   ),
              // ),

              // Row(
              //   children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(50.0.sp),
              //       child: Image.asset(
              //         "assets/profilepic.jpg",
              //         height: 99.h,
              //         width: 99.w,
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 21.w,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Text(
              //               "Sabariya Muzumder",
              //               style: GoogleFonts.mukta(
              //                   color: Color(0xff1E1C1C),
              //                   fontSize: 18.0.sp,
              //                   fontWeight: FontWeight.w500),
              //             ),
              //             SizedBox(
              //               width: 6.w,
              //             ),
              //             SvgPicture.asset(
              //               "assets/Group 91.svg",
              //               height: 13.h,
              //               width: 15.w,
              //             ),
              //           ],
              //         ),
              //         Text(
              //           "sabariyamuzumder9921@gmail.com",
              //           style: GoogleFonts.mukta(
              //               color: Color(0xff1E1C1C),
              //               fontSize: 12.0.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         Text(
              //           "Cell: +1-9947792172",
              //           style: GoogleFonts.mukta(
              //               color: Color(0xff1E1C1C),
              //               fontSize: 12.0.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         Text(
              //           "United States",
              //           style: GoogleFonts.mukta(
              //               color: Color(0xff1E1C1C),
              //               fontSize: 12.0.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         Row(
              //           children: [
              //             Container(
              //               height: 25.h,
              //               width: 80.w,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(24.sp),
              //                   color: Color(0xff0D8F29)),
              //               child: Center(
              //                   child: Text(
              //                     "Purchase",
              //                     style: GoogleFonts.mukta(
              //                         color: Colors.white,
              //                         fontSize: 12.sp,
              //                         fontWeight: FontWeight.w500),
              //                   )),
              //             ),
              //             SizedBox(
              //               width: 17.w,
              //             ),
              //             Container(
              //               height: 25.h,
              //               width: 80.w,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(24.sp),
              //                   color: Color(0xff081C3B)),
              //               child: Center(
              //                   child: Text(
              //                     "Purchase",
              //                     style: GoogleFonts.mukta(
              //                         color: Colors.white,
              //                         fontSize: 12.sp,
              //                         fontWeight: FontWeight.w500),
              //                   )),
              //             ),
              //           ],
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 94.h,
              // ),
              // Container(
              //   height: 194.h,
              //   width: 250.w,
              //   decoration: BoxDecoration(
              //       color: Color(0xffF0FDF6),
              //       borderRadius: BorderRadius.circular(10.sp),
              //       border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 149.h,
              //       ),
              //       Text(
              //         "Scan a Receipt",
              //         style: GoogleFonts.mukta(
              //             color: Color(0xff1E1C1C),
              //             fontSize: 18.0.sp,
              //             fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          //   itemCount: iconList.length,
          //   tabBuilder: (int index, bool isActive) {
          //     final color = isActive ? Colors.yellow : Colors.white;
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           iconList[index],
          //           size: 24,
          //           color: color,
          //         ),
          //         const SizedBox(height: 4),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 8),
          //           child: AutoSizeText(
          //             "brightness $index",
          //             maxLines: 1,
          //             style: TextStyle(color: color),
          //             group: autoSizeGroup,
          //           ),
          //         )
          //       ],
          //     );
          //   },
          //   backgroundColor: Colors.black,
          //   activeIndex: _bottomNavIndex,
          //   splashColor: Colors.red,
          //   notchAndCornersAnimation: borderRadiusAnimation,
          //   splashSpeedInMilliseconds: 300,
          //   notchSmoothness: NotchSmoothness.defaultEdge,
          //   gapLocation: GapLocation.center,
          //   leftCornerRadius: 32,
          //   rightCornerRadius: 32,
          //   onTap: (index) => setState(() => _bottomNavIndex = index),
          //   hideAnimationController: _hideBottomBarAnimationController,
          //   shadow: BoxShadow(
          //     offset: Offset(0, 1),
          //     blurRadius: 12,
          //     spreadRadius: 0.5,
          //     color: Colors.yellow,
          //   ),
          // ),

        ));
  }

}

