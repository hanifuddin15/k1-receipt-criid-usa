import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2),
              Container(
                alignment: Alignment.topLeft,
                height: 37.h,
                width: 436.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.sp),
                  color: Color(0xffffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Expense List",
                    style: GoogleFonts.mukta(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left, // Align the text to the left
                  ),
                ),
              ),
              SizedBox(
                height: 220.h,
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Container(
                    height: 324.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.sp,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget Category',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 40),
                                Text(
                                  'Entertainment',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 97),
                                Text(
                                  '3000',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Expense',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 90),
                                Text(
                                  '-161.10',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey,height: 10,indent: 10,endIndent: 10,),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Remaining Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25,),
                                Text(
                                  '2838.90',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 10,
                                width: 500, // Adjust the width as needed
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: 0.1, // Adjust the value as needed
                                    backgroundColor: Colors.green,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
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
              ),
              SizedBox(height: 2),
              SizedBox(
                height: 220.h,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 324.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.sp,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child:
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget Category',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 40,),
                                Text(
                                  'Entertainment',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 97,),
                                Text(
                                  '3000',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start  ,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Expense',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 90,),
                                Text(
                                  '-161.10',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey,height: 10,indent: 10,endIndent: 10,),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Remaining Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25,),
                                Text(
                                  '2838.90',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 10,
                                width: 500, // Adjust the width as needed
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: 0.1, // Adjust the value as needed
                                    backgroundColor: Colors.green,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
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
              ),
              SizedBox(height: 2),
              SizedBox(
                height: 220.h,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                  Container(
                    height: 324.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.sp,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child:
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget Category',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 40,),
                                Text(
                                  'Entertainment',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 97,),
                                Text(
                                  '3000',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start  ,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Expense',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 90,),
                                Text(
                                  '-161.10',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold
                                      ,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey,height: 10,indent: 10,endIndent: 10,),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Remaining Budget',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 25,),
                                Text(
                                  '2838.90',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 10,
                                width: 500, // Adjust the width as needed
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: 0.1, // Adjust the value as needed
                                    backgroundColor: Colors.green,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
