import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:k1recipt/View/Sign%20Up/SignUp.dart';
import 'package:k1recipt/controller/promocodeController/promocodeController.dart';

class PromocodePage extends GetView<PromoCodeController>{


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
                    width: ScreenUtil().setWidth(250),
                    height: ScreenUtil().setHeight(200),
                  ),
                  SizedBox(height: 0),
                  Text(
                    'Enter Your Promo Code',
                    style: GoogleFonts.mukta(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Add spacing before the boxes
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 38),
                        Container(
                          width: 47,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          // Replace the Text widget with a TextField widget
                          child: TextField(
                            onChanged: controller.setpromo1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1), // Restrict input to a single character
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0', // Default value for the text field
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 47,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          // Replace the Text widget with a TextField widget
                          child: TextField(
                            onChanged: controller.setpromo2,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1), // Restrict input to a single character
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0', // Default value for the text field
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 47,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          // Replace the Text widget with a TextField widget
                          child: TextField(
                            onChanged: controller.setpromo3,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1), // Restrict input to a single character
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0', // Default value for the text field
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 47,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          // Replace the Text widget with a TextField widget
                          child: TextField(
                            onChanged: controller.setpromo4,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1), // Restrict input to a single character
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0', // Default value for the text field
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 47,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          // Replace the Text widget with a TextField widget
                          child: TextField(
                            onChanged: controller.setpromo5,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1), // Restrict input to a single character
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0', // Default value for the text field
                            ),
                          ),
                        ),
                        SizedBox(width: 38),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: controller.promoCodeCheck,
                    child: Text(
                      'Next',
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Color(0xff081C3C),
                      minimumSize: Size(ScreenUtil().setWidth(101), ScreenUtil().setHeight(36)),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignUp()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have a promocode? ",
                        style: GoogleFonts.mukta(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff81061c),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBox(var a ) {
    return Container(
      width: 47,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
      // Replace the Text widget with a TextField widget
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // Restrict input to a single character
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '0', // Default value for the text field
        ),
      ),
    );
  }

}