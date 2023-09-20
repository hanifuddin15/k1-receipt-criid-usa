import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/Budget%20Details/Budgetdetails.dart';
import 'package:k1recipt/View/Employee%20List/EmployeeList.dart';
import 'package:k1recipt/View/userProfile/userProfile.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/expenseController/expenseAddController.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k1recipt/constants/global.dart';

class NavigationIcon {
  final IconData icon;
  final String title;
  final Color color;
  final bool isBig; // New property to indicate if the icon should appear bigger

  NavigationIcon(
      {required this.icon,
      required this.title,
      required this.color,
      this.isBig = false});

}

class PlanStatistics extends StatefulWidget {
  const PlanStatistics({Key? key}) : super(key: key);

  @override
  State<PlanStatistics> createState() => _PlanStatisticsState();
}

class _PlanStatisticsState extends State<PlanStatistics> {
  // final autoSizeGroup = AutoSizeGroup();
  // var _bottomNavIndex = 0; //default index of a first screen
  //
  // late AnimationController _fabAnimationController;
  // late AnimationController _borderRadiusAnimationController;
  // late Animation<double> fabAnimation;
  // late Animation<double> borderRadiusAnimation;
  // late CurvedAnimation fabCurve;
  // late CurvedAnimation borderRadiusCurve;
  // late AnimationController _hideBottomBarAnimationController;
  //
  // final iconList = <IconData>[
  //   Icons.brightness_5,
  //   Icons.brightness_4,
  //   Icons.brightness_6,
  //   Icons.brightness_7,
  // ];

  @override
  void initState() {
    super.initState();
    // _fabAnimationController = AnimationController(
    //   duration: Duration(milliseconds: 500),
    //   vsync: this,
    // );
    // _borderRadiusAnimationController = AnimationController(
    //   duration: Duration(milliseconds: 500),
    //   vsync: this,
    // );
    // fabCurve = CurvedAnimation(
    //   parent: _fabAnimationController,
    //   curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    // );
    // borderRadiusCurve = CurvedAnimation(
    //   parent: _borderRadiusAnimationController,
    //   curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    // );
    //
    // fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    // borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
    //   borderRadiusCurve,
    // );
    //
    // // _hideBottomBarAnimationController = AnimationController(
    // //   duration: Duration(milliseconds: 200),
    // //   vsync: this,
    // // );
    //
    // Future.delayed(
    //   Duration(seconds: 1),
    //   () => _fabAnimationController.forward(),
    // );
    // Future.delayed(
    //   Duration(seconds: 1),
    //   () => _borderRadiusAnimationController.forward(),
    // );
  }

