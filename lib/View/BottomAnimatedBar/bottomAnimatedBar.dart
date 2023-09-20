import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Analytics/Analytics.dart';
import 'package:k1recipt/View/Budget%20Details/Budgetdetails.dart';
import 'package:k1recipt/View/Expense%20List/ExpenseList.dart';
import 'package:k1recipt/View/GeneralUserExpenseList/generalUserExpenseList.dart';
import 'package:k1recipt/View/expenseDetails/expenseDetails.dart';
import 'package:k1recipt/View/planStatistics/planStatistics.dart';
import 'package:k1recipt/View/scanReciptAndAddEmployeeOnCompanyAndEmployeepage/AddEmployeeInCompanyAndEmployeePage.dart';
import 'package:k1recipt/controller/UserInfoController/edituserInfoController.dart';
import 'package:k1recipt/controller/UserInfoController/userInfoController.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addCatagory/editCatagoryWithBudget.dart';
import 'package:k1recipt/controller/expenseController/expenseEditController.dart';

import '../../constants/global.dart';
import '../../controller/addCatagory/deleteCatWithBugetController.dart';
import '../Add Employee/Addemployee.dart';
import '../Scan Recipt/ScanRecipt.dart';

class MyTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

class BottomAnimatedBar extends StatefulWidget {
  const BottomAnimatedBar({Key? key}) : super(key: key);

  @override
  State<BottomAnimatedBar> createState() => _BottomAnimatedBarState();
}

class _BottomAnimatedBarState extends State<BottomAnimatedBar> {
  // /// Controller to handle PageView and also handles initial page
  // final _pageController = PageController(initialPage: 0);
  //
  // /// Controller to handle bottom nav bar and also handles initial page
  // final _controller = NotchBottomBarController(index: 0);
  //
  // int maxCount = 5;
  //
  // // @override
  // // void dispose() {
  // //   _pageController.dispose();
  // //   super.dispose();
  // // }
  //
  // /// widget list
  // final List<Widget> bottomBarPages = [
  //   const Page1(),
  //   const Page2(),
  //   const Page3(),
  //   const Page4(),
  //   const Page5(),
  // ];
////////////////////////////////////animated_bottom_navigation_bar 0.2.1//////////////////////////////////////////

  // final BudgetController budgetController = Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(DeleteCatWithBudgetController());
    Get.put(EditExpenseController());
    Get.put(UserInfoProfileController());
    Get.put(EditUserInfoController());
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: MyTickerProvider(),
      //vsync: this,
    );
    Get.put(AddCatagoryController());
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(Duration(seconds: 1), () => _animationController.forward(),);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> iconList = [
    'assets/image 5.png',
    'assets/image 6.png',
    'assets/image 7.png',
    'assets/image 8.png',
  ];


  // final iconList = <IconData>[
  //   Icons.calculate_rounded,
  //   Icons.data_exploration,
  //   Icons.analytics_sharp,
  //   Icons.person,
  // ];

  List<String> heading=['Budget','Expense','Analytics','Profile'];

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 2; //default index of first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // body: NavigationScreen(
       //   iconList[_bottomNavIndex],
       // ), //destination screen
      body:_bottomNavIndex==0 ? Budgetdetails():
      _bottomNavIndex==1 ? GeneralUserExpenseList():
      _bottomNavIndex==2 ? Analytics() :
      _bottomNavIndex==3 ? ScanRecipt():
      ScanRecipt(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          usertype== 'General_User' ?
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics())):
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        child: Image.asset('assets/image 9.png',),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xff3461A6) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   iconList[index],
              //   size: 24,
              //   color: color,
              // ),
              Image.asset('${iconList[index]}'),
              const SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  "${heading[index]}",
                  maxLines: 1,
                  style:GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 12.0.sp,fontWeight:FontWeight.w500),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        // splashColor: HexColor('#FFA400'),
        notchAndCornersAnimation: animation,
        // splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );

    // return Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //         bottomBarPages.length, (index) => bottomBarPages[index]),
    //   ),
    //   extendBody: true,
    //   bottomNavigationBar: (bottomBarPages.length <= maxCount)
    //       ? AnimatedNotchBottomBar(
    //     /// Provide NotchBottomBarController
    //     notchBottomBarController: _controller,
    //     color: Colors.white,
    //     showLabel: true,
    //     notchColor: Colors.red,
    //
    //     /// restart app if you change removeMargins
    //     removeMargins: false,
    //     bottomBarWidth:600,
    //     durationInMilliSeconds: 200,
    //     bottomBarItems: [
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 1',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.star,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.star,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 2',
    //       ),
    //
    //       ///svg example
    //       BottomBarItem(
    //         inActiveItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.white,
    //         ),
    //         itemLabel: 'Page 3',
    //       ),
    //
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.settings,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.settings,
    //           color: Colors.pink,
    //         ),
    //         itemLabel: 'Page 4',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.person,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.person,
    //           color: Colors.yellow,
    //         ),
    //         itemLabel: 'Page 5',
    //       ),
    //     ],
    //     onTap: (index) {
    //       /// perform action on tab change and to update pages you can update pages without pages
    //       log('current selected index $index');
    //       _pageController.jumpToPage(index);
    //     },
    //   )
    //       : null,
    // );
  }
}

