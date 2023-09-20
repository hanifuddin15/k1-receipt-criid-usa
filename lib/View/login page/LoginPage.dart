import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Promo%20Code/Promocode.dart';
import 'package:k1recipt/View/Sign%20Up/SignUp.dart';
import 'package:k1recipt/View/forgetPassword/ResetpasswordUI.dart';
import 'package:k1recipt/controller/getserviceController/getServiceController.dart';
import 'package:k1recipt/controller/login/loginController.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends GetView<LoginController>{
  LoginPage({Key? key,}) : super(key: key);
  bool load=false;

  void _showToast(BuildContext context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$text',style:GoogleFonts.poppins(fontSize: 15.sp,color: Colors.white)),
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();

  @override
  Widget build(BuildContext context) {

    Get.put(LoginController());
    Get.put(ServicesOfPlanController());
    LoginController loginController= Get.put(LoginController());
    loginController.loadUserEmailPassword();
    controller.username.value.isNotEmpty ? a.text= controller.username.value:null;
    controller.password.value.isNotEmpty ? b.text= controller.password.value:null;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height:ScreenUtil().setHeight(42)
            ),
            ///__Logo______///
            Image.asset(
              'assets/logo_k1receipt.png',
              width: ScreenUtil().setWidth(84),
              height: ScreenUtil().setHeight(68),
            ),

            ///________Logo end_____///
            SizedBox(
              height:ScreenUtil().setHeight(36)
            ),

            ///________Login Title_____///
            Text(
              'Log In',
              style: GoogleFonts.mukta(
                textStyle: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  color: const Color(0xff081588),
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                  // decorationThickness: 5.0,
                ),
              ),
            ),

            ///________Login Title end_____///
            ///________Login UnderLine _____///
            
            Container(
               height:ScreenUtil().setHeight(2),
               width: ScreenUtil().setWidth(120),
              child: const Divider(
              color: Color(0xff081588),  // You can change the color to your preference
              thickness: 3.0,       // You can adjust the thickness of the line
            ),
            ),
            ///________Login underline end_____///

            SizedBox(
              height:ScreenUtil().setHeight(33)
            ),

            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///________Username or Phone Number Text_____///
                Text(
                  '  Username or Phone Number',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.mukta(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ///________Username or Phone Number Text end_____///
                SizedBox(
              height:ScreenUtil().setHeight(10)
            ),
           ///________Username or Phone Number TextInput Field_____///
                Container(
                  height: 24.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black),
                  ),
                  child: 
              
                  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: TextFormField(
    controller: a,
    onChanged: controller.setUsername,
    style: GoogleFonts.mukta(
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
    ),
    decoration: InputDecoration(
      hintText: 'Enter Username or Phone Number',
      hintStyle: GoogleFonts.mukta(
        fontSize: 12,
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 7.0), // Adjust the vertical padding as needed
      // labelText: 'Enter Username or Phone Number',
    ),
  ),
),

                ),
                 ///________Username or Phone Number TextInput Field End_____///
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(20)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ///________Password Text_____///
                Text(
                  '  Password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.mukta(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ///________Password Text End_____///
                SizedBox(height: ScreenUtil().setHeight(10)),
           ///________Password Text Field _____///
                Container(
                  height: 24.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(
                          () => TextFormField(
                            controller: b,
                            obscureText: controller.obscurePassword.value,
                            onChanged: controller.setPassword,
                            style: GoogleFonts.mukta(
                              textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.black
                                // color: Colors.grey,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              hintStyle: GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                               contentPadding: const EdgeInsets.symmetric(vertical: 7.0),
                              suffixIcon: IconButton(
                                alignment: Alignment.centerRight,
                              
                                padding: const EdgeInsets.symmetric(vertical: 1),
                                icon: Icon(
                                  controller.obscurePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                  
                                ),
                                onPressed: controller.togglePasswordVisibility,
                          ),
                          
                        ),
                      ),
                    ),
                  ),
                ),
                ///________Password Text Field end_____///
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       SizedBox(width: 30.w,),
            //       Obx(() => SizedBox(
            //           height: 24.0,
            //           width: 24.0,
            //           child: Theme(
            //             data: ThemeData(
            //                 unselectedWidgetColor: Colors.black // Your color
            //             ),
            //             child: Checkbox(
            //                 activeColor: Colors.black,
            //                 value: controller.isChecked.value,
            //                 onChanged: (bool? val){
            //                   print("::::::::::::: $controller.isChecked.value");
            //                   if(controller.username.value.isNotEmpty && controller.password.value.isNotEmpty) {
            //                     controller.isChecked.value = val!;
            //                     controller.handleRemeberme(controller.isChecked.value);
            //                   }
            //                   else{
            //                     _showToast(context,"Enter email and password");
            //                   }
            //                 }),
            //           ))),

            //        SizedBox(width: ScreenUtil().setWidth(10)),

            //       const Text("Remember Me",
            //         style: TextStyle(
            //             color: Color(0xff646464),
            //             fontSize: 12,
            //             fontFamily: 'Rubic'),
            //       ),
            //     ]
            // ),

            SizedBox(height: ScreenUtil().setHeight(21)),
