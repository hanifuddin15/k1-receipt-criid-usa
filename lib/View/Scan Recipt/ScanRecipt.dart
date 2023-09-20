import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/View/Employee%20List/EmployeeList.dart';
import 'package:k1recipt/View/changePassword/changePassword.dart';
import 'package:k1recipt/View/login%20page/LoginPage.dart';
import 'package:k1recipt/View/planSelection/planSelection.dart';
import 'package:k1recipt/View/userProfile/userProfile.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/UserInfoController/edituserInfoController.dart';
import 'package:k1recipt/controller/UserInfoController/userInfoController.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addSubCat/addSubCat.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/addemployeecontroller/AddEmployeeController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/employeeListController/employeeListContoller.dart';
import 'package:k1recipt/controller/employee_registration/employee_registration.dart';
import 'package:k1recipt/controller/login/loginController.dart';
import 'package:k1recipt/controller/promocodeController/promocodeController.dart';
import 'package:k1recipt/controller/usageInformation/userUsageInfoController.dart';
import 'package:k1recipt/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NavigationIcon {
  final IconData icon;
  final String title;
  final Color color;
  final bool isBig; // New property to indicate if the icon should appear bigger

  NavigationIcon(
      {required this.icon,
        required this.title,
        required this.color,
        this.isBig = false});
}

class ScanRecipt extends StatefulWidget {
  const ScanRecipt({Key? key}) : super(key: key);

  @override
  State<ScanRecipt> createState() => _ScanReciptState();
}

class _ScanReciptState extends State<ScanRecipt> {
  // bool onScrollNotification(ScrollNotification notification) {

  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  TextEditingController d=TextEditingController();

  UserInfoProfileController userInfoProfileController= Get.find();
  EditUserInfoController editUserInfoController =Get.find();

  ImagePicker picker = ImagePicker();
  PickedFile? pickedImage;