class BottomAnimatedBar1 extends StatefulWidget {
  BottomAnimatedBar1({Key? key}) : super(key: key);
  // BottomAnimatedBar1({required this.popup_open,Key? key}) : super(key: key);
  //bool popup_open;
  @override
  State<BottomAnimatedBar1> createState() => _BottomAnimatedBar1State();
}

class _BottomAnimatedBar1State extends State<BottomAnimatedBar1> {
  // /// Controller to handle PageView and also handles initial page
  // final _pageController = PageController(initialPage: 0);
  //
  // /// Controller to handle bottom nav bar and also handles initial page
  // final _controller = NotchBottomBarController(index: 0);
  //
  // int maxCount = 5;
  //
  // // @override
  // // void dispose() {
  // //   _pageController.dispose();
  // //   super.dispose();
  // // }
  //
  // /// widget list
  // final List<Widget> bottomBarPages = [
  //   const Page1(),
  //   const Page2(),
  //   const Page3(),
  //   const Page4(),
  //   const Page5(),
  // ];
////////////////////////////////////animated_bottom_navigation_bar 0.2.1//////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: MyTickerProvider(),
      //vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> iconList = [
    'assets/image 5.png',
    'assets/image 6.png',
    'assets/image 7.png',
    'assets/image 8.png',
  ];


  // final iconList = <IconData>[
  //   Icons.calculate_rounded,
  //   Icons.data_exploration,
  //   Icons.analytics_sharp,
  //   Icons.person,
  // ];

  List<String> heading=['Budget','Expense','Analytics','Profile'];

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: NavigationScreen(
      //   iconList[_bottomNavIndex],
      // ), //destination screen
      body:_bottomNavIndex==0 ? Budgetdetails():
      _bottomNavIndex==1 ? GeneralUserExpenseList():
      _bottomNavIndex==2 ? Analytics() :
      _bottomNavIndex==3 ? ScanRecipt():
      ScanRecipt(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          usertype== 'General_User' ?
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics())):
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        child: Image.asset('assets/image 9.png',),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xff3461A6) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   iconList[index],
              //   size: 24,
              //   color: color,
              // ),
              Image.asset('${iconList[index]}'),
              const SizedBox(height: 4),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  "${heading[index]}",
                  maxLines: 1,
                  style:GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 12.0.sp,fontWeight:FontWeight.w500  ),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        //splashColor: HexColor('#FFA400'),
        notchAndCornersAnimation: animation,
        //splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
    // return Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //         bottomBarPages.length, (index) => bottomBarPages[index]),
    //   ),
    //   extendBody: true,
    //   bottomNavigationBar: (bottomBarPages.length <= maxCount)
    //       ? AnimatedNotchBottomBar(
    //     /// Provide NotchBottomBarController
    //     notchBottomBarController: _controller,
    //     color: Colors.white,
    //     showLabel: true,
    //     notchColor: Colors.red,
    //
    //     /// restart app if you change removeMargins
    //     removeMargins: false,
    //     bottomBarWidth:600,
    //     durationInMilliSeconds: 200,
    //     bottomBarItems: [
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 1',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.star,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.star,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 2',
    //       ),
    //
    //       ///svg example
    //       BottomBarItem(
    //         inActiveItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.white,
    //         ),
    //         itemLabel: 'Page 3',
    //       ),
    //
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.settings,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.settings,
    //           color: Colors.pink,
    //         ),
    //         itemLabel: 'Page 4',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.person,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.person,
    //           color: Colors.yellow,
    //         ),
    //         itemLabel: 'Page 5',
    //       ),
    //     ],
    //     onTap: (index) {
    //       /// perform action on tab change and to update pages you can update pages without pages
    //       log('current selected index $index');
    //       _pageController.jumpToPage(index);
    //     },
    //   )
    //       : null,
    // );
  }
}