///________Login Button _____///
            Obx(()=> ElevatedButton(
                  onPressed: (){
                    controller.login();
                    print("IIIIIIIII ${controller.loading.value}");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: const Color(0xff081C3C),
                    minimumSize: Size(ScreenUtil().setWidth(101), ScreenUtil().setHeight(36)),
                  ),
                  child: controller.loading.isTrue
                       ? SizedBox(
                          height: 26,
                          width: 26,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 1.6.w,
                          ),
                        )
                       : Text(
                    'Log In',
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontSize: 16,
                      color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),),
///________Login Button end _____///
            SizedBox(height: ScreenUtil().setHeight(6)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///________Forgot password sign up text button _____///
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordUi()));
                  },
                  child: Text(
                    'Forgot  your password?',
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color:  Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                 TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color:  Color(0xffD40101), ///D40101
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                 ///________Forgot password sign up text button end _____///
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(33)),
 ///________Continue with google button _____///
            ElevatedButton.icon(
              //onPressed: () => _handleGoogleSignIn(context), // Call the _handleGoogleSignIn function
              onPressed:()=> signInWithGoogle(context),
              // onPressed: () {
              //   _handleSignIn();
              // },
              icon: Image.asset('assets/google_icon.png'
              ,
              height: ScreenUtil().setHeight(23),
              width: ScreenUtil().setWidth(23),
              ),
              label: Text(
                'Continue with Google',
                style: GoogleFonts.mukta(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color:  Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: const Color(0xff081C3C),
                minimumSize: Size(ScreenUtil().setWidth(225), ScreenUtil().setHeight(38)),
                ),
            ),
///________Continue with google button end_____///
            SizedBox(height: ScreenUtil().setHeight(33)),
///________Continue with promocode button _____///
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  SignUp()),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PromocodePage()),
                );
              },
              child: Text(
                'Continue with promocode',
                style: GoogleFonts.mukta(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color:  Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: const Color(0xff081C3C),
                minimumSize: Size(ScreenUtil().setWidth(225), ScreenUtil().setHeight(38)),
              ),
            ),
