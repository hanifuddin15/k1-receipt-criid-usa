import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/controller/forgetpasswordController/resetPasswordStepOne.dart';

class SecurityCodeNewPassword extends StatefulWidget {
  SecurityCodeNewPassword({required this.userID,Key? key}) : super(key: key);
  String userID;
  @override
  State<SecurityCodeNewPassword> createState() => _SecurityCodeNewPasswordState();
}

class _SecurityCodeNewPasswordState extends State<SecurityCodeNewPassword> {
  ResetPasswordStepOneController resetPasswordStepOneController =Get.find();


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: ScreenUtil().setWidth(150),
                    height: ScreenUtil().setHeight(150),
                  ),
                  SizedBox(height: 0),
                  Text(
                    'Reset Your Password',
                    style: GoogleFonts.mukta(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Security Code',
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            onChanged: resetPasswordStepOneController.setSecurityCode,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              //labelText: 'Enter Your Last Name',
                              hintText: 'Enter Security Code',
                              hintStyle: GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            onChanged: resetPasswordStepOneController.setNewPassword,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              //labelText: 'Enter Your Last Name',
                              hintText: 'Enter New Password',
                              hintStyle: GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                        child: MaterialButton(
                          color: Color(0xff000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {

                            resetPasswordStepOneController.resetPassword2(widget.userID);

                            // Submit button callback
                          },
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
