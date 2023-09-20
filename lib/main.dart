import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k1recipt/View/Expense%20Analytics/expenseAnalytics.dart';
import 'package:k1recipt/View/changePassword/changePassword.dart';
import 'package:k1recipt/View/paymentmethod/paymentMethod.dart';
import 'package:k1recipt/View/planSelection/planSelection.dart';
import 'package:k1recipt/controller/addCatagory/catagoryCreateWithBudget.dart';
import 'package:k1recipt/controller/addCatagory/editCatagoryWithBudget.dart';
import 'package:k1recipt/controller/addSubCat/delSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/editSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';
import 'package:k1recipt/controller/addemployeecontroller/AddEmployeeController.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/changePassword/changePassword.dart';
import 'package:k1recipt/controller/login/loginController.dart';
import 'package:k1recipt/controller/promocodeController/promocodeController.dart';

import 'View/BottomAnimatedBar/bottomAnimatedBar.dart';
import 'View/Promo Code/Promocode.dart';
import 'View/expenseDetails/expenseDetails.dart';
import 'View/login page/LoginPage.dart';
import 'controller/ expenseAnalyticsController/detailExpenseAnalytics.dart';
import 'controller/addSubCat/addSubCat.dart';
import 'controller/employee_registration/employee_registration.dart';
import 'controller/forgetpasswordController/resetPasswordStepOne.dart';
import 'controller/getListPlanController/getListPlanController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  init();
  runApp(const MyApp());

}

Future<void> init() async {
  Get.put(LoginController());
  Get.put(EmployeeRegistrationController());
  Get.put(PlanController());
  Get.put(ResetPasswordStepOneController());
  Get.put(EditCatWithBudget());
  Get.put(EditSubCatWithBudget());
  Get.put(ChangePasswordController());
  Get.put(UserMonthlyExpenseController());
    // Get.put(BudgetController());
    // Get.put(AddCatagoryController());
    // Get.put(GetListSubCatController());
    // Get.put(SubCatagoryAddController());
  Get.put(PromoCodeController());
  // Get.put(AddEmployeeController());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.signOut();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  GetMaterialApp(
            // routes: const {
            //
            // },
            debugShowCheckedModeBanner: false,
            title: 'Srp.Ai',
            //home: ExpenseAnalytics(),
            home: LoginPage(),
            // home: Paymentmethod(amount: '3.99', planid: '3',),
            // home: Paymentmethod(),
            // home: PlanSelection(mobile: "90",password: "123456",),
            // home: ExpenseDetails(),
            // home: BottomAnimatedBar(),
            // home: PlanSelection(),
            // home: PlanStatistics(),
            // home: UserProfile()
          );
        }
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/paypal.jpeg'),
          Row(
            children: [
              Text("Login",style: TextStyle(),)
            ],
          )
        ],
      ),
    );
  }

}


