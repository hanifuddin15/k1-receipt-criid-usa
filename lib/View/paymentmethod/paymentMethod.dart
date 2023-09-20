import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'package:k1recipt/View/login%20page/LoginPage.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/getserviceController/getServiceController.dart';
import 'package:k1recipt/main.dart';
// import 'package:restart_app/restart_app.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class Paymentmethod extends StatefulWidget {
  Paymentmethod({Key? key, required this.amount, required this.planid}) : super(key: key);

  final String amount,planid;

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  bool light = true;

  bool nextscren=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
     // d_id="320";
      nextscren==true? Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ):null;
    });

  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    servicesofplan.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();

  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  String paymentId ='';
  String payerID = '';
  String totalAmount = '';


  Future<bool> runapi()async{
    try {
      String apiUrl = 'https://dev.k1receipt.com/api/pay';

      final formData = {
        'user_id':'$d_id',
        'paymentId': "${paymentId.substring(paymentId.indexOf('-') + 1)}",
        'PayerID': payerID,
        'amount': totalAmount,
        "plan_id":"${widget.planid}",
        "payer_email":"${controller2.text}",
        "currency":"\$",
        "payment_status":""
      };

      var response = await http.post(
        Uri.parse(apiUrl),
        body:formData,
      );

      if (response.statusCode == 200) {
        // Successful API call
        var responseData = json.decode(response.body);
        print('API Response: $responseData');

        responseData['error']==false?
        Get.snackbar(
          'Successfully payed',
          'Your package has been purchased successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        )
            :Get.snackbar(
          'Undefined error',
          'occur',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        //     Get.snackbar(
        //   'Successfully payed',
        //   'Your package has been purchased successfully',
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );

        if (this.mounted)

          servicesofplan.services1.clear();
        servicesofplan.services2.clear();
        servicesofplan.services3.clear();
        servicesofplan.services4.clear();

        // Get.put(ServicesOfPlanController());
        // Restart.restartApp();
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );

        print(":::::::::LLLLLL ");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );

        if (this.mounted)
        setState(() {
          nextscren=true;
        });
          return true;
        //Get.offAll(() => LoginPage());


      }
      else {
        // Error during API call
        print(
            'API Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      return false;

      // Exception occurred
      print('API Exception: $error');
    }
  }

  ServicesOfPlanController servicesofplan = Get.find();
  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(usertoken.isNotEmpty && user_id.isNotEmpty && g_email.isNotEmpty && g_address.isNotEmpty ){
                              Navigator.pop(context);
                            }else
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Container(
                            height: 50.sp,
                            width: 50.sp,
                            //color: Colors.blueAccent,
                            child: Center(child: Icon(Icons.arrow_back_ios_new_outlined,size: 15.sp,)),
                          ),
                        ),
                        Spacer(),

                      ],
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: ScreenUtil().setWidth(250),
                      height: ScreenUtil().setHeight(130),
                    ),
                    SizedBox(height: 0),
                    Text(
                      'Payment Method',
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 79,
                      width: 350,
                      margin: EdgeInsets.only(left: 5, top: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6D27C6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Order Total:',
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              '\$${widget.amount}',
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 29.0.sp, vertical: 15.sp),
                          child: Text(
                            'Select Payment method',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0.sp, vertical: 4.sp),
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff1f1f1),
                                borderRadius: BorderRadius.circular(15.sp)),

                            // icon: Image.asset('assets/paypal.jpeg'),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align text and image to the left
                              children: [
                                SizedBox(
                                  width: 12.sp,
                                ),
                                Image.asset(
                                  'assets/paypal.jpeg',
                                  height: 30.sp,
                                  width: 30.sp,
                                ),
                                Text(
                                  'Paypal',
                                  style: GoogleFonts.mukta(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  child: CupertinoSwitch(
                                    value: light,
                                    activeColor: Colors.red,
                                    onChanged: (bool value) {
                                      if (mounted){
                                      setState(() {
                                        //light = value;
                                        light = true;
                                      });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 4.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            'Billing Information:',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
                          'Full Name',
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
                          height: 40,
                          width: 390,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              controller: controller1,
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter Your Full Name',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
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
                          height: 40,
                          width: 390,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              controller: controller2,
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email Address',
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
                          'Phone',
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
                          height: 40,
                          width: 390,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller3,
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter Your Phone Number',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        print("::::::::  ${widget.amount}");

                        if (controller1.text.isEmpty ||
                            controller2.text.isEmpty ||
                            controller3.text.isEmpty) {
                          Get.snackbar(
                            'Invalid form',
                            'Please fill all the required fields',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                        else if (!controller2.text.contains('@') &&
                            !controller2.text.contains('.')) {
                          Get.snackbar(
                            'Invalid form',
                            'Your email is not correct',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        } else {
                          String _amount = widget.amount;

                          // if (this.mounted) {
                          //   setState(() {
                          //     controller1.text;
                          //     controller2.text;
                          //     controller3.text;
                          //   });
                          // }

                          if (mounted) {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) => UsePaypal(
                            //         sandboxMode: true,
                            //         clientId:
                            //             "Ac6aHKegsFweFYx2LaHsACSTps-mTpCRMnvpNpkf1a8AHhB2cCKD__14_Z0Sd6-_IfEr6xFHsp9k4gj-",
                            //         secretKey:
                            //             "EGyM-nW0S4xhgH2dM1zXNzrK1YSrk7ZYfss6wu_hvub8Wd3DWex04xoNij37SCAOaAJZk3lAmHCIyjfk",
                            //         returnURL: "https://samplesite.com/return",
                            //         cancelURL: "https://samplesite.com/cancel",
                            //         transactions: [
                            //           {
                            //             "amount": {
                            //               // "total": '10.12',
                            //               "total": '${widget.amount}',
                            //               "currency": "USD",
                            //               "details": {
                            //                 "subtotal": '${widget.amount}',
                            //                 "shipping": '0',
                            //                 "shipping_discount": 0
                            //               }
                            //             },
                            //             "description":
                            //                 "The payment transaction description.",
                            //             // "payment_options": {
                            //             //   "allowed_payment_method":
                            //             //       "INSTANT_FUNDING_SOURCE"
                            //             // },
                            //             "item_list": {
                            //               "items": [
                            //                 {
                            //                   "name": "${controller1.text}",
                            //                   "quantity": 1,
                            //                   "price": '${widget.amount}',
                            //                   "currency": "USD"
                            //                 }
                            //               ],
                            //               // shipping address is not required though
                            //               "shipping_address": {
                            //                 "recipient_name":
                            //                     "${controller1.text}",
                            //                 "line1": "Travis County",
                            //                 "line2": "",
                            //                 "city": "Austin",
                            //                 "country_code": "US",
                            //                 "postal_code": "73301",
                            //                 "phone": "${controller3.text}",
                            //                 "state": "Texas"
                            //               },
                            //             }
                            //           }
                            //         ],
                            //         note:
                            //             "Contact us for any questions on your order.",
                            //         onSuccess: (Map params) async {
                            //           // print("$params");
                            //           // print("${params} paymentId");
                            //           controller4.text = "${params}";
                            //           String paymentMap = json.encode(params);
                            //           final jsonString = jsonDecode(paymentMap);
                            //            paymentId = jsonString['paymentId'];
                            //            payerID = jsonString['payerID'];
                            //            totalAmount = jsonString['data']['transactions'][0]['amount']['total'];
                            //           // //print("onSuccess: $params");
                            //           print("object ::::::::::$d_id ${paymentId.substring(paymentId.indexOf('-') + 1)} $payerID $totalAmount ${widget.planid} ${controller2.text}");
                            //
                            //           bool suc =await runapi();
                            //
                            //           // if(suc==true){
                            //           //   Navigator.push(
                            //           //     context,
                            //           //     MaterialPageRoute(builder: (context) => BottomAnimatedBar()),
                            //           //   );
                            //
                            //             // delcat();
                            //
                            //           //}
                            //
                            //           // try {
                            //           //   String apiUrl = 'https://dev.k1receipt.com/api/pay';
                            //           //
                            //           //   final formData = {
                            //           //     'user_id':'$d_id',
                            //           //     'paymentId': "${paymentId.substring(paymentId.indexOf('-') + 1)}",
                            //           //     'PayerID': payerID,
                            //           //     'amount': totalAmount,
                            //           //     "plan_id":"${widget.planid}",
                            //           //     "payer_email":"${controller2.text}",
                            //           //     "currency":"\$",
                            //           //     "payment_status":""
                            //           //   };
                            //           //
                            //           //
                            //           //   var response = await http.post(
                            //           //     Uri.parse(apiUrl),
                            //           //     body:formData,
                            //           //   );
                            //           //
                            //           //   if (response.statusCode == 200) {
                            //           //         // Successful API call
                            //           //         var responseData = json.decode(response.body);
                            //           //         print('API Response: $responseData');
                            //           //
                            //           //         responseData['error']==false?
                            //           //         Get.snackbar(
                            //           //           'Successfully payed',
                            //           //           'Your package has been purchased successfully',
                            //           //           backgroundColor: Colors.green,
                            //           //           colorText: Colors.white,
                            //           //         )
                            //           //
                            //           //             :Get.snackbar(
                            //           //           'Undefined error',
                            //           //           'occur',
                            //           //           backgroundColor: Colors.red,
                            //           //           colorText: Colors.white,
                            //           //         );
                            //           //
                            //           //         //     Get.snackbar(
                            //           //         //   'Successfully payed',
                            //           //         //   'Your package has been purchased successfully',
                            //           //         //   backgroundColor: Colors.green,
                            //           //         //   colorText: Colors.white,
                            //           //         // );
                            //           //
                            //           //         if (this.mounted)
                            //           //
                            //           //         servicesofplan.services1.clear();
                            //           //         servicesofplan.services2.clear();
                            //           //         servicesofplan.services3.clear();
                            //           //         servicesofplan.services4.clear();
                            //           //
                            //           //         // Get.put(ServicesOfPlanController());
                            //           //         // Restart.restartApp();
                            //           //         // Navigator.pushReplacement(
                            //           //         //   context,
                            //           //         //   MaterialPageRoute(builder: (context) => LoginPage()),
                            //           //         // );
                            //           //
                            //           //         // Navigator.push(
                            //           //         //   context,
                            //           //         //   MaterialPageRoute(builder: (context) => LoginPage()),
                            //           //         // );
                            //           //
                            //           //         Get.offAll(() => LoginPage());
                            //           //
                            //           //         // if (this.mounted)
                            //           //         // setState(() {
                            //           //         //   nextscren=true;
                            //           //         // });
                            //           //   }
                            //           //   else {
                            //           //     // Error during API call
                            //           //     print(
                            //           //         'API Error: ${response.statusCode}');
                            //           //   }
                            //           // } catch (error) {
                            //           //   // Exception occurred
                            //           //   print('API Exception: $error');
                            //           // }
                            //         },
                            //         onError: (error) {
                            //           print("onError: $error");
                            //         },
                            //         onCancel: (params) {
                            //           print('cancelled: $params');
                            //         }),
                            //   ),
                            //
                            // );
                          }
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.sp),
                          color: Color(0xff081C3C),
                        ),
                        child: Center(
                            child: Text(
                          "Pay",
                          style: GoogleFonts.mukta(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    SizedBox(height: 26),
                    controller4.text.isNotEmpty
                        ? TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller4,
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Phone Number',
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
    //   },
    // );
  }


  // delcat() {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Container(
  //           width: 390.w,
  //           height: 150.h,
  //           padding: EdgeInsets.all(16.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   CircleAvatar(
  //                     backgroundColor: Colors.red,
  //                     child: IconButton(
  //                       icon: Icon(Icons.close),
  //                       color: Colors.white,
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 10.h,),
  //               Text('Are you sure you want to delete?',style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),),
  //               SizedBox(height: 10.h,),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   // editCatWithBudget.cat_id.value=catid;
  //                   //
  //                   // editCatWithBudget.cat_name.value=catname;
  //                   //
  //                   // editCatWithBudget.editCat();
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => LoginPage()),
  //                   );
  //                   // Handle button press inside the dialog box
  //                   // addCatagoryController.addcat();
  //                   // Perform desired action with the entered category and other field
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius:
  //                     BorderRadius.circular(8.0), // Set the border radius
  //                   ),
  //                   backgroundColor:
  //                   const Color(0xFF4A7CC8), // Set the background color
  //                   minimumSize: Size(
  //                       120, 48), // Increase width and height of the button
  //                 ),
  //                 child: Text(
  //                   'Yes',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //
  // }


}