class BottomAnimatedBar2 extends StatefulWidget {
  const BottomAnimatedBar2({Key? key}) : super(key: key);

  @override
  State<BottomAnimatedBar2> createState() => _BottomAnimatedBar2State();
}

class _BottomAnimatedBar2State extends State<BottomAnimatedBar2> {
  // /// Controller to handle PageView and also handles initial page
  // final _pageController = PageController(initialPage: 0);
  //
  // /// Controller to handle bottom nav bar and also handles initial page
  // final _controller = NotchBottomBarController(index: 0);
  //
  // int maxCount = 5;
  //
  // // @override
  // // void dispose() {
  // //   _pageController.dispose();
  // //   super.dispose();
  // // }
  //
  // /// widget list
  // final List<Widget> bottomBarPages = [
  //   const Page1(),
  //   const Page2(),
  //   const Page3(),
  //   const Page4(),
  //   const Page5(),
  // ];
////////////////////////////////////animated_bottom_navigation_bar 0.2.1//////////////////////////////////////////

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: MyTickerProvider(),
      //vsync: this,
    );

    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> iconList = [
    'assets/image 5.png',
    'assets/image 6.png',
    'assets/image 7.png',
    'assets/image 8.png',
  ];


  // final iconList = <IconData>[
  //   Icons.calculate_rounded,
  //   Icons.data_exploration,
  //   Icons.analytics_sharp,
  //   Icons.person,
  // ];

  List<String> heading=['Budget','Expense','Analytics','Profile'];

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 1; //default index of first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: NavigationScreen(
      //   iconList[_bottomNavIndex],
      // ), //destination screen

      body:_bottomNavIndex==0 ? Budgetdetails():
      _bottomNavIndex==1 ? GeneralUserExpenseList():
      _bottomNavIndex==2 ? Analytics() :
      _bottomNavIndex==3 ? ScanRecipt():
      ScanRecipt(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          usertype== 'General_User' ?
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics())):
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        child: Image.asset('assets/image 9.png',),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xff3461A6) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   iconList[index],
              //   size: 24,
              //   color: color,
              // ),
              Image.asset('${iconList[index]}'),
              const SizedBox(height: 4),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  "${heading[index]}",
                  maxLines: 1,
                  style:GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 12.0.sp,fontWeight:FontWeight.w500  ),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        //splashColor: HexColor('#FFA400'),
        notchAndCornersAnimation: animation,
        //splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );

    // return Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //         bottomBarPages.length, (index) => bottomBarPages[index]),
    //   ),
    //   extendBody: true,
    //   bottomNavigationBar: (bottomBarPages.length <= maxCount)
    //       ? AnimatedNotchBottomBar(
    //     /// Provide NotchBottomBarController
    //     notchBottomBarController: _controller,
    //     color: Colors.white,
    //     showLabel: true,
    //     notchColor: Colors.red,
    //
    //     /// restart app if you change removeMargins
    //     removeMargins: false,
    //     bottomBarWidth:600,
    //     durationInMilliSeconds: 200,
    //     bottomBarItems: [
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 1',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.star,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.star,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 2',
    //       ),
    //
    //       ///svg example
    //       BottomBarItem(
    //         inActiveItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.white,
    //         ),
    //         itemLabel: 'Page 3',
    //       ),
    //
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.settings,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.settings,
    //           color: Colors.pink,
    //         ),
    //         itemLabel: 'Page 4',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.person,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.person,
    //           color: Colors.yellow,
    //         ),
    //         itemLabel: 'Page 5',
    //       ),
    //     ],
    //     onTap: (index) {
    //       /// perform action on tab change and to update pages you can update pages without pages
    //       log('current selected index $index');
    //       _pageController.jumpToPage(index);
    //     },
    //   )
    //       : null,
    // );
  }
}