  Future<void> openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      pickedImage = pickedFile;
    });
  }

  void logout() {
    // Clear all data and perform logout operations

    // Reinitialize the login controller
    // Get.put(BudgetController());
    // Get.put(EmployeeRegistrationController());
    // Get.put(AddCatagoryController());
    // Get.put(GetListSubCatController());
    // Get.put(SubCatagoryAddController());
    // Get.put(PromoCodeController());
    // Get.put(AddEmployeeController());
    // Get.put(EmployeeListController());
    //Get.delete<LoginController>();
    Get.put(LoginController());
    Get.lazyPut(()=>LoginController());

    BudgetController budgetController= Get.put(BudgetController());
    EmployeeRegistrationController employeeRegistrationController=Get.put(EmployeeRegistrationController());
    AddCatagoryController addCatagoryController=Get.put(AddCatagoryController());
    GetListSubCatController getListSubCatController= Get.put(GetListSubCatController());
    SubCatagoryAddController subCatagoryAddController= Get.put(SubCatagoryAddController());
    PromoCodeController promoCodeController= Get.put(PromoCodeController());
    AddEmployeeController addEmployeeController= Get.put(AddEmployeeController());
    EmployeeListController employeeListController=Get.put(EmployeeListController());

    EditUserInfoController editUserInfoController=Get.put(EditUserInfoController());
    UserInfoProfileController userInfoProfileController=Get.put(UserInfoProfileController());
    UserUsageInfoController userUsageInfoController=Get.put(UserUsageInfoController());
    // YourApiController().clearData();
    budgetController.budgetList.clear();
    getListSubCatController.subcatList.clear();
    employeeListController.budgetList.clear();

    editUserInfoController.onClose();
    userInfoProfileController.userinfoProfile.clear();
    userUsageInfoController.onClose();

      WidgetsFlutterBinding.ensureInitialized();
      init();
      // runApp(const MyApp());

      Get.offAll(() => LoginPage());
      //Get.offAllNamed(LoginPage();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //userInfoProfileController.userinfoProfile.clear();
    // userInfoProfileController.myTextEditingController1.value.text='';
    // userInfoProfileController.myTextEditingController2.value.text='';
    // userInfoProfileController.myTextEditingController3.value.text='';
    // userInfoProfileController.myTextEditingController4.value.text='';
    Get.put(UserInfoProfileController());
    userInfoProfileController.fetchUserinfoProfile().then((value) {
      userInfoProfileController.userinfoProfile;
      userInfoProfileController.myTextEditingController1.value.text=userInfoProfileController.userinfoProfile.first.businessName;
      userInfoProfileController.myTextEditingController2.value.text=userInfoProfileController.userinfoProfile.first.productOrservices;
      userInfoProfileController.myTextEditingController3.value.text=userInfoProfileController.userinfoProfile.first.lineOfBusiness;
      userInfoProfileController.myTextEditingController4.value.text=userInfoProfileController.userinfoProfile.first.corporationType;

      print(":::::::: usage");
    });
  }

  @override
  Widget build(BuildContext context) {

    userInfoProfileController.userinfoProfile.value.isNotEmpty ? a.text= userInfoProfileController.userinfoProfile.first.businessName:null;
    userInfoProfileController.userinfoProfile.value.isNotEmpty ? b.text= userInfoProfileController.userinfoProfile.first.productOrservices:null;
    userInfoProfileController.userinfoProfile.value.isNotEmpty ? c.text= userInfoProfileController.userinfoProfile.first.lineOfBusiness:null;
    userInfoProfileController.userinfoProfile.value.isNotEmpty ? d.text= userInfoProfileController.userinfoProfile.first.corporationType:null;
    //userInfoProfileController.userinfoProfile.value.isNotEmpty ? print(userInfoProfileController.userinfoProfile.first.email):null;


     editUserInfoController.business_name.value=a.text;
     editUserInfoController.productOrservices.value=b.text;
     editUserInfoController.line_of_business.value =c.text;
     editUserInfoController.corporation_type.value =d.text;


    return SafeArea(
        child: Scaffold(
          appBar: usertype == 'General_User'
              ? null
              : AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'K-1 Receipts',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              usertype == 'Employee'
                  ? SizedBox()
                  : Row(
                children: [
                  Text(
                    '$g_name',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    maxLines: 2,
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black),
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(1000, 80, 0, 0),
                        items: [
                          PopupMenuItem<String>(
                            value: 'Add Employee',
                            child: Text('Add Employee'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Employee List',
                            child: Text('Employee List'),
                          ),
                        ],
                      ).then((value) {
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
                      });
                    },
                  ),
                ],
              ),
              SizedBox(width: 10.w),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 1.0),
                      child: SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                              splashColor: Color(0xc1081c3b), // splash color
                              onTap: () {
                                logout();
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.logout), // first icon
                                  Text("Logout",style: TextStyle(fontSize: 13),textAlign: TextAlign.center,), // first text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 230.0, top: 2.0,),
                      child: SizedBox.fromSize(
                        size: Size(66, 66), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                              splashColor: Color(0xc1081c3b), // splash color
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChangePassword()),
                                );
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.lock_reset), // second icon
                                  Text("Password Change",style: TextStyle(fontSize: 13),textAlign: TextAlign.center,), // second text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: GestureDetector(
                              onTap: openCamera, // Call the openCamera method when the image is tapped
                              child: pickedImage != null
                                  ? Image.file(
                                File(pickedImage!.path),
                                height: 99,
                                width: 99,
                                fit: BoxFit.fill,
                              )
                                  : Image.asset(
                                "assets/profilepic.jpg",
                                height: 99,
                                width: 99,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "$g_name",
                                    style: TextStyle(
                                      color: Color(0xff1E1C1C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset(
                                    "assets/Group 91.svg",
                                    height: 13,
                                    width: 15,
                                  ),
                                ],
                              ),
                              Text(
                                "$g_email",
                                style: TextStyle(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Cell: $user_id",
                                style: TextStyle(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "United States",
                                style: TextStyle(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UserProfile()),
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Color(0xff0D8F29),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Statistics",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlanSelection(
                                            mobile: "$d_id",
                                            password: "$d_id",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Color(0xff081C3B),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Update Plan",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Container(
                        height: 346.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF0FDF6),
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            Text(
                              "Your Info",
                              style: GoogleFonts.mukta(
                                  color: Color(0xff1E1C1C),
                                  fontSize: 18.0.sp,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bussiness Name',
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
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child:
                                    Obx(
                                          () =>
                                    TextFormField(
                                      controller: userInfoProfileController.myTextEditingController1.value,
                                      // controller: a.text.isEmpty ? a : a,
                                      onChanged: editUserInfoController.setbusiness_name,
                                      style: GoogleFonts.mukta(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Enter Bussiness Name',
                                      ),
                                    ),)
                                    ),
                                  ),

                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Products & Services',
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
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child:  Obx(
                                          () => TextFormField(
                                        controller: userInfoProfileController.myTextEditingController2.value,
                                        onChanged: editUserInfoController.setproductOrservices,

                                        style: GoogleFonts.mukta(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Enter Products & Services',
                                        ),
                                      ),)
                                    ),
                                  ),

                              ],
                            ),
                            SizedBox(height: 7),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Services',
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
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Obx(
                                          () => TextFormField(
                                      controller: userInfoProfileController.myTextEditingController3.value,
                                      onChanged: editUserInfoController.setline_of_business,
                                      style: GoogleFonts.mukta(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      decoration: InputDecoration(
                                      //  labelText: 'XXXXXX',
                                          hintText: 'Enter Services',
                                      ),
                                    ),
                                  ),
                                ),
                                )
                              ],
                            ),
                            SizedBox(height: 7),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Corporate Type',
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
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Obx(
                                          () => TextFormField(
                                        controller: userInfoProfileController.myTextEditingController4.value,
                                      onChanged: editUserInfoController.setcorporation_type,

                                      style: GoogleFonts.mukta(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      decoration: InputDecoration(
                                        // labelText: 'LLC',
                                        hintText:'Enter Corporate Type'
                                      ),
                                    ),
                                  ),
                                )
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            MaterialButton(
                              onPressed: () {

                                // userInfoProfileController.userinfoProfile.value.isNotEmpty ? a.text= userInfoProfileController.userinfoProfile.first.businessName:null;
                                // userInfoProfileController.userinfoProfile.value.isNotEmpty ? b.text= userInfoProfileController.userinfoProfile.first.productOrservices:null;
                                // userInfoProfileController.userinfoProfile.value.isNotEmpty ? c.text= userInfoProfileController.userinfoProfile.first.lineOfBusiness:null;
                                // userInfoProfileController.userinfoProfile.value.isNotEmpty ? d.text= userInfoProfileController.userinfoProfile.first.corporationType:null;
                                // //userInfoProfileController.userinfoProfile.value.isNotEmpty ? print(userInfoProfileController.userinfoProfile.first.email):null;
                                //
                                //
                                // editUserInfoController.business_name.value=a.text;
                                // editUserInfoController.productOrservices.value=b.text;
                                // editUserInfoController.line_of_business.value =c.text;
                                // editUserInfoController.corporation_type.value =d.text;
                                if(a.text==editUserInfoController.business_name.value && b.text== editUserInfoController.productOrservices.value){
                                  editUserInfoController.business_name.value=a.text;
                                  editUserInfoController.productOrservices.value=b.text;
                                }
                                else if(a.text==editUserInfoController.business_name.value){

                                  editUserInfoController.business_name.value=a.text;
                                }
                                else if(b.text== editUserInfoController.productOrservices.value){
                                  editUserInfoController.productOrservices.value=b.text;
                                }else{}


                                // userInfoProfileController.myTextEditingController3.value,
                                // onChanged: editUserInfoController.setline_of_business,

                                if(userInfoProfileController.myTextEditingController3.value.text !=editUserInfoController.line_of_business.value){
                                  editUserInfoController.line_of_business.value= userInfoProfileController.myTextEditingController3.value.text;
                                }
                                // controller: userInfoProfileController.myTextEditingController2.value,
                                // onChanged: editUserInfoController.setproductOrservices,

                                if(userInfoProfileController.myTextEditingController2.value.text!=editUserInfoController.productOrservices.value){
                                  editUserInfoController.productOrservices.value=userInfoProfileController.myTextEditingController2.value.text;
                                }

                                print("${editUserInfoController.business_name.value}:::::: ${editUserInfoController.productOrservices.value}::::::: ${editUserInfoController.line_of_business.value}:::::::: ${editUserInfoController.corporation_type.value}");
                                editUserInfoController.editUserInfo();
                              },
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 170.h,)
              ],
            ),
          ),
        ));
  }


  // @override
  // Widget build(BuildContext context) {
  //   userInfoProfileController.userinfoProfile.value.isNotEmpty ? a.text= userInfoProfileController.userinfoProfile.first.businessName:null;
  //   userInfoProfileController.userinfoProfile.value.isNotEmpty ? b.text= userInfoProfileController.userinfoProfile.first.productOrservices:null;
  //   userInfoProfileController.userinfoProfile.value.isNotEmpty ? c.text= userInfoProfileController.userinfoProfile.first.lineOfBusiness:null;
  //   userInfoProfileController.userinfoProfile.value.isNotEmpty ? d.text= userInfoProfileController.userinfoProfile.first.corporationType:null;
  //   userInfoProfileController.userinfoProfile.value.isNotEmpty ? print(userInfoProfileController.userinfoProfile.first.email):null;
  //
  //
  //   return SafeArea(
  //       child: Scaffold(
  //         body: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.only(left: 8.0.sp,top: 4.sp),
  //                     child: SizedBox.fromSize(
  //                       size: Size(56, 56), // button width and height
  //                       child: ClipOval(
  //                         child: Material(
  //                           color: Colors.transparent, // button color
  //                           child: InkWell(
  //                             splashColor: Color(0xc1081c3b), // splash color
  //                             onTap: () {
  //                               logout();
  //                             }, // button pressed
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: <Widget>[
  //                                 Icon(Icons.logout), // icon
  //                                 Text("Logout"), // text
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Spacer(),
  //                   Padding(
  //                     padding:  EdgeInsets.symmetric(horizontal: 12.0.sp),
  //                     child: SvgPicture.asset(
  //                       "assets/Group 71.svg",
  //                       height: 20.h,
  //                       width: 20.w,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.all(12.0.sp),
  //                 child: Column(
  //                   children: [
  //
  //                     Row(
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius: BorderRadius.circular(50.0.sp),
  //                           child: Image.asset(
  //                             "assets/profilepic.jpg",
  //                             height: 99.sp,
  //                             width: 99.sp,
  //                             fit: BoxFit.fill,
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 21.w,
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 Text(
  //                                   "$g_name",
  //                                   style: GoogleFonts.mukta(
  //                                       color: Color(0xff1E1C1C),
  //                                       fontSize: 18.0.sp,
  //                                       fontWeight: FontWeight.w500),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 6.w,
  //                                 ),
  //                                 SvgPicture.asset(
  //                                   "assets/Group 91.svg",
  //                                   height: 13.h,
  //                                   width: 15.w,
  //                                 ),
  //                               ],
  //                             ),
  //                             Text(
  //                               "$g_email",
  //                               style: GoogleFonts.mukta(
  //                                   color: Color(0xff1E1C1C),
  //                                   fontSize: 12.0.sp,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                             Text(
  //                               "Cell: $user_id",
  //                               style: GoogleFonts.mukta(
  //                                   color: Color(0xff1E1C1C),
  //                                   fontSize: 12.0.sp,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                             Text(
  //                               "United States",
  //                               style: GoogleFonts.mukta(
  //                                   color: Color(0xff1E1C1C),
  //                                   fontSize: 12.0.sp,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                             Row(
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: (){
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(builder: (context) => const UserProfile()),
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 25.h,
  //                                     width: 80.w,
  //                                     decoration: BoxDecoration(
  //                                         borderRadius: BorderRadius.circular(24.sp),
  //                                         color: Color(0xff0D8F29)),
  //                                     child: Center(
  //                                         child: Text(
  //                                           "Statistics",
  //                                           style: GoogleFonts.mukta(
  //                                               color: Colors.white,
  //                                               fontSize: 12.sp,
  //                                               fontWeight: FontWeight.w500),
  //                                         )),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 17.w,
  //                                 ),
  //                                 GestureDetector(
  //                                   onTap: (){
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute(builder: (context) => const UserProfile()),
  //                                     );
  //                                   },
  //                                   child: Container(
  //                                     height: 25.h,
  //                                     width: 80.w,
  //                                     decoration: BoxDecoration(
  //                                         borderRadius: BorderRadius.circular(24.sp),
  //                                         color: Color(0xff081C3B)),
  //                                     child: Center(
  //                                         child: Text(
  //                                           "Update Plan",
  //                                           style: GoogleFonts.mukta(
  //                                               color: Colors.white,
  //                                               fontSize: 12.sp,
  //                                               fontWeight: FontWeight.w500),
  //                                         )),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(
  //                       height: 64.h,
  //                     ),
  //                     Container(
  //                       height: 374.h,
  //                       width: 350.w,
  //                       decoration: BoxDecoration(
  //                           color: Color(0xffF0FDF6),
  //                           borderRadius: BorderRadius.circular(10.sp),
  //                           border: Border.all(color: Color(0xff95DCCB), width: 1.sp)),
  //                       child: Column(
  //                         children: [
  //                           SizedBox(
  //                             height: 19.h,
  //                           ),
  //                           Text(
  //                             "Your Info",
  //                             style: GoogleFonts.mukta(
  //                                 color: Color(0xff1E1C1C),
  //                                 fontSize: 18.0.sp,
  //                                 decoration: TextDecoration.underline,
  //                                 fontWeight: FontWeight.w600),
  //                           ),
  //                           SizedBox(height: 10),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Bussiness Name',
  //                                 textAlign: TextAlign.left,
  //                                 style: GoogleFonts.mukta(
  //                                   textStyle: TextStyle(
  //                                     fontSize: 14,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 10),
  //                               Container(
  //                                 height: 35,
  //                                 width: 350,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(30),
  //                                   border: Border.all(color: Colors.black),
  //                                 ),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: TextFormField(
  //                                     style: GoogleFonts.mukta(
  //                                       textStyle: TextStyle(
  //                                         fontSize: 12,
  //                                         color: Colors.grey,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     decoration: InputDecoration(
  //                                       hintText: '10 Minute School',
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //
  //                             ],
  //                           ),
  //                           SizedBox(height: 10),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Products & Services',
  //                                 textAlign: TextAlign.left,
  //                                 style: GoogleFonts.mukta(
  //                                   textStyle: TextStyle(
  //                                     fontSize: 14,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 5),
  //                               Container(
  //                                 height: 35,
  //                                 width: 350,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(30),
  //                                   border: Border.all(color: Colors.black),
  //                                 ),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: TextFormField(
  //                                     style: GoogleFonts.mukta(
  //                                       textStyle: TextStyle(
  //                                         fontSize: 12,
  //                                         color: Colors.grey,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     decoration: InputDecoration(
  //                                       hintText: 'Services',
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           SizedBox(height: 7),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Line of Business / Industry ',
  //                                 textAlign: TextAlign.left,
  //                                 style: GoogleFonts.mukta(
  //                                   textStyle: TextStyle(
  //                                     fontSize: 14,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 7),
  //                               Container(
  //                                 height: 35,
  //                                 width: 350,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(30),
  //                                   border: Border.all(color: Colors.black),
  //                                 ),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: TextFormField(
  //                                     style: GoogleFonts.mukta(
  //                                       textStyle: TextStyle(
  //                                         fontSize: 12,
  //                                         color: Colors.grey,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     decoration: InputDecoration(
  //                                       labelText: 'XXXXXX',
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //
  //                             ],
  //                           ),
  //                           SizedBox(height: 7),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Corporate Type',
  //                                 textAlign: TextAlign.left,
  //                                 style: GoogleFonts.mukta(
  //                                   textStyle: TextStyle(
  //                                     fontSize: 14,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 7),
  //                               Container(
  //                                 height: 35,
  //                                 width: 350,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(30),
  //                                   border: Border.all(color: Colors.black),
  //                                 ),
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 16),
  //                                   child: TextFormField(
  //                                     style: GoogleFonts.mukta(
  //                                       textStyle: TextStyle(
  //                                         fontSize: 12,
  //                                         color: Colors.grey,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     decoration: InputDecoration(
  //                                       labelText: 'LLC',
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //
  //                             ],
  //                           ),
  //
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}


