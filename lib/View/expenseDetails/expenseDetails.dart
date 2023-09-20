import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseDetails extends StatelessWidget {
  const ExpenseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                color: Color(0xff3461A6),
                height: 30.h,
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    Text("Nabila’s Expense Details",
                      style: GoogleFonts.mukta(
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  width: MediaQuery.of(context).size.width, // Customize the width of the box
                  height: 500.sp, // Customize the height of the box
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Customize the color of the border
                      width: 0.8, // Customize the width of the border
                    ),
                    borderRadius: BorderRadius.circular(10), // Customize the border radius
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: 8.sp,top: 8.sp),
                            child: Container(
                              width: 70.sp, // Customize the width of the box
                              height: 26.sp, // Customize the height of the box
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Customize the color of the border
                                  width: 0.8, // Customize the width of the border
                                ),
                                borderRadius: BorderRadius.circular(5.sp), // Customize the border radius
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text("Expense",
                                      style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color:  Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.sp,),
                                      child: Icon(Icons.arrow_drop_down_sharp,size: 14.sp,color: Colors.grey,),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(right: 8.sp,top: 8.sp),
                            child: Container(
                              width: 70.sp, // Customize the width of the box
                              height: 26.sp, // Customize the height of the box
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Customize the color of the border
                                  width: 0.8, // Customize the width of the border
                                ),
                                borderRadius: BorderRadius.circular(5.sp), // Customize the border radius
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text("Export",
                                      style: GoogleFonts.mukta(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color:  Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.sp,),
                                      child: Icon(Icons.arrow_drop_down_sharp,size: 14.sp,color: Colors.grey,),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Container(
                        height: 29.sp,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffd7d7d7),
                        child: Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Text("Category",style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                fontSize: 14,
                                color:  Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),),
                            Spacer(),
                            Text("Total Expense",style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color:  Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),),
                            Spacer(),
                            Text("Receipt",style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color:  Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),),
                            SizedBox(width: 15.w,),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        height: 370.h,
                        child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, i) {
                            return ExpenseLIst();
                          },
                        ),
                      )
                      //ExpenseLIst(),
                    ],
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

class ExpenseLIst extends StatelessWidget {
  const ExpenseLIst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.0.sp,right: 8.sp,bottom: 10.h),
      child: Container(
        height: 29.sp,
        width: MediaQuery.of(context).size.width,

        decoration: BoxDecoration(
          color: Colors.white, // Customize the background color of the container
          borderRadius: BorderRadius.circular(10), // Customize the border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Customize the shadow color
              spreadRadius: 2, // Customize the spread radius of the shadow
              blurRadius: 5, // Customize the blur radius of the shadow
              offset: Offset(0, 3), // Customize the offset of the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 7.w,),
            Container(
              //color: Colors.red,
              width: 130.w,

              child: Text("Business Insuarnce ",style: GoogleFonts.mukta(
                textStyle: TextStyle(
                  fontSize: 13.sp,
                  color:  Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),),
            ),

            Text("""\$200.00""",style: GoogleFonts.mukta(
              textStyle: TextStyle(
                fontSize: 13.sp,
                color:  Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),),
            Spacer(),
            Text("Receipt",style: GoogleFonts.mukta(
              textStyle: TextStyle(
                fontSize: 13.sp,
                color:  Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),),
            SizedBox(width: 7.w,),
          ],
        ),
      ),
    );
  }
}
