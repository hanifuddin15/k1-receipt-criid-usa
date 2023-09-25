import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/constants/global.dart';
//import 'package:k1recipt/controller/%20expenseAnalyticsController/detailExpenseAnalytics.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';

import '../../controller/expenseAnalyticsController/detailExpenseAnalytics.dart';

class ExpenseAnalytics extends StatefulWidget {
  const ExpenseAnalytics({Key? key}) : super(key: key);

  @override
  State<ExpenseAnalytics> createState() => _ExpenseAnalyticsState();
}

class _ExpenseAnalyticsState extends State<ExpenseAnalytics> {
  final BudgetController budgetController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {

      // Here you can write your code
      if(budgetController.budgetList.isNotEmpty){
        print("::::::: month ${'${DateTime.now().month}'}");
        userMonthlyExpenseController.getUserMonthlyExpenseData(d_id,budgetController.budgetList.first.catId.toString(), '${DateTime.now().month}').then((value) {
          setState(() {budgetController.selectedButtonIndex.value = 0;});
        });
        userMonthlyExpenseController.getUserOverallExpenseData(d_id,budgetController.budgetList.first.catId.toString(),);

      }else{
        Future.delayed(const Duration(milliseconds: 1000), () {

          // Here you can write your code
          if(budgetController.budgetList.isNotEmpty){
            userMonthlyExpenseController.getUserMonthlyExpenseData(d_id,budgetController.budgetList.first.catId.toString(),'${DateTime.now().month}').then((value) {
              setState(() {budgetController.selectedButtonIndex.value = 0;});
            });
            userMonthlyExpenseController.getUserOverallExpenseData(d_id,budgetController.budgetList.first.catId.toString(),);
          }else{}
          setState(() {
            // Here you can write your code for open new view
          });
        });
      }

      setState(() {
        // Here you can write your code for open new view
      });

    });


  }

  final UserMonthlyExpenseController userMonthlyExpenseController = Get.put(UserMonthlyExpenseController());
  late DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String date;
        date="${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
        setState(() {
          userMonthlyExpenseController.getUserMonthlyExpenseData(d_id,budgetController.budgetList.first.catId.toString(),'${selectedDate.month}');

          // editLeadController.dateOfBirthController=date;
          //print("::::::: ${editLeadController.dateOfBirthController.toString()}");
        });
      });
    }
  }



  // Future<void> _selectMonthAndYear(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //     initialDatePickerMode: DatePickerMode.year, // Set initial mode to year
  //     selectableDayPredicate: (DateTime date) {
  //       // Disable day selection by returning false for all days
  //       return false;
  //     },
  //   );
  //
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //       String monthAndYear = "${selectedDate.year}-${selectedDate.month}";
  //      // editLeadController.dateOfBirthController = monthAndYear; // Set the formatted month and year to the controller
  //       print("Selected Month and Year: ${monthAndYear}");
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 25,
          leading: SizedBox(),
          title: Text(
            'Expense Analytics',
            style: TextStyle(fontSize: 13),
          ),
          backgroundColor: Color(0xff3461a6),
        ),
        body: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    // color: Colors.red,
                    height: 475.h,
                    child: Obx(
                          () => budgetController.budgetList.isEmpty
                          ? budgetController.loader==true
                          ? Center(child: Text("No Catagory found"))
                          : Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: budgetController.budgetList.length,
                              itemBuilder: (context, i) {
                                final budget = budgetController.budgetList[i];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8.0,top: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {budgetController.selectedButtonIndex.value = i;});
                                      print("::L:L:L:L:L: ${budgetController.selectedButtonIndex.value}");
                                      userMonthlyExpenseController.getUserMonthlyExpenseData(d_id,budget.catId.toString(),'${DateTime.now().month}');
                                      userMonthlyExpenseController.getUserOverallExpenseData(d_id,budget.catId.toString(),);

                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(118.w, 45.h),
                                      primary: budgetController.selectedButtonIndex.value == i
                                          ? Color(0xff3f51b5) // Set selected color
                                          : Color(0xffe7ffff), // Set custom width and height
                                    ),
                                    child: Text("${budget.catName}",
                                      style: TextStyle(fontSize: 12.sp,
                                          color:budgetController.selectedButtonIndex.value == i?Colors.white: Colors.black),),
                                  ),
                                );
                              }),
                    ),
                  ),
                ],
              ),
            ),

            //Obx(() => Text("${budgetController.selectedButtonIndex.value}")),


            Expanded(
              flex: 2,
              child: Obx(() {
                  if (userMonthlyExpenseController.isLoading.value && userMonthlyExpenseController.isLoading1.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (userMonthlyExpenseController.errorMsg.isNotEmpty || userMonthlyExpenseController.errorMsg1.isNotEmpty) {
                    return  userMonthlyExpenseController.errorMsg.isNotEmpty? Center(child: Text(userMonthlyExpenseController.errorMsg.value)):Center(child: Text(userMonthlyExpenseController.errorMsg1.value));
                  }
                  else {
                    // Data is loaded successfully, you can display the list using ListView.builder
                    // return ListView.builder(
                    //   itemCount: userMonthlyExpenseController.userMonthlyExpenseList.length,
                    //   itemBuilder: (context, index) {

                    if(userMonthlyExpenseController.userMonthlyExpenseList.isEmpty){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Container(
                          width: 253,
                          height: 640.sp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack( // Use a Stack to place the fixed text inside the container
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 10 ),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Color(0xff4051B4),
                                    child: Center(
                                      child: Text(
                                        'Overall',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Total Budget',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1, // Set the width of the divider
                                          height: 24.h, // Set the height to match the row height
                                          color: Colors.black, // Set the color of the divider
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 79),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),
                              ),//line
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 90.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Entertainment',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 48),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 121),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),
                              ),//line
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 130.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Text(
                                            'Expanded',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 158),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ),//line
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 170.0, left: 10),
                                  child: Container(
                                    width: 202.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Text(
                                            'Remaining',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$0',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Monthly
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top:210.0,left: 10 ),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Color(0xff4051B4),
                                    child: Center(
                                      child: Text(
                                        'Monthly',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 250.0, left: 10),
                                child: Container(
                                  width: 200.w,
                                  height: 24.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 60),
                                        child: Text(
                                          'Filter',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 1, // Set the width of the divider
                                        height: 24.h, // Set the height to match the row height
                                        color: Colors.black, // Set the color of the divider
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 40),
                                        child: Text(
                                          '\$0',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 275),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ),   //line

                              Padding(
                                padding: const EdgeInsets.only(top: 288.0, left: 10),
                                child: Container(
                                  width: 214.w,
                                  height: 24.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Budget Expense',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 24.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 58),
                                        child: Text(
                                          '\$0',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 318),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ), //line

                              Padding(
                                padding: const EdgeInsets.only(top: 328.0, left: 10),
                                child: Container(
                                  width: 205.w,
                                  height: 24.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 50),
                                        child: Text(
                                          'Expense',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 24.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 40),
                                        child: Text(
                                          '\$0',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 358),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ), //line

                              Padding(
                                padding: const EdgeInsets.only(top: 370.0, left: 10),
                                child: Container(
                                  width: 200.w,
                                  height: 24.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40),
                                        child: Text(
                                          'Remains',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 24.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 40),
                                        child: Text(
                                          '\$0',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 400),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ), //line

                              Padding(
                                padding: const EdgeInsets.only(top: 410.0, left: 10),
                                child: Container(
                                  width: 200.w,
                                  height: 24.h,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Expense Till',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 24.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 40),
                                        child: Text(
                                          '\$0',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 440),
                                child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                              ), //line

                            ],
                          ),
                        ),
                      );
                    }
                    else{

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Container(
                            width: 253,
                            height: 640.sp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack( // Use a Stack to place the fixed text inside the container
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0,left: 10 ),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Color(0xff4051B4),
                                    child: Center(
                                      child: Text(
                                        'Overall',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Total Budget',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1, // Set the width of the divider
                                          height: 24.h, // Set the height to match the row height
                                          color: Colors.black, // Set the color of the divider
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userOverallExpenseList.isEmpty?0:userMonthlyExpenseController.userOverallExpenseList.first.overallTotalBudget}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 79),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),//line
                                Padding(
                                  padding: const EdgeInsets.only(top: 90.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Container(
                                            width: 50.w,
                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 48),
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 121),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),//line
                                Padding(
                                  padding: const EdgeInsets.only(top: 130.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Text(
                                            'Expanded',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userOverallExpenseList.isEmpty?0:userMonthlyExpenseController.userOverallExpenseList.first.expenseAmount}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 158),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),//line
                                Padding(
                                  padding: const EdgeInsets.only(top: 170.0, left: 10),
                                  child: Container(
                                    width: 202.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Text(
                                            'Remaining',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userOverallExpenseList.isEmpty?0:userMonthlyExpenseController.userOverallExpenseList.first.overallRemainingAmount}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Monthly
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:210.0,left: 10 ),
                                    child: Container(
                                      width: 200.w,
                                      height: 24.h,
                                      color: Color(0xff4051B4),
                                      child: Center(
                                        child: Text(
                                          'Monthly',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 250.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 60),
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1, // Set the width of the divider
                                          height: 24.h, // Set the height to match the row height
                                          color: Colors.black, // Set the color of the divider
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 275),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ),   //line

                                Padding(
                                  padding: const EdgeInsets.only(top: 288.0, left: 10),
                                  child: Container(
                                    width: 214.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:5),
                                          child: Text(
                                            'Budget Expense',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 58),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userMonthlyExpenseList.isEmpty?0:userMonthlyExpenseController.userMonthlyExpenseList.first.totalBudget}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 318),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ), //line

                                Padding(
                                  padding: const EdgeInsets.only(top: 328.0, left: 10),
                                  child: Container(
                                    width: 205.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 45),
                                          child: Text(
                                            'Expense',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userMonthlyExpenseList.isEmpty?0:userMonthlyExpenseController.userMonthlyExpenseList.first.expenseAmountPerMonth}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 358),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ), //line

                                Padding(
                                  padding: const EdgeInsets.only(top: 370.0, left: 10),
                                  child: Container(
                                    width: 200.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 50),
                                          child: Text(
                                            'Remains',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Text(
                                            '\$${userMonthlyExpenseController.userMonthlyExpenseList.isEmpty?0:userMonthlyExpenseController.userMonthlyExpenseList.first.remainingAmountPerMonth}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 400),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ), //line

                                Padding(
                                  padding: const EdgeInsets.only(top: 410.0, left: 10),
                                  child: Container(
                                    width: 210.w,
                                    height: 24.h,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Text(
                                            'Expense Till',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 24.h,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                            //color: Colors.blueAccent,
                                            width: 70.w,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                '\$${userMonthlyExpenseController.userMonthlyExpenseList.isEmpty?0:userMonthlyExpenseController.userMonthlyExpenseList.first.budgetAmountPerMonth}',
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 440),
                                  child: Divider(height: 10,thickness: 1,indent: 4,endIndent: 4,color: Colors.grey,),
                                ), //line

                              ],
                            ),
                          ),
                        );
                    }

                    //   },
                    // );
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

}

