import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboardpage extends StatefulWidget {
  const Onboardpage({Key? key}) : super(key: key);

  @override
  State<Onboardpage> createState() => _OnboardpageState();
}

class _OnboardpageState extends State<Onboardpage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logos/k1logo.png',
                  width: ScreenUtil().setWidth(250),
                  height: ScreenUtil().setHeight(200),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text(
                  'K-1',
                  style: GoogleFonts.acme(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(50)),
                  child: Text(
                    'K-1 app for small business owners to keep everything organized',
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(35)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Color(0xFF6D27C6),
                    minimumSize: Size(ScreenUtil().setWidth(150), ScreenUtil().setHeight(50)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