  // bool onScrollNotification(ScrollNotification notification) {
  //   if (notification is UserScrollNotification &&
  //       notification.metrics.axis == Axis.vertical) {
  //     switch (notification.direction) {
  //       case ScrollDirection.forward:
  //         _hideBottomBarAnimationController.reverse();
  //         _fabAnimationController.forward(from: 0);
  //         break;
  //       case ScrollDirection.reverse:
  //         _hideBottomBarAnimationController.forward();
  //         _fabAnimationController.reverse(from: 1);
  //         break;
  //       case ScrollDirection.idle:
  //         break;
  //     }
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      "assets/Group 71.svg",
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0.sp),
                      child: Image.asset(
                        "assets/profilepic.jpg",
                        height: 99.sp,
                        width: 99.sp,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 21.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sabariya Muzumder",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            SvgPicture.asset(
                              "assets/Group 91.svg",
                              height: 13.h,
                              width: 15.w,
                            ),
                          ],
                        ),
                        Text(
                          "sabariyamuzumder9921@gmail.com",
                          style: GoogleFonts.mukta(
                              color: Color(0xff1E1C1C),
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Cell: +1-9947792172",
                          style: GoogleFonts.mukta(
                              color: Color(0xff1E1C1C),
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "United States",
                          style: GoogleFonts.mukta(
                              color: Color(0xff1E1C1C),
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const UserProfile()),
                                );
                              },
                              child: Container(
                                height: 25.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.sp),
                                    color: Color(0xff0D8F29)),
                                child: Center(
                                    child: Text(
                                  "Purchase",
                                  style: GoogleFonts.mukta(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                            SizedBox(
                              width: 17.w,
                            ),
                            Container(
                              height: 25.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.sp),
                                  color: Color(0xff081C3B)),
                              child: Center(
                                  child: Text(
                                "Purchase",
                                style: GoogleFonts.mukta(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 94.h,
                ),
                Container(
                  height: 194.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF0FDF6),
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 149.h,
                      ),
                      Text(
                        "Scan a Receipt",
                        style: GoogleFonts.mukta(
                            color: Color(0xff1E1C1C),
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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




// class NavigationScreen extends StatefulWidget {
//   final IconData iconData;
//   NavigationScreen(this.iconData) : super();
//
//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }
//
// class _NavigationScreenState extends State<NavigationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> animation;
//
//   @override
//   void didUpdateWidget(NavigationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.iconData != widget.iconData) {
//       _startAnimation();
//     }
//   }
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//     super.initState();
//   }
//
//   _startAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.background,
//       child: ListView(
//         children: [
//           SizedBox(height: 64),
//           Center(
//             child: CircularRevealAnimation(
//               animation: animation,
//               centerOffset: Offset(80, 80),
//               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
//               child: Icon(
//                 widget.iconData,
//                 color: Colors.purpleAccent,
//                 size: 160,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



class CatIDName{
  CatIDName({required this.name,required this.id});
  String name;
  String id;
}

class SubCatIDName{
  SubCatIDName({required this.name,required this.id});
  String name;
  String id;
}


class GeneralPlanStatistics extends StatefulWidget {
  const GeneralPlanStatistics({Key? key}) : super(key: key);

  @override
  State<GeneralPlanStatistics> createState() => _GeneralPlanStatisticsState();
}

class _GeneralPlanStatisticsState extends State<GeneralPlanStatistics> {

  List<CatIDName> allcat=[];
  List<String> cat_name=[];
  late DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String date;
        date="${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
        setState(() {
          // editLeadController.dateOfBirthController=date;
          // print("::::::: ${editLeadController.dateOfBirthController.toString()}");
        });
      });
    }
  }


  fetchallcat() async {
    int num=0;
    int subnum=0;
    var all= await allcatfromcontroller.budgetList.obs;

    print("::::: ${all.value.length}");
    if(all.value.isEmpty==false){
      allcatfromcontroller.budgetList.forEach((element) {

        allcat.add(CatIDName(name: element.catName.toString(), id: element.catId.toString()));
        cat_name.add('${element.catName.toString()}');
        num=num+1;

        print(":::::::::: $num");
        if(num==1){

          // for(int i=0;i<=allcat.length;i++){
          //
          //   getlistsubCatagory.getlistOfSubCat(allcat[i].id);
          //
          // }
        }
      });
    }
  }


  fetchallcat1() async {
    int num=0;
    int subnum=0;
    var all= await allcatfromcontroller.budgetList.obs;


    print("::::: ${all.value.length}");
    if(all.value.isEmpty==false){
      allcatfromcontroller.budgetList.forEach((element) {

        allcat.add(CatIDName(name: element.catName.toString(), id: element.catId.toString()));
        cat_name.add('${element.catName.toString()}');
        num=num+1;

        print(":::::::::: $num");
        if(num==1){
          getlistsubCatagory.getlistOfSubCat(allcat.first.id).then((value) {
            //selectedDropdownValue=allcat.first.name;
            print("first time runging sub cat funtion ${allcat.first.id}");
            fetchAllSubCat();
          });
          // for(int i=0;i<=allcat.length;i++){
          //
          //   getlistsubCatagory.getlistOfSubCat(allcat[i].id);
          //
          // }
        }
      });
    }
  }


  GetListSubCatController getallsub=Get.put(GetListSubCatController());
  List<CatIDName> allsubcat=[];
  List<String> subCats=[];

  fetchAllSubCat() async {
    allsubcat.clear();
    subCats.clear();
    int num=0;
    int subnum=0;
    var all= await getallsub.subcatList.obs;
    print("::::: ${all.value.length}");
    setState(() {
      selectedSubCatDropdownValue=getallsub.subcatList.first.subcatName;
    });
    if(all.value.isEmpty==false){
      getallsub.subcatList.forEach((element) {
        allsubcat.add(CatIDName(name: element.subcatName.toString(), id: element.subcatId.toString()));
        subCats.add('${element.subcatName.toString()}');
        num=num+1;
        print(":::::::::: ${element.subcatName}");
      });
    }
  }

  String selectedDropdownValue='';
  String selectedSubCatDropdownValue='';
  bool showDropdown = false;
  Color nextButtonColor = Colors.red;
  bool shownextbuton = false;
  bool showbackbuton = false;
  bool storefield = false;
  bool showStoreTextField = false;
  bool showTotalAmountTextField = false;
  bool showNoteTextField = false;
  bool showPurchasingDateTextField =false;
  bool showsubcatdropdown=false;
  bool showshopname=false;

  BudgetController allcatfromcontroller=Get.put(BudgetController());
  GetListSubCatController getlistsubCatagory=Get.find();

  ExpenseAddController addexpense=Get.put(ExpenseAddController());

  @override
  void initState() {
    super.initState();
    fetchallcat1();
    addexpense.totalamount.value='';
    addexpense.note.value='';
    addexpense.shopname.value='';
  }

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController totalAmountNameController = TextEditingController();
  final TextEditingController NoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // shopNameController.text=addexpense.shopname.value;
    // totalAmountNameController.text=addexpense.totalamount.value;
    // NoteController.text=addexpense.note.value;

    return SafeArea(

        child: Scaffold(
          // appBar:usertype == 'General_User' ? null : AppBar(
          //     //automaticallyImplyLeading: usertype == 'General_User'?false:true,
          //     backgroundColor: Colors.white,
          //     title: Text(
          //       'K-1 Receipts',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     actions: [
          //       usertype =='Employee'? SizedBox(): SizedBox(
          //         child:
          //         PopupMenuButton<String>(
          //           onSelected: (value) {
          //             if (value == 'Add Employee') {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => AddEmployee()),
          //               );
          //             } else if (value == 'Employee List') {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => Employeelist()),
          //               );
          //             }
          //           },
          //           itemBuilder: (BuildContext context) => [
          //             const PopupMenuItem<String>(
          //               value: 'Add Employee',
          //               child: Text('Add Employee'),
          //             ),
          //             const PopupMenuItem<String>(
          //               value: 'Employee List',
          //               child: Text('Employee List'),
          //             ),
          //           ],
          //           child: Container(
          //             width: 130.w,
          //             //margin: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          //             // decoration: BoxDecoration(
          //             //   color: Color(0xff4a7cc8),
          //             //   borderRadius: BorderRadius.circular(10),
          //             // ),
          //             child:  Row(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 // CircleAvatar(
          //                 //   backgroundImage: AssetImage('assets/1.png'),
          //                 //   radius: 10,
          //                 // ),
          //                 // SizedBox(width: 3),
          //                 Text(
          //                   //'Company Name',
          //                   "$g_name",
          //                   style: TextStyle(
          //                     color: Colors.green,
          //                   ),
          //                   maxLines: 2,
          //                 ),
          //                 SizedBox(width: 5.w,),
          //                 Icon(Icons.more_vert,color: Colors.black,)
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 10.w,)
          //       // usertype =='Employee'? SizedBox(): IconButton(
          //       //   icon: Icon(Icons.more_vert,color: Colors.black,),
          //       //   onPressed: () {},
          //       // ),
          //     ],
          //   ),
          resizeToAvoidBottomInset: false,

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
          body:Obx(()=>
              Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    usertype == 'General_User'?Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          "assets/Group 71.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                      ],
                    ):SizedBox(),
                    usertype == 'General_User'?Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0.sp),
                          child: Image.asset(
                            "assets/profilepic.jpg",
                            height: 99.sp,
                            width: 99.sp,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 21.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "$g_name",
                                  style: GoogleFonts.mukta(
                                      color: Color(0xff1E1C1C),
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                SvgPicture.asset(
                                  "assets/Group 91.svg",
                                  height: 13.h,
                                  width: 15.w,
                                ),
                              ],
                            ),
                            Text(
                              "$g_email",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Cell: $user_id",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "United States",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const UserProfile()),
                                    );
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24.sp),
                                        color: Color(0xff0D8F29)),
                                    child: Center(
                                        child: Text(
                                          "Purchase",
                                          style: GoogleFonts.mukta(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 17.w,
                                ),
                                Container(
                                  height: 25.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.sp),
                                      color: Color(0xff081C3B)),
                                  child: Center(
                                      child: Text(
                                        "Purchase",
                                        style: GoogleFonts.mukta(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ):SizedBox(),
                    SizedBox(
                      height: 80.h,
                    ),
                    usertype == 'General_User' ? GestureDetector(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                        height: 194.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF0FDF6),
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
                        child: Column(
                          children: [
                            SizedBox(height: 12,),
                            SizedBox(
                              height: 149.h,
                              child: Container(
                                width: 200,
                                height: 180,
                                decoration: BoxDecoration(
                                 // color: Colors.grey[200],
                                  color: Color(0xffF0FDF6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ima != null ? Image.file(ima!) : Image.asset("assets/receiptLogo.JPG"), // Show the image if it exists
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "Tap to Scan a Receipt",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ) : Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            _settingModalBottomSheet(context);
                          },
                          child: Container(
                            height: 194.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                                color: Color(0xffF0FDF6),
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
                            child: Column(
                              children: [
                                SizedBox(height: 12,),
                                SizedBox(
                                  height: 149.h,
                                  child: Container(
                                    width: 200,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      //color: Colors.grey[200],
                                      color: Color(0xffF0FDF6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ima != null ? Image.file(ima!) : Image.asset("assets/receiptLogo.JPG"), // Show the image if it exists
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  "Tap to Scan a Receipt",
                                  style: GoogleFonts.mukta(
                                      color: Color(0xff1E1C1C),
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 10),
                    //store name
                    Visibility(
                      visible: showStoreTextField,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Store Name",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: TextField(

                                        decoration: InputDecoration(
                                          border: InputBorder.none,  // Remove the border around the TextField
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //total amount
                    Visibility(
                      visible: showTotalAmountTextField,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Total Amount",
                                  style: GoogleFonts.mukta(
                                    color: Color(0xff1E1C1C),
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1),
                              Container(
                                height: 45,
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: TextField(
                                            keyboardType:TextInputType.number,
                                            controller: totalAmountNameController,
                                            onChanged: addexpense.settotalamount,
                                            // controller: TextEditingController(text: addexpense.totalamount.value),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showTotalAmountTextField=false;
                                    showsubcatdropdown=true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 55,
                                height: 35.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if(addexpense.totalamount.value.isNotEmpty){
                                      setState(() {
                                        showTotalAmountTextField = false;
                                        showNoteTextField = true;
                                        showbackbuton = true;
                                      });
                                    }
                                    else{
                                      Get.snackbar(
                                        'Amount Empty',
                                        'Please enter amount to continue.',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // note
                    Visibility(
                      visible: showNoteTextField,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Note",
                                  style: GoogleFonts.mukta(
                                    color: Color(0xff1E1C1C),
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1),
                              Container(
                                height: 45,
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: TextField(
                                            onChanged: addexpense.setnote,
                                            controller: NoteController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showNoteTextField=false;
                                    showTotalAmountTextField=true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 55,
                                height: 35.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if(addexpense.note.value.isNotEmpty) {
                                      setState(() {
                                        showNoteTextField =
                                        false; // Hide the note text field
                                        showPurchasingDateTextField =
                                        true; // Show the purchasing date text field
                                      });
                                    }
                                    else {
                                      Get.snackbar(
                                        'Amount Empty',
                                        'Please enter amount to continue.',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // purchasingdate
                    Visibility(
                      visible: showPurchasingDateTextField,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Purchasing Date",
                                  style: GoogleFonts.mukta(
                                    color: Color(0xff1E1C1C),
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1),
                              Container(
                                height: 45,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: (){
                                            _selectDate(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(5.0),

                                            ),
                                            child:  Center(
                                              child: Text(
                                                "${selectedDate.toString().substring(0,10)}",
                                                style: GoogleFonts.mukta(
                                                  color: Color(0xff1E1C1C),
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showNoteTextField = true; // Show the note text field
                                    showPurchasingDateTextField = false; // Hide the purchasing date text field
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 55,
                                height: 35.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    print(":::: add expense loading");
                                    if(addexpense.loading.isTrue){
                                      Timer(Duration(seconds: 2), () {
                                        setState(() {
                                          addexpense.loading.value=false;
                                        });
                                        // Code to be executed after the delay
                                      });
                                    }
                                    else{
                                      // print(":::::::::::::::jjjj $selectedSubCatDropdownValue");
                                      for(int i=0;i<allcat.length;i++){
                                        print("LKLKLKLKLK  ${allcat[i].name}");
                                        if(allcat[i].name==selectedDropdownValue){
                                          print("MMMMMMMMMMMMMM ${allsubcat.length}");
                                          if("${allsubcat.length}"=="0"){
                                            // Get.snackbar(
                                            //   'Select Subcatagory',
                                            //   'Please select subcatagory',
                                            //   backgroundColor: Colors.red,
                                            //   colorText: Colors.white,
                                            // );
                                            print(":::ASD:::::asd:: ${allcat.length}");
                                            addexpense.addExpense(allcat[i].id,"", selectedDate.toString().substring(0, 10), ima!);
                                          }else {
                                            for (int j = 0; j < allsubcat.length; j++) {
                                              print("LKLKLKLKLK ${allsubcat[j].name} :: $selectedSubCatDropdownValue");
                                              // print("LKLKLKLKLK $selectedSubCatDropdownValue ::: ${allsubcat[j].name}");
                                              if (allsubcat[j].name == selectedSubCatDropdownValue) {
                                                print("LKLKLKLKLK ${allsubcat[j].name} :: ${allcat[i].name}");
                                                addexpense.addExpense(allcat[i].id, allsubcat[j].id, selectedDate.toString().substring(0, 10), ima!);
                                              }
                                              else {}
                                            }
                                          }
                                        }
                                        else{}
                                      }
                                    }
                                  },
                                  child: Text(
                                    addexpense.loading.isTrue?"Saving.." :"Next",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    //dropdown
                    Visibility(
                      visible: showDropdown,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 270.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton<String>(
                                  // value: selectedDropdownValue,
                                  // value: selectedDropdownValue!.isEmpty ? allcat.length==0 ? null: allcat.first.name:selectedDropdownValue,
                                  value: selectedDropdownValue!.isEmpty ? null : selectedDropdownValue,
                                  hint: Row(
                                    children: [
                                      Text(
                                        ' Select a Category',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedDropdownValue = newValue!;
                                    });
                                    print("kia howa tera wada $selectedDropdownValue  ${allcat.length}");
                                    for(int i=0; i<allcat.length; i++ ){
                                      if(allcat[i].name==selectedDropdownValue){
                                        getlistsubCatagory.getlistOfSubCat(allcat[i].id).then((value) {
                                          print("ufffffff uffffffff uffffff ${allcat[i].id}");
                                          fetchAllSubCat();
                                        });
                                      }else{}
                                    }
                                  },
                                  items:
                                  // <String>[
                                  //   'Business Insurance',
                                  //   'Entertainment',
                                  //   'Website and Software Development',
                                  //   'Vehicle Expense',
                                  //   'Office Supplies',
                                  //   'Advertising and Marketing',
                                  // ]
                                  cat_name.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround ,
                                        children: [
                                          SizedBox(width: 10.w,),
                                          Text(value),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    activepopup=true;
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomAnimatedBar1(),),);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp), // Use any desired radius value
                                      border: Border.all(
                                        color: Colors.blue, // Set the desired border color
                                        width: 3, // Set the desired border width
                                      ),
                                    ),
                                    child: Icon(Icons.add,color: Colors.blue,size: 20.sp,)),
                              ),
                            ],
                          ),



                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  print("::::::::: ${showDropdown}");
                                  if(allsubcat.isEmpty){
                                    SnackBar(content: Text('Yay! A SnackBar!'));
                                  }
                                  else{
                                    setState(() {
                                      showshopname = true;
                                      shownextbuton = true;
                                      showDropdown = false;
                                      showDropdown = false;
                                      print("::::::::: ${showDropdown}");
                                      //  showbackbuton = false;
                                      //  showsubcatdropdown=false;
                                      //  showStoreTextField = false; // Hide the store text field
                                      //  showTotalAmountTextField = false; // Show the total amount text field
                                      //  showbackbuton = false;
                                      //  shownextbuton = false;
                                      //  showbackbuton = false;
                                      // storefield = false;
                                      // showStoreTextField = false;
                                      // showTotalAmountTextField = false;
                                      // showNoteTextField = false;
                                      // showPurchasingDateTextField =false;
                                      // showsubcatdropdown=false;
                                      // showshopname=false;


                                      // showshopname = true; // Show the store text field
                                      // showDropdown = false; // Hide the category dropdown
                                      // showbackbuton = true; // Show the back button
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 55,
                                height: 35.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // if(subCats.isEmpty){
                                    //   Get.snackbar(
                                    //     'Loading Sub Catagory',
                                    //     'Please wait for Sub Catagory to load',
                                    //     backgroundColor: Colors.red,
                                    //     colorText: Colors.white,
                                    //   );
                                    // }else{
                                      setState(() {
                                        showStoreTextField = false; // Hide the store text field
                                        showDropdown = false; // Hide the category dropdown
                                        showsubcatdropdown=true;
                                        showbackbuton = true;
                                      });
                                    //}
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: showsubcatdropdown,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 280.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child:  DropdownButton<String>(
                              // value: selectedDropdownValue,

                              value:selectedSubCatDropdownValue!.isEmpty? allsubcat.length==0 ? null: allsubcat.first.name:selectedSubCatDropdownValue,

                              hint: Text(
                                'Select a Category',
                                textAlign: TextAlign.center,
                              ),

                              onChanged: (String? newValue) {

                                setState(() {
                                  selectedSubCatDropdownValue = newValue!;
                                });
                                print("::::::::thora sa $selectedSubCatDropdownValue");
                              },

                              items:
                              // <String>[
                              //   'Business Insurance',
                              //   'Entertainment',
                              //   'Website and Software Development',
                              //   'Vehicle Expense',
                              //   'Office Supplies',
                              //   'Advertising and Marketing',
                              // ]

                              subCats.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 17.w,),
                                      Text(value),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showStoreTextField = true; // Show the store text field
                                    showDropdown = true; // Hide the category dropdown
                                    showbackbuton = false;
                                    showsubcatdropdown=false;
                                    showStoreTextField = false; // Hide the store text field
                                    showTotalAmountTextField = false; // Show the total amount text field
                                    showbackbuton = false;// Show the back button
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                ),
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 55,
                                height: 35.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showsubcatdropdown=false;
                                      showStoreTextField = false; // Hide the store text field
                                      showDropdown = false; // Hide the category dropdown
                                      showTotalAmountTextField = true; // Show the total amount text field
                                      showbackbuton = true;
                                    });
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Visibility(
                      visible: showshopname,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Store Name",
                                  style: GoogleFonts.mukta(
                                    color: Color(0xff1E1C1C),
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1),
                              Container(
                                height: 45,
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: TextField(
                                            onChanged: addexpense.setshopname,
                                           // controller: TextEditingController(text: addexpense.shopname.value),
                                            controller: shopNameController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TextButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       showNoteTextField=false;
                              //       showTotalAmountTextField=true;
                              //     });
                              //   },
                              //   style: ButtonStyle(
                              //     backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              //   ),
                              //   child: Text(
                              //     "Back",
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              Spacer(),
                              Container(
                                width: 55,
                                height: 35,
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: nextButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    print(":::::::::::: ${addexpense.shopname.value}");

                                    allcat.first.name;

                                    if(addexpense.shopname.value.isEmpty){
                                      Get.snackbar(
                                        'Store Field Empty',
                                        'Please fill store name to continue.',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }else{
                                      if(selectedDropdownValue.isNotEmpty){
                                        getlistsubCatagory.getlistOfSubCat(selectedDropdownValue).then((value) {
                                          print("ufffffff uffffffff uffffff ${selectedDropdownValue}");
                                          fetchAllSubCat();
                                        });
                                      }
                                      else if(allcat.first.name.isNotEmpty){
                                        getlistsubCatagory.getlistOfSubCat(allcat.first.id).then((value) {
                                          print("ufffffff uffffffff uffffff ${allcat.first.id}");
                                          fetchAllSubCat();
                                        });
                                      }

                                      setState(() {
                                        showshopname=false;
                                        showDropdown = true;
                                        shownextbuton = true;
                                      });

                                    }
                                  },

                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Visibility(
                      visible: shownextbuton && showStoreTextField, // Update the visibility condition
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  showStoreTextField = false; // Hide the store text field
                                  showDropdown = true; // Show the category dropdown
                                  showbackbuton = false; // Hide the back button
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                              child: Text(
                                "Back",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Container(
                              width: 55,
                              height: 35.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                color: nextButtonColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showStoreTextField = false; // Hide the store text field
                                    showDropdown = false; // Hide the category dropdown
                                    showTotalAmountTextField = true; // Show the total amount text field
                                    showbackbuton = true;
                                  });
                                },
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
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
                      height: 220.h,)

                  ],
                ),
              ),
            )
          ),
        ));
  }

  XFile? _image;
  File? ima;
  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      var pickedImage = image;
      final pickedImageforshow = File(image.path);
      setState(() {
        _image = pickedImage;
        ima=pickedImageforshow ;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // File? _image;
  //
  // Future<void> _pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //
  //     final pickedImage = File(image.path);
  //     setState(() {
  //       _image = pickedImage;
  //     });
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 60,
          color: Colors.white,
          child: Row(
            children: [

              Expanded(
                child: GestureDetector(
                  onTap: () {

                    setState(() {
                      showshopname = true;
                      shownextbuton = true;
                    });

                    _pickImage(ImageSource.gallery);
                    // Navigator.pop(context); // Close the bottom sheet after selection

                  },
                  child: Container(
                    //color:Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.folder_copy_outlined),
                        SizedBox(height: 8),
                        Text(
                          "Device Storage",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showshopname = true;
                      shownextbuton = true;
                    });
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context); // Close the bottom sheet after selection
                  },
                  child: Container(
                    //color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(height: 8),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }

}




