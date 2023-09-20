import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/usageInformation/userUsageInfoController.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  List<String> servicesname = ['Category Itemization','Sub Category','Budget','Number of User','Number of Receipt/month',
    'Role','Reports/month','Customize Reports','Exporting Format','CPA Sharing','Alerts',];

  UserUsageInfoController userUsageInfoController= Get.find();

  List<String> userifo=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // userUsageInfoController.userinfousagepackageUserService.clear();
    // userUsageInfoController.userinfousagepackagedata.clear();

    Get.put(UserUsageInfoController());
    userUsageInfoController.fetchUserUsageInfo();
    // userUsageInfoController.userinfousagepackagedata;
    // userUsageInfoController.userinfousagepackageUserService;
  }

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
                    Spacer(),
                    SvgPicture.asset(
                      "assets/setting.svg",
                      height: 18.h,
                      width: 18.w,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal:12.sp),
                child: Row(
                  children: [
                    // Replace with your SvgPicture.asset widget
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0.sp),
                      child: Image.asset(
                        "assets/profilepic.jpg",
                        height: 27.sp,
                        width: 27.sp,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 7.0.h),
                    Text(
                      "$g_name",
                      style: GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 12.0.sp,fontWeight:FontWeight.w500  ),
                      // style: TextStyle(
                      //   color: Color(0xff1E1C1C),
                      //   fontSize: 14.0.sp,
                      //   fontWeight: FontWeight.w500,
                      // ),
                    ),
                    SizedBox(width: 7),
                    SvgPicture.asset(
                      "${userUsageInfoController.userinfousagepackageUserService.first.planId==1 ?"assets/Group 91.svg":
                      userUsageInfoController.userinfousagepackageUserService.first.planId==2 ?"assets/Group 92.svg":
                      userUsageInfoController.userinfousagepackageUserService.first.planId==3 ?"assets/Group 93.svg":
                      userUsageInfoController.userinfousagepackageUserService.first.planId==4 ?"assets/Group 94.svg":
                      userUsageInfoController.userinfousagepackageUserService.first.planId==5 ?"assets/Group 95.svg":""}",
                      height: 15.h,
                      width: 18.w,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const PlanStatistics()),
                  // );
                },
                child: Container(
                  height: 25.h,
                  width: 126.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.sp),
                      color: Color(0xff0D8F29)
                  ),
                  child: Obx(()=> Center(child: Text("${userUsageInfoController.userinfousagepackageUserService.isEmpty?
                  '':userUsageInfoController.userinfousagepackageUserService.first.planId==1 ?"Basic":
                  userUsageInfoController.userinfousagepackageUserService.first.planId==2 ?"Extend":
                  userUsageInfoController.userinfousagepackageUserService.first.planId==3 ?"Silver":
                  userUsageInfoController.userinfousagepackageUserService.first.planId==4 ?"Gold":
                  userUsageInfoController.userinfousagepackageUserService.first.planId==5 ?"Premium":""
                  } Plan Statistics",style: GoogleFonts.mukta(color: Colors.white,fontSize: 12.sp,fontWeight:FontWeight.w500  ),))),

                ),
              ),
              SizedBox(height: 12.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  children: [
                    Text(
                      "Services",
                      style: GoogleFonts.mukta(
                          color: Color(0xff1E1C1C),
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "Used",
                      style: GoogleFonts.mukta(
                          color: Color(0xff1E1C1C),
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "Remaining",
                      style: GoogleFonts.mukta(
                          color: Color(0xff1E1C1C),
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(0xff828282),
              ),
              SizedBox(height: 12.h,),
              Obx(()=>userUsageInfoController.userinfousagepackageUserService.isEmpty
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 1.1.w,
                              ),
                            )
                          : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[0], userUsageInfoused: userUsageInfoController.userinfousagepackagedata.first.categoryUsage, userUsageInforeaming: userUsageInfoController.userinfousagepackagedata.first.categoryRemaining,)),
              Obx(() => userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[1], userUsageInfoused: userUsageInfoController.userinfousagepackagedata.first.subCategoryUsage,userUsageInforeaming: userUsageInfoController.userinfousagepackagedata.first.subCategoryRemaining,)),
              Obx(()=> userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[2], userUsageInfoused: userUsageInfoController.userinfousagepackagedata.first.budgetUsage,userUsageInforeaming: userUsageInfoController.userinfousagepackagedata.first.budgetRemaining,)),
              Obx(()=> userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[3], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.userNumber,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.userNumber,)),
              Obx(()=> userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[4], userUsageInfoused: userUsageInfoController.userinfousagepackagedata.first.receiptUsage,userUsageInforeaming: userUsageInfoController.userinfousagepackagedata.first.receiptRemaining,)),
              Obx(()=>userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  :  ServicesWithUsageAndReamaingInfo(servicesname: servicesname[5], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.roleNumber,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.roleNumber,)),
              Obx(()=> userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  : ServicesWithUsageAndReamaingInfo(servicesname: servicesname[6], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.reportPerMonth,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.reportPerMonth,)),
              Obx(()=>userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  :  ServicesWithUsageAndReamaingInfo(servicesname: servicesname[8], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.userServiceExport,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.userServiceExport,)),
              Obx(()=>userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  :  ServicesWithUsageAndReamaingInfo(servicesname: servicesname[9], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.cpaShare,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.cpaShare,)),
              Obx(()=>userUsageInfoController.userinfousagepackageUserService.isEmpty
                  ? SizedBox(
                height: 20,
                width: 20,

              )
                  :  ServicesWithUsageAndReamaingInfo(servicesname: servicesname[10], userUsageInfoused: userUsageInfoController.userinfousagepackageUserService.first.alert,userUsageInforeaming: userUsageInfoController.userinfousagepackageUserService.first.alert,)),
              // Expanded(
              //   child: Obx(()
              //     => userUsageInfoController.userinfousagepackageUserService.isEmpty
              //         ? Center(child: CircularProgressIndicator(),)
              //         : ListView.builder(
              //           itemCount: 11,
              //           itemBuilder: (context, i) {
              //             return Padding(
              //               padding:  EdgeInsets.only(bottom: 12.0.sp,left: 9.sp,right: 9.sp),
              //               child: Container(
              //                 height: 30.sp,
              //                 width: MediaQuery.of(context).size.width,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(20.sp),
              //                     color: Color(0xffe0e0e0)
              //                 ),
              //                 child:  Padding(
              //                 padding:  EdgeInsets.symmetric(horizontal: 12.sp),
              //                 child: Row(
              //                   children: [
              //                     SizedBox(
              //                       width:150.w,
              //                       child: Text(
              //                         "${servicesname[i]}",
              //                         style: GoogleFonts.mukta(
              //                             color: Color(0xff1E1C1C),
              //                             fontSize: 11.0.sp,
              //                             fontWeight: FontWeight.w500),
              //                       ),
              //                     ),
              //                     Text(
              //                       "${05+i}",
              //                       style: GoogleFonts.mukta(
              //                           color: Color(0xff1E1C1C),
              //                           fontSize: 14.0.sp,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     SizedBox(width: 14.w,),
              //                     Spacer(),
              //                     Text(
              //                       "${20000*i+1234}",
              //                       style: GoogleFonts.mukta(
              //                           color: Color(0xff1E1C1C),
              //                           fontSize: 14.0.sp,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               ),
              //             );
              //           },
              //       ),
              //     ),
              //   ),

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

