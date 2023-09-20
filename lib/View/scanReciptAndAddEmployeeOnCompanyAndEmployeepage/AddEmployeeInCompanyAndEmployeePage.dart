import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/constants/global.dart';

import '../Add Employee/Addemployee.dart';
import '../Employee List/EmployeeList.dart';

class ScanReciptWithEmployeeInCompnayAndEmployeePage extends StatefulWidget {
  const ScanReciptWithEmployeeInCompnayAndEmployeePage({Key? key}) : super(key: key);

  @override
  State<ScanReciptWithEmployeeInCompnayAndEmployeePage> createState() => _ScanReciptWithEmployeeInCompnayAndEmployeePageState();
}

class _ScanReciptWithEmployeeInCompnayAndEmployeePageState extends State<ScanReciptWithEmployeeInCompnayAndEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'K-1 Receipts',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              usertype =='Employee'?SizedBox():SizedBox(
                child:
                PopupMenuButton<String>(
                  onSelected: (value) {
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
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'Add Employee',
                      child: Text('Add Employee'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Employee List',
                      child: Text('Employee List'),
                    ),
                  ],
                  child: Container(
                    width: 130,
                    margin: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff4a7cc8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   backgroundImage: AssetImage('assets/1.png'),
                        //   radius: 10,
                        // ),
                        SizedBox(width: 3),
                        Text(
                          'Kaambai.com',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ),
              usertype =='Employee'?SizedBox():IconButton(
                icon: Icon(Icons.more_vert,color: Colors.black,),
                onPressed: () {},
              ),
            ],
          ),

          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 204.h,
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
              ],
            ),
          ),
        ));
  }
}