class BottomAnimatedBar3 extends StatefulWidget {
  const BottomAnimatedBar3({Key? key}) : super(key: key);

  @override
  State<BottomAnimatedBar3> createState() => _BottomAnimatedBar3State();
}

class _BottomAnimatedBar3State extends State<BottomAnimatedBar3> {
  // /// Controller to handle PageView and also handles initial page
  // final _pageController = PageController(initialPage: 0);
  //
  // /// Controller to handle bottom nav bar and also handles initial page
  // final _controller = NotchBottomBarController(index: 0);
  //
  // int maxCount = 5;
  //
  // // @override
  // // void dispose() {
  // //   _pageController.dispose();
  // //   super.dispose();
  // // }
  //
  // /// widget list
  // final List<Widget> bottomBarPages = [
  //   const Page1(),
  //   const Page2(),
  //   const Page3(),
  //   const Page4(),
  //   const Page5(),
  // ];
////////////////////////////////////animated_bottom_navigation_bar 0.2.1//////////////////////////////////////////

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: MyTickerProvider(),
      //vsync: this,
    );

    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<String> iconList = [
    'assets/image 5.png',
    'assets/image 6.png',
    'assets/image 7.png',
    'assets/image 8.png',
  ];


  // final iconList = <IconData>[
  //   Icons.calculate_rounded,
  //   Icons.data_exploration,
  //   Icons.analytics_sharp,
  //   Icons.person,
  // ];

  List<String> heading=['Budget','Expense','Analytics','Profile'];

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 1; //default index of first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: NavigationScreen(
      //   iconList[_bottomNavIndex],
      // ), //destination screen
      body:_bottomNavIndex==0 ? Budgetdetails():
      _bottomNavIndex==1 ? GeneralUserExpenseList():
      _bottomNavIndex==2 ? Analytics() :
      _bottomNavIndex==3 ? ScanRecipt():
      ScanRecipt(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          usertype== 'General_User' ?
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics())):
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralPlanStatistics()));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        child: Image.asset('assets/image 9.png',),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xff3461A6) : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   iconList[index],
              //   size: 24,
              //   color: color,
              // ),
              Image.asset('${iconList[index]}'),
              const SizedBox(height: 4),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  "${heading[index]}",
                  maxLines: 1,
                  style:GoogleFonts.mukta(color: Color(0xff1E1C1C),fontSize: 12.0.sp,fontWeight:FontWeight.w500  ),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        //splashColor: HexColor('#FFA400'),
        notchAndCornersAnimation: animation,
        //splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );

    // return Scaffold(
    //   body: PageView(
    //     controller: _pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //         bottomBarPages.length, (index) => bottomBarPages[index]),
    //   ),
    //   extendBody: true,
    //   bottomNavigationBar: (bottomBarPages.length <= maxCount)
    //       ? AnimatedNotchBottomBar(
    //     /// Provide NotchBottomBarController
    //     notchBottomBarController: _controller,
    //     color: Colors.white,
    //     showLabel: true,
    //     notchColor: Colors.red,
    //
    //     /// restart app if you change removeMargins
    //     removeMargins: false,
    //     bottomBarWidth:600,
    //     durationInMilliSeconds: 200,
    //     bottomBarItems: [
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.home_filled,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 1',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.star,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.star,
    //           color: Colors.blueAccent,
    //         ),
    //         itemLabel: 'Page 2',
    //       ),
    //
    //       ///svg example
    //       BottomBarItem(
    //         inActiveItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: SvgPicture.asset(
    //           'assets/Group 71.svg',
    //           color: Colors.white,
    //         ),
    //         itemLabel: 'Page 3',
    //       ),
    //
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.settings,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.settings,
    //           color: Colors.pink,
    //         ),
    //         itemLabel: 'Page 4',
    //       ),
    //       const BottomBarItem(
    //         inActiveItem: Icon(
    //           Icons.person,
    //           color: Colors.blueGrey,
    //         ),
    //         activeItem: Icon(
    //           Icons.person,
    //           color: Colors.yellow,
    //         ),
    //         itemLabel: 'Page 5',
    //       ),
    //     ],
    //     onTap: (index) {
    //       /// perform action on tab change and to update pages you can update pages without pages
    //       log('current selected index $index');
    //       _pageController.jumpToPage(index);
    //     },
    //   )
    //       : null,
    // );
  }
}


class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}