class ServicesWithUsageAndReamaingInfo extends StatelessWidget {
   ServicesWithUsageAndReamaingInfo({
    super.key,
    required this.servicesname,
    required this.userUsageInfoused,
    required this.userUsageInforeaming,
  });

  final String servicesname;
  var userUsageInfoused;
  var userUsageInforeaming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 12.0.sp,left: 9.sp,right: 9.sp),
      child: Container(
        height: 30.sp,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: Color(0xffe0e0e0)
        ),
        child:  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.sp),
          child: Row(
            children: [
              SizedBox(
                width:150.w,
                child: Text(
                  "${servicesname}",
                  style: GoogleFonts.mukta(
                      color: Color(0xff1E1C1C),
                      fontSize: 11.0.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 66.w,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 89.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        "${userUsageInfoused}",
                        style: GoogleFonts.mukta(
                            color: Color(0xff1E1C1C),
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 26.w,),
              SizedBox(
                width: 66.w,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Container(
                    //color: Colors.green,
                    width: 89.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${userUsageInforeaming}",
                          style: GoogleFonts.mukta(
                              color: Color(0xff1E1C1C),
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.w500),overflow:TextOverflow.fade ,
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


    // return Obx(()
    //   => Padding(
    //     padding:  EdgeInsets.only(bottom: 12.0.sp,left: 9.sp,right: 9.sp),
    //     child: Container(
    //       height: 30.sp,
    //       width: MediaQuery.of(context).size.width,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20.sp),
    //           color: Color(0xffe0e0e0)
    //       ),
    //       child:  Padding(
    //         padding:  EdgeInsets.symmetric(horizontal: 12.sp),
    //         child: Row(
    //           children: [
    //             SizedBox(
    //               width:150.w,
    //               child: Text(
    //                 "${servicesname}",
    //                 style: GoogleFonts.mukta(
    //                     color: Color(0xff1E1C1C),
    //                     fontSize: 11.0.sp,
    //                     fontWeight: FontWeight.w500),
    //               ),
    //             ),
    //             SizedBox(
    //               width: 66.w,
    //
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: SizedBox(
    //                   width: 111.w,
    //                   child: SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: Text(
    //                       "${userUsageInfoused}",
    //                       style: GoogleFonts.mukta(
    //                           color: Color(0xff1E1C1C),
    //                           fontSize: 10.0.sp,
    //                           fontWeight: FontWeight.w500),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(width: 26.w,),
    //             SizedBox(
    //               width: 66.w,
    //
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //
    //                 child: Container(
    //                   //color: Colors.green,
    //                   width: 89.w,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         "${userUsageInforeaming}",
    //                         style: GoogleFonts.mukta(
    //                             color: Color(0xff1E1C1C),
    //                             fontSize: 10.0.sp,
    //                             fontWeight: FontWeight.w500),overflow:TextOverflow.fade ,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
