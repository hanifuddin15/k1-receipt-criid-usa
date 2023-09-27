import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k1recipt/controller/employee_registration/employee_registration.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
//
// class SignUp extends  GetView<EmployeeRegistrationController>{
  EmployeeRegistrationController controller =
      Get.put(EmployeeRegistrationController());

  final List<String> companies = ['Company A', 'Company B', 'Company C'];
  String dropdownval = '';
  TextEditingController confrompassword = TextEditingController();

  final myVariable = "Company".obs;

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
                SizedBox(height: ScreenUtil().setHeight(30) //40
                    ),
                Image.asset(
                  'assets/logo_k1receipt.png',
                  width: ScreenUtil().setWidth(84),
                  height: ScreenUtil().setHeight(68),
                ),
                SizedBox(height: ScreenUtil().setHeight(20) //35
                    ),
                Text(
                  'Sign Up',
                  style: GoogleFonts.mukta(
                    textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: const Color(0xff1e1c1c),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20) //45
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Registration As',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),

//                         Container(
//                           height: 24.h,
//                           width: 300.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child:
//                           // Obx(() =>  Padding(
//                           //   padding: const EdgeInsets.symmetric(horizontal: 16),
//                           //   child:  DropdownButton<String>(
//                           //     value: myVariable.value,
//                           //     hint: Text("Registration as a.."),
//                           //     //value: dropdownval.isEmpty ? null : dropdownval,
//                           //     items: <String>[ 'Company', 'General User' ].map((String value) {
//                           //       return DropdownMenuItem<String>(
//                           //         value: value,
//                           //         child: Container(
//                           //             width: 240.w,
//                           //             child: Text(value, style: GoogleFonts.mukta(
//                           //               textStyle: TextStyle(
//                           //                 fontSize: 14,
//                           //                 color: Colors.black,
//                           //                 fontWeight: FontWeight.bold,
//                           //               ),),)),
//                           //       );
//                           //     }).toList(),
//                           //     onChanged: (value) {
//                           //       setState(() {
//                           //         myVariable.value=value!;
//                           //         dropdownval=value;
//                           //       });
//                           //       print(":::::${myVariable.value}");
//                           //       // if(value=='General User'){
//                           //       //   controller.setUserType('General_User');
//                           //       // }else
//                           //       if(value=='Company'){
//                           //         controller.setUserType('Company');
//                           //       }else if(value=='General User'){
//                           //         controller.setUserType('General_User');
//                           //       }
//                           //         // print("::::::::: $value");
//                           //       },
//                           //     ),
//                           //   )
//                           // ),
//                           Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16),
//   child: Obx(
//     () => TextFormField(
//       controller: controller,
//       obscureText: controller.obscurePassword.value,
//       onChanged: controller.setPassword,
//       style: GoogleFonts.mukta(
//         textStyle: const TextStyle(
//           fontSize: 12,
//           color: Colors.black,
//         ),
//       ),
//       decoration: InputDecoration(
//         hintText: 'Enter Your Password',
//         hintStyle: GoogleFonts.mukta(
//           fontSize: 12,
//           color: Colors.grey,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
//         suffixIcon: Container(
//           alignment: Alignment.center, // Center vertically
//           padding: EdgeInsets.all(0),  // Adjust padding as needed
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,    // Outline border color
//               width: 1.0,             // Outline border width
//             ),
//             borderRadius: BorderRadius.circular(5.0), // Adjust radius as needed
//           ),
//           child: IconButton(
//             icon: Icon(
//               controller.obscurePassword.value
//                   ? Icons.visibility_off
//                   : Icons.visibility,
//               color: Colors.black,
//             ),
//             onPressed: controller.togglePasswordVisibility,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),

//                         ),

                        Container(
                          height: 24.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: DropdownButton<String>(
                                value: myVariable.value.isEmpty
                                    ? null
                                    : myVariable.value,
                                hint: const Text("Register as a.."),
                                items: <String>['Company', 'General User']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      width: 240.w,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.mukta(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    myVariable.value = value!;
                                    dropdownval = value;
                                  });
                                  print(":::::${myVariable.value}");
                                  if (value == 'Company') {
                                    controller.setUserType('Company');
                                  } else if (value == 'General User') {
                                    controller.setUserType('General_User');
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'First Name',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Container(
                          height: 24.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              onChanged: controller.setFirstName,
                              style: GoogleFonts.mukta(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  //fontWeight: FontWeight,
                                ),
                              ),
                              decoration: InputDecoration(
                                //labelText: 'Enter your First name',
                                hintText: 'Enter your First name',
                                hintStyle: GoogleFonts.mukta(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Last Name',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Container(
                          height: 24.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              onChanged: controller.setLastName,
                              style: GoogleFonts.mukta(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,

                                  // color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                  //labelText: 'Enter Your Last Name',
                                  hintText: 'Enter Your Last Name',
                                  hintStyle: GoogleFonts.mukta(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Email Address',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Container(
                          height: 24.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              onChanged: controller.setEmail,
                              style: GoogleFonts.mukta(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                  // labelText: 'Enter your Email Address',
                                  hintText: 'Enter your Email Address',
                                  hintStyle: GoogleFonts.mukta(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Mobile',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Container(
                          height: 24.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              onChanged: controller.setMobile,
                              style: GoogleFonts.mukta(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                  // labelText: 'Enter your Email Address',
                                  hintText: 'Enter your Mobile No',
                                  hintStyle: GoogleFonts.mukta(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Password',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
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
                                obscureText:
                                    controller.conformobscurePassword.value,
                                onChanged: controller.setPassword,
                                style: GoogleFonts.mukta(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
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
                                    suffixIcon: IconButton(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      icon: Icon(
                                        controller.conformobscurePassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                      onPressed: controller
                                          .conformtogglePasswordVisibility,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: 35.h,
                    //   width: 300.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     border: Border.all(color: Colors.black),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     child: TextFormField(
                    //       onChanged: controller.setPassword,
                    //       style: GoogleFonts.mukta(
                    //         textStyle: TextStyle(
                    //           fontSize: 12,
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       decoration: InputDecoration(
                    //         //labelText: 'Enter Your Password',
                    //         hintText:'Enter Your Password',
                    //         hintStyle:GoogleFonts.mukta(
                    //           fontSize: 12,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //14
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          'Confirm Password',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.mukta(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5) //10
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
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
                                obscureText: controller.obscurePassword.value,
                                onChanged: controller.setconfromPassword,
                                style: GoogleFonts.mukta(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    // color: Colors.grey,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                decoration: InputDecoration(
                                    hintText: 'Enter your Confirm Password',
                                    hintStyle: GoogleFonts.mukta(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      icon: Icon(
                                        controller.obscurePassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                      onPressed:
                                          controller.togglePasswordVisibility,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: 35.h,
                    //   width: 300.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     border: Border.all(color: Colors.black),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     child: TextFormField(
                    //       onChanged: controller.setconfromPassword,
                    //       style: GoogleFonts.mukta(
                    //         textStyle: TextStyle(
                    //           fontSize: 12,
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       decoration: InputDecoration(
                    //         //labelText: 'Enter your Confirm Password',
                    //         hintText:'Enter your Confirm Password',
                    //         hintStyle:GoogleFonts.mukta(
                    //           fontSize: 12,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5) //10
                    ),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      print("::::::::::::: ${myVariable.value}");
                      // if(myVariable.value=='Company'){
                      //   controller.setUserType('Company');
                      // }
                      if (myVariable.value == "Employee") {
                        controller.registerEmployee();
                      } else if (myVariable.value == 'Company') {
                        controller.registerCompany();
                        controller.setUserType('Company');
                      } else if (myVariable.value == 'General User') {
                        controller.registerCompany();
                      }
                    },
                    child: controller.isloading.isTrue
                        ? SizedBox(
                            height: 26,
                            width: 26,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 1.6.w,
                            ),
                          )
                        : Row(
                            children: [
                              SizedBox(width: ScreenUtil().setWidth(5) //10
                                  ),
                              Text(
                                'Submit',
                                style: GoogleFonts.mukta(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: const Color(0xff255a98),
                      minimumSize: Size(ScreenUtil().setWidth(285),
                          ScreenUtil().setHeight(30)),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.mukta(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        const TextSpan(
                          text: 'Log in',
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
        );
      },
    );
  }
}



class SignUp1 extends StatefulWidget {
  SignUp1({required this.userAccount,Key? key}) : super(key: key);

  GoogleSignInAccount userAccount;
  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
//
// class SignUp extends  GetView<EmployeeRegistrationController>{
  EmployeeRegistrationController controller = Get.put(EmployeeRegistrationController());

  final List<String> companies = ['Company A', 'Company B', 'Company C'];
  String dropdownval='';
  TextEditingController confrompassword = TextEditingController();
  final myVariable = "Company".obs;

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setEmail(widget.userAccount.email.toString());
    controller.setFirstName(widget.userAccount.displayName.toString());
    controller.firstName.value=widget.userAccount.displayName.toString();
    controller.email.value=widget.userAccount.email.toString();

    name.text=widget.userAccount.displayName.toString();
    email.text=widget.userAccount.email.toString();

    print(":::::ss; ${ controller.firstName.value}");
    setState(() {});
  }

  // FirebaseUser _user;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  //
  // bool isSignIn =false;
  // bool google =false;
  //
  // Future<FirebaseUser> signInWithGoogle() async {
  //  // Future<FirebaseUser> signInWithGoogle(SignInViewModel model) async {
  //
  //
  //   GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //
  //   await googleSignInAccount!.authentication;
  //
  //   AuthCredential credential = GoogleAuthProvider.getCredential(
  //
  //     accessToken: googleSignInAuthentication.accessToken,
  //
  //     idToken: googleSignInAuthentication.idToken,
  //
  //   );
  //
  //   AuthResult authResult = await _auth.signInWithCredential(credential);
  //
  //   _user = authResult.user;
  //
  //   assert(!_user.isAnonymous);
  //
  //   assert(await _user.getIdToken() != null);
  //
  //   FirebaseUser currentUser = await _auth.currentUser();
  //
  //   assert(_user.uid == currentUser.uid);
  //
  //
  //   //model.state =ViewState.Idle;
  //
  //   print("User Name: ${_user.displayName}");
  //   print("User Email ${_user.email}");
  //
  // }
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
                    height: ScreenUtil().setHeight(120),
                  ),
                  SizedBox(height: 0),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.mukta(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        color: Color(0xff1e1c1c),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select one',
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child:Obx(() =>  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child:  DropdownButton<String>(
                            value: myVariable.value,
                            //value: dropdownval.isEmpty ? null : dropdownval,
                            items: <String>[ 'Company', 'General User' ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                    width: 240.w,
                                    child: Text(value, style: GoogleFonts.mukta(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),),)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                myVariable.value=value!;
                                dropdownval=value;
                              });
                              print(":::::${myVariable.value}");
                              // if(value=='General User'){
                              //   controller.setUserType('General_User');
                              // }else
                              if(value=='Company'){
                                controller.setUserType('Company');
                              }else if(value=='General User'){
                                controller.setUserType('General_User');
                              }
                              // print("::::::::: $value");
                            },
                          ),
                        )
                        ),
                      ),
                    ],
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: name,
                            onChanged: controller.setFirstName,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                //fontWeight: FontWeight,
                              ),
                            ),
                            decoration: InputDecoration(
                              //labelText: 'Enter your First name',
                              hintText:'Enter your First name',
                              hintStyle:GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            onChanged: controller.setLastName,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black,

                                // color: Colors.grey,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              //labelText: 'Enter Your Last Name',
                              hintText:'Enter Your Last Name',
                              hintStyle:GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),

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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: email,
                            onChanged: controller.setEmail,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                // color: Colors.grey,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              // labelText: 'Enter your Email Address',
                              hintText:'Enter your Email Address',
                              hintStyle:GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            onChanged: controller.setMobile,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                // color: Colors.grey,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              // labelText: 'Enter your Email Address',
                              hintText:'Enter your Mobile No',
                              hintStyle:GoogleFonts.mukta(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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
                          child: Obx(
                                () => TextFormField(
                              obscureText: controller.conformobscurePassword.value,
                              onChanged: controller.setPassword,
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText:'Enter Your Password',
                                hintStyle: GoogleFonts.mukta(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.conformobscurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onPressed: controller.conformtogglePasswordVisibility,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 35.h,
                      //   width: 300.w,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     border: Border.all(color: Colors.black),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 16),
                      //     child: TextFormField(
                      //       onChanged: controller.setPassword,
                      //       style: GoogleFonts.mukta(
                      //         textStyle: TextStyle(
                      //           fontSize: 12,
                      //           color: Colors.grey,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       decoration: InputDecoration(
                      //         //labelText: 'Enter Your Password',
                      //         hintText:'Enter Your Password',
                      //         hintStyle:GoogleFonts.mukta(
                      //           fontSize: 12,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password',
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
                        height: 35.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(
                                () => TextFormField(
                              obscureText: controller.obscurePassword.value,
                              onChanged: controller.setconfromPassword,
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText:'Enter your Confirm Password',
                                hintStyle: GoogleFonts.mukta(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                suffixIcon: IconButton(
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
                      // Container(
                      //   height: 35.h,
                      //   width: 300.w,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     border: Border.all(color: Colors.black),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 16),
                      //     child: TextFormField(
                      //       onChanged: controller.setconfromPassword,
                      //       style: GoogleFonts.mukta(
                      //         textStyle: TextStyle(
                      //           fontSize: 12,
                      //           color: Colors.grey,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       decoration: InputDecoration(
                      //         //labelText: 'Enter your Confirm Password',
                      //         hintText:'Enter your Confirm Password',
                      //         hintStyle:GoogleFonts.mukta(
                      //           fontSize: 12,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Obx(()=> ElevatedButton(
                    onPressed:() {
                      print("::::::::::::: ${myVariable.value}");
                      // if(myVariable.value=='Company'){
                      //   controller.setUserType('Company');
                      // }
                      if(myVariable.value=="Employee"){
                        controller.registerEmployee();
                      }
                      else if(myVariable.value=='Company'){
                        controller.setUserType('Company');
                        controller.registerCompany();

                      }
                      else if(myVariable.value=='General User'){
                        controller.registerCompany();
                      }
                    },
                    child: controller.isloading.isTrue ?
                    SizedBox(
                      height: 26,
                      width: 26,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 1.6.w,
                      ),
                    ):
                    Text(
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
                      minimumSize: Size(ScreenUtil().setWidth(285), ScreenUtil().setHeight(38)),
                    ),
                    ),
                  ),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.mukta(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
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
}