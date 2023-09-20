import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/controller/addemployeecontroller/AddEmployeeController.dart';


class AddEmployee extends GetView<AddEmployeeController> {

  final myVariable = "Company".obs;
  bool _isPasswordVisible = false;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: SingleChildScrollView(
                    child:
                    Container(
                      height: 25.h,
                      width: 426.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.sp),
                        color: Color(0xff3461a6),
                      ),
                      child: Center(
                        child: Text(
                          "Add Employee",
                          style: GoogleFonts.mukta(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'First Name',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 35,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onChanged: controller.setFirstName,
                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your First name',
                            prefixIcon:Icon(Icons.person_pin),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Name',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 35,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          onChanged: controller.setLastName,

                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Last Name',
                            prefixIcon: Icon(Icons.person_pin),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      height: 30,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          onChanged: controller.setEmail,
                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your Email Address',
                            prefixIcon: Icon(Icons.email,color: Color(0xff767676) ,),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      height: 35,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          onChanged: controller.setMobile,
                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your Phone Number',
                            prefixIcon: Icon(Icons.phone,color: Color(0xff767676) ,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'User Name',
                //       textAlign: TextAlign.left,
                //       style: GoogleFonts.mukta(
                //         textStyle: TextStyle(
                //           fontSize: 14,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 5),
                //     Container(
                //       height: 35,
                //       width: 450,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10),
                //         //border: Border.all(color: Colors.black),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 2,
                //             blurRadius: 3,
                //             offset: Offset(0, 3), // changes position of shadow
                //           ),
                //         ],
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 16),
                //         child: TextFormField(
                //           onChanged: controller.setUserId,
                //           style: GoogleFonts.mukta(
                //             textStyle: TextStyle(
                //               fontSize: 12,
                //               color: Colors.grey,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           decoration: InputDecoration(
                //             hintText: 'Enter your Username',
                //             prefixIcon: Icon(Icons.person_pin),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 35,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                         obscureText: !_isPasswordVisible,
                          onChanged: controller.setPassword,
                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock,color: Color(0xff767676) ,),
                            // suffixIcon: IconButton(
                            //   icon: Icon(
                            //     _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            //
                            //     color: Colors.black,
                            //   ),
                            //   onPressed: togglePasswordVisibility,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed:() {
                    print(":::::::::::::main kn hn ${myVariable.value}");
                    {controller.registerEmployee();}
                    // {controller.registerCompany();}
                    // {controller.registerGeneralUser();}
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.mukta(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Color(0xff255a98),
                    minimumSize: Size(ScreenUtil().setWidth(330), ScreenUtil().setHeight(38)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWithBorderCurve extends StatelessWidget {
  final String labelText;
  final bool isObscured;

  const TextFieldWithBorderCurve({
    Key? key,
    required this.labelText,
    this.isObscured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 426.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscured,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: InputBorder.none,
          labelText: labelText,
        ),
      ),
    );
  }

}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class AddEmployee extends StatefulWidget {
//   @override
//   State<AddEmployee> createState() => _AddEmployeeState();
// }
//
// class _AddEmployeeState extends State<AddEmployee> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => const PlanStatistics()),
//                     // );
//                   },
//                   child: SingleChildScrollView(
//                     child:
//                     Container(
//                       height: 25.h,
//                       width: 426.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0.sp),
//                         color: Color(0xff3461a6),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Add Employee",
//                           style: GoogleFonts.mukta(
//                             color: Colors.white,
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'First Name',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       height: 35,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Enter your First name',
//                             prefixIcon:Icon(Icons.person_pin),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Last Name',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       height: 35,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             labelText: 'Enter Your Last Name',
//                             prefixIcon: Icon(Icons.person_pin),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 SizedBox(height: 7),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Email Address',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Container(
//                       height: 30,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Email Address',
//                             prefixIcon: Icon(Icons.email,color: Color(0xff767676) ,),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(height: 7),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Mobile',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 7),
//                     Container(
//                       height: 35,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Phone Number',
//                             prefixIcon: Icon(Icons.phone,color: Color(0xff767676) ,),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 7),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'User Name',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       height: 35,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Username',
//                             prefixIcon: Icon(Icons.person_pin),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Password',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.mukta(
//                         textStyle: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       height: 35,
//                       width: 450,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         //border: Border.all(color: Colors.black),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 3,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: TextFormField(
//                           style: GoogleFonts.mukta(
//                             textStyle: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Password',
//                             prefixIcon: Icon(Icons.lock,color: Color(0xff767676) ,),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(height: 35),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Submit',
//                     style: GoogleFonts.mukta(
//                       textStyle: TextStyle(
//                         fontSize: 16,
//                         color:  Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     primary: Color(0xff255a98),
//                     minimumSize: Size(ScreenUtil().setWidth(330), ScreenUtil().setHeight(38)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TextFieldWithBorderCurve extends StatelessWidget {
//   final String labelText;
//   final bool isObscured;
//
//   const TextFieldWithBorderCurve({
//     Key? key,
//     required this.labelText,
//     this.isObscured = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40.0,
//       width: 426.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(
//           color: Colors.white,
//           width: 1.0,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: TextField(
//         obscureText: isObscured,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(10.0),
//           border: InputBorder.none,
//           labelText: labelText,
//         ),
//       ),
//     );
//   }
// }
//