///________Continue with promocode button end _____///
            // SizedBox(height: 150.h,)
          ],
        ),
      ),
        );

    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {
    //     return Scaffold(
    //       body: SingleChildScrollView(
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Image.asset(
    //                 'assets/logo.png',
    //                 width: ScreenUtil().setWidth(250),
    //                 height: ScreenUtil().setHeight(200),
    //               ),
    //               SizedBox(height: 0),
    //               Text(
    //                 'Log In',
    //                 style: GoogleFonts.mukta(
    //                   textStyle: TextStyle(
    //                     fontSize: ScreenUtil().setSp(25),
    //                     color: Color(0xff081588),
    //                     fontWeight: FontWeight.bold,
    //                     decoration: TextDecoration.underline,
    //                     decorationThickness: 2.0,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 10),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'Username or Phone Number',
    //                     textAlign: TextAlign.left,
    //                     style: GoogleFonts.mukta(
    //                       textStyle: TextStyle(
    //                         fontSize: 14,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 10),
    //                   // Obx(() => Container(
    //                   //   height: 35.h,
    //                   //   width: 300.w,
    //                   //   decoration: BoxDecoration(
    //                   //     borderRadius: BorderRadius.circular(30),
    //                   //     border: Border.all(color: Colors.black),
    //                   //   ),
    //                   //   child: Padding(
    //                   //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                   //     child: TextFormField(
    //                   //       onChanged: controller.setUsername,
    //                   //       style: GoogleFonts.mukta(
    //                   //         textStyle: TextStyle(
    //                   //           fontSize: 12,
    //                   //           color: Colors.grey,
    //                   //           fontWeight: FontWeight.bold,
    //                   //         ),
    //                   //       ),
    //                   //       decoration: InputDecoration(
    //                   //         hintText:'Enter Username or Phone Number',
    //                   //         hintStyle:GoogleFonts.mukta(
    //                   //           fontSize: 12,
    //                   //           color: Colors.grey,
    //                   //         ),
    //                   //         // labelText: 'Enter Username or Phone Number',
    //                   //       ),
    //                   //     ),
    //                   //   ),
    //                   // ))
    //                   Container(
    //                     height: 35.h,
    //                     width: 300.w,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(30),
    //                       border: Border.all(color: Colors.black),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 16),
    //                       child: TextFormField(
    //                         controller: a,
    //                         onChanged: controller.setUsername,
    //                         style: GoogleFonts.mukta(
    //                           textStyle: TextStyle(
    //                             fontSize: 12,
    //                             color: Colors.grey,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         decoration: InputDecoration(
    //                           hintText:'Enter Username or Phone Number',
    //                           hintStyle:GoogleFonts.mukta(
    //                             fontSize: 12,
    //                             color: Colors.grey,
    //                           ),
    //                           // labelText: 'Enter Username or Phone Number',
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //
    //               SizedBox(height: 16),
    //
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'Password',
    //                     textAlign: TextAlign.left,
    //                     style: GoogleFonts.mukta(
    //                       textStyle: TextStyle(
    //                         fontSize: 14,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 5),
    //                   // Container(
    //                   //   height: 35.h,
    //                   //   width: 300.w,
    //                   //   decoration: BoxDecoration(
    //                   //     borderRadius: BorderRadius.circular(30),
    //                   //     border: Border.all(color: Colors.black),
    //                   //   ),
    //                   //   child: Padding(
    //                   //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                   //     child: TextFormField(
    //                   //       onChanged: controller.setPassword,
    //                   //       style: GoogleFonts.mukta(
    //                   //         textStyle: TextStyle(
    //                   //           fontSize: 12,
    //                   //           color: Colors.grey,
    //                   //           fontWeight: FontWeight.bold,
    //                   //         ),
    //                   //       ),
    //                   //       decoration: InputDecoration(
    //                   //           hintText:'Enter Your Password',
    //                   //         hintStyle:GoogleFonts.mukta(
    //                   //           fontSize: 12,
    //                   //           color: Colors.grey,
    //                   //         ),
    //                   //        // labelText: 'Enter Your Password',
    //                   //       ),
    //                   //     ),
    //                   //   ),
    //                   // ),
    //                   Container(
    //                     height: 35.h,
    //                     width: 300.w,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(30),
    //                       border: Border.all(color: Colors.black),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 16),
    //                       child: Obx(
    //                             () => TextFormField(
    //                           controller: b,
    //                           obscureText: controller.obscurePassword.value,
    //                           onChanged: controller.setPassword,
    //                           style: GoogleFonts.mukta(
    //                             textStyle: TextStyle(
    //                               fontSize: 12,
    //                               color: Colors.grey,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                           decoration: InputDecoration(
    //                             hintText: 'Enter Your Password',
    //                             hintStyle: GoogleFonts.mukta(
    //                               fontSize: 12,
    //                               color: Colors.grey,
    //                             ),
    //                             suffixIcon: IconButton(
    //                               icon: Icon(
    //                                 controller.obscurePassword.value
    //                                     ? Icons.visibility_off
    //                                     : Icons.visibility,
    //                                 color: Colors.black,
    //                               ),
    //                               onPressed: controller.togglePasswordVisibility,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //
    //               SizedBox(height: 35),
    //
    //               Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     SizedBox(width: 30.w,),
    //                     Obx(() => SizedBox(
    //                         height: 24.0,
    //                         width: 24.0,
    //                         child: Theme(
    //                           data: ThemeData(
    //                               unselectedWidgetColor: Colors.black // Your color
    //                           ),
    //                           child: Checkbox(
    //                               activeColor: Colors.black,
    //                               value: controller.isChecked.value,
    //                               onChanged: (bool? val){
    //                                 print("::::::::::::: $controller.isChecked.value");
    //                                 if(controller.username.value.isNotEmpty && controller.password.value.isNotEmpty) {
    //                                   controller.isChecked.value = val!;
    //                                   controller.handleRemeberme(controller.isChecked.value);
    //                                 }
    //                                 else{
    //                                   _showToast(context,"Enter email and password");
    //                                 }
    //                               }),
    //                         ))),
    //
    //                     const SizedBox(width: 10.0),
    //
    //                     const Text("Remember Me",
    //                       style: TextStyle(
    //                           color: Color(0xff646464),
    //                           fontSize: 12,
    //                           fontFamily: 'Rubic'),
    //                     ),
    //                   ]),
    //
    //               SizedBox(height: 35),
    //               Obx(()=> ElevatedButton(
    //                 onPressed: (){
    //
    //                   controller.login();
    //                   print("IIIIIIIII ${controller.loading.value}");
    //                 },
    //                 child: controller.loading.isTrue
    //                     ? SizedBox(
    //                   height: 26,
    //                   width: 26,
    //                   child: CircularProgressIndicator(
    //                     backgroundColor: Colors.white,
    //                     strokeWidth: 1.6.w,
    //                   ),
    //                 )
    //                     : Text(
    //                   'Log In',
    //                   style: GoogleFonts.mukta(
    //                     textStyle: TextStyle(
    //                       fontSize: 16,
    //                       color:  Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 style: ElevatedButton.styleFrom(
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(30),
    //                   ),
    //                   primary: Color(0xff081C3C),
    //                   minimumSize: Size(ScreenUtil().setWidth(101), ScreenUtil().setHeight(36)),
    //                 ),
    //               ),
    //               ),
    //
    //               SizedBox(height: ScreenUtil().setHeight(10)),
    //
    //               TextButton(
    //                 onPressed: () {
    //
    //                   Navigator.of(context)
    //                       .push(MaterialPageRoute(builder: (context) => ResetPasswordUi()));
    //
    //                 },
    //                 child: Text(
    //                   'Forgot password?',
    //                   style: GoogleFonts.mukta(
    //                     textStyle: TextStyle(
    //                       fontSize: 14,
    //                       color:  Colors.grey,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //
    //               // SizedBox(height:10),
    //
    //               // ElevatedButton.icon(
    //               //   onPressed: () {},
    //               //   icon: Image.asset('assets/google.jpeg'),
    //               //   label: Text(
    //               //     'Continue with Google',
    //               //     style: GoogleFonts.mukta(
    //               //       textStyle: TextStyle(
    //               //         fontSize: 14,
    //               //         color:  Colors.grey,
    //               //         fontWeight: FontWeight.bold,
    //               //       ),
    //               //     ),
    //               //   ),
    //               //   style: ElevatedButton.styleFrom(
    //               //     shape: RoundedRectangleBorder(
    //               //       borderRadius: BorderRadius.circular(30),
    //               //     ),
    //               //     primary: Colors.white,
    //               //     minimumSize: Size(ScreenUtil().setWidth(225), ScreenUtil().setHeight(38)),
    //               //     ),
    //               // ),
    //
    //               SizedBox(height: ScreenUtil().setHeight(10)),
    //
    //               ElevatedButton(
    //                 onPressed: () {
    //                   // Navigator.push(
    //                   //   context,
    //                   //   MaterialPageRoute(builder: (context) =>  SignUp()),
    //                   // );
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(builder: (context) =>  PromocodePage()),
    //                   );
    //                 },
    //                 child: Text(
    //                   'Create new account',
    //                   style: GoogleFonts.mukta(
    //                     textStyle: TextStyle(
    //                       fontSize: 14,
    //                       color:  Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 style: ElevatedButton.styleFrom(
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(30),
    //                   ),
    //                   primary: Color(0xff081C3C),
    //                   minimumSize: Size(ScreenUtil().setWidth(225), ScreenUtil().setHeight(38)),
    //                 ),
    //               ),
    //
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }



  // // Function to handle Google Sign-In and navigate to the new screen
  // void _handleGoogleSignIn(BuildContext context) async {
  //
  //   // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
  //   //
  //   //     _currentUser = account;
  //   //
  //   //   if (_currentUser != null) {
  //   //     _handleGetContact(_currentUser!);
  //   //   }
  //   // });
  //   // _googleSignIn.signInSilently();
  //
  //   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  //
  //   try {
  //     //GoogleSignInAccount? userAccount =
  //     await _googleSignIn.signIn().then((value) {
  //       print("kajsdf :::: ${value!.email.toString()}");
  //       if (value != null) {
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp1(userAccount: value,),),);
  //       }else{}
  //     });
  //
  //   } catch (e) {
  //     print("Exception:::::::: $e");
  //     // Handle sign-in errors
  //   }
  // }
  // // SHA1: E1:BC:D1:F4:67:0E:40:26:5E:D4:0E:AA:C5:99:C7:E7:B3:AB:08:91
  // // SHA1: E1:BC:D1:F4:67:0E:40:26:5E:D4:0E:AA:C5:99:C7:E7:B3:AB:08:91
  // // SHA-256: 65:DF:CD:3E:66:84:D9:30:A3:F7:6F:CE:4C:F9:EA:1A:0A:D3:46:2E:BA:CA:8C:81:74:FF:50:37:55:4A:C3:5A

  var _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn =false;
  bool google =false;

  Future<dynamic> signInWithGoogle(BuildContext context) async {
    // Future<FirebaseUser> signInWithGoogle(SignInViewModel model) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn()
          .then((value) {
        print("::::::::::::::: ${value!.email.toString()}");
        if (value != null) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SignUp1(userAccount: value,),),);
        } else {}
      });
    }catch(e){
      print("eeeeexx $e");
    }
    //GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    // AuthCredential credential = GoogleAuthProvider.getCredential(
    //
    //   accessToken: googleSignInAuthentication.accessToken,
    //
    //   idToken: googleSignInAuthentication.idToken,
    //
    // );

    // AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );
    //
    // var authResult = await _auth.signInWithCredential(credential).then((value) {
    //   print("shukr alhumdulillah::::::: ${value.user!.email}");
    // });
    //
    // // _user = authResult.user;
    // //
    // // assert(!_user.isAnonymous);
    // //
    // // assert(await _user.getIdToken() != null);
    // //
    // // var currentUser = await _auth.currentUser;
    // //
    // // assert(_user.uid == currentUser!.uid);
    //
    //
    // //model.state =ViewState.Idle;
    //
    // print("User Name: ${_user.displayName}");
    // print("User Email ${_user.email}");
  }

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //
  //   _contactText = 'Loading contact info...';
  //
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     _contactText = 'People API gave a ${response.statusCode} '
  //         'response. Check logs for details.';
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data =
  //   json.decode(response.body) as Map<String, dynamic>;
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   // setState(() {
  //   if (namedContact != null) {
  //     _contactText = 'I see you know $namedContact!';
  //   } else {
  //     _contactText = 'No contacts to display.';
  //   }
  //   // });
  // }
  // String? _pickFirstNamedContact(Map<String, dynamic> data) {
  //   final List<dynamic>? connections = data['connections'] as List<dynamic>?;
  //   final Map<String, dynamic>? contact = connections?.firstWhere(
  //         (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
  //     orElse: () => null,
  //   ) as Map<String, dynamic>?;
  //   if (contact != null) {
  //     final List<dynamic> names = contact['names'] as List<dynamic>;
  //     final Map<String, dynamic>? name = names.firstWhere(
  //           (dynamic name) =>
  //       (name as Map<Object?, dynamic>)['displayName'] != null,
  //       orElse: () => null,
  //     ) as Map<String, dynamic>?;
  //     if (name != null) {
  //       return name['displayName'] as String?;
  //     }
  //   }
  //   return null;
  // }



}
