import 'dart:async';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/View/Employee%20List/EmployeeList.dart';
import 'package:k1recipt/View/Expense%20Analytics/expenseAnalytics.dart';
import 'package:k1recipt/View/planStatistics/planStatistics.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/expenseController/listOfExpenseByBudgetId.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Analytics extends StatefulWidget {
  Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //funtion();
    funtion2();
    // calculateexpense();
    fetchallcat();
  }

  List<Color> colorslist = [
    Color(0xffa93de8),
    Color(0xffd06426),
    Color(0xff8dabe1),
    Color(0xffe7aa4e),
    Color(0xff309c9f),
    Color(0xffc62323),
    Color(0xff3de840),
    Color(0xffe83d3d),
    Color(0xff2656d0),
    Color(0xffc4a01b),
    Color(0xff3962c9),
    Color(0xffeb4eaf),
    Color(0xff00a86b),
    Color(0xffd135d6),
    Color(0xff4a6ed9),
    Color(0xff55861e),
    Color(0xffe25d85),
    Color(0xff1e8a88),
    Color(0xffa6b434),
    Color(0xff3d1ae8)
  ];

  List val = [];
  List nameval = [];
  int val2 = 0;

  List<ChartData> chartdata = [];
  StreamController<ChartData> streamController = StreamController.broadcast();

  funtion2() async {
    bool iskanambta = await funtion();
    if (iskanambta == true) {
      print("lenght ::::::::: ${val.length}");

      for (int i = 0; i < val.length; i++) {
        double j, k, l;
        j = (val[i] / val2) * 100;

        chartdata.add(ChartData(nameval[i], j, colorslist[i]));
        streamController.add(ChartData(nameval[i], j, colorslist[i]));
      }
      //val2
    } else {}
  }

  Future<bool> funtion() async {
    budgetController.budgetList.forEach((element) {
      var a, b, c, d;
      a = element.catName;
      b = element.amountPerYear;
      c = element.expenseAmount;

      val2 = val2 + element.amountPerYear;
      val.add(b);
      nameval.add(element.catName);
      print("kuch alag krwa:::::::::::  ${a} $b $val2");
    });

    return budgetController.budgetList.length == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final pieChart = createPieChart();
    //final barChart = createBarChart();
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
                                  position:
                                      RelativeRect.fromLTRB(1000, 80, 0, 0),
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
                                      MaterialPageRoute(
                                          builder: (context) => AddEmployee()),
                                    );
                                  } else if (value == 'Employee List') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Employeelist()),
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
              Container(
                height: 25.h,
                width: 466.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.sp),
                  color: Color(0xff3461a6),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.sp, top: 2.sp),
                  child: Text(
                    "Expense Analytics",
                    style: GoogleFonts.mukta(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  width: 800,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Icon(
                      //         Icons.calendar_month,
                      //         color: Colors.black,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 300, // Set a fixed height for the PieChart
                      //   child: pieChart,
                      // ),
                      SizedBox(
                        height: 310.h,
                        child: StreamBuilder(
                            stream: streamController.stream,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              print("%%%%%%%%% $snapshot");
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return const Text(
                                    " null",
                                    style: TextStyle(color: Colors.white),
                                  );
                                case ConnectionState.waiting:
                                  return  Container(
                                    //color: Colors.blue,
                                    height: 290.h,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Welcome To",
                                            style: GoogleFonts.mukta(
                                              color: Colors.black,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/logo.png',
                                            width: ScreenUtil().setWidth(250),
                                            height: ScreenUtil().setHeight(130),
                                          ),

                                          Container(
                                            alignment: Alignment.center,
                                            width: 200.w,
                                            child: Text(
                                              "Add budget category & expenses to discover the analytics view",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.mukta(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          SvgPicture.asset(
                                            'assets/Groupbar.svg', // Replace with the path to your SVG file
                                            width: 100.w, // Set the desired width
                                            height: 100.h, // Set the desired height
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                case ConnectionState.active:
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : Container(
                                          // color: Colors.blue,
                                          //  height: 50.h,
                                          width: 250.w,
                                          child: pieChart
                                      );
                                case ConnectionState.done:
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : Container(
                                          width: 250.w,
                                          child: pieChart
                                        );
                                default:
                                  return const Text("default",
                                      style: TextStyle(color: Colors.white));
                              }
                            }),
                      ),

                      SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        // Set a reduced height for the BarChart
                        child: StreamBuilder(
                            stream: streamController1.stream,
                            initialData: allexpensecalculation,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              print("satttttthhhhhh ${snapshot.data}");
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  print("if null");
                                  return const Text(
                                    " null",
                                    style: TextStyle(color: Colors.white),
                                  );
                                case ConnectionState.waiting:
                                  print("if waiting");
                                  return  SizedBox();
                                case ConnectionState.active:
                                  print("if active");
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : createBarChart();
                                case ConnectionState.done:
                                  print("if donw");
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : createBarChart();
                                default:
                                  return const Text("default",
                                      style: TextStyle(color: Colors.white));
                              }
                            }),
                        // child: Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //   child: barChart,
                        // ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        //color: Colors.red,
                        height: 80,
                        child: StreamBuilder(
                            stream: streamController.stream,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              print("satttttthhhhhh ${snapshot.data}");
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return const Text(
                                    " null",
                                    style: TextStyle(color: Colors.white),
                                  );
                                case ConnectionState.waiting:
                                  return const SizedBox();
                                case ConnectionState.active:
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: chartdata.length,
                                        itemBuilder: (BuildContext context,i){
                                          return Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Text(
                                                    '${chartdata[i].category}',
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    height: 10,
                                                    width: 100, // Adjust the width as needed
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(0),
                                                      child: LinearProgressIndicator(
                                                        value:
                                                        0.0, // Adjust the value as needed
                                                        backgroundColor:
                                                        chartdata[i].color,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                case ConnectionState.done:
                                  return (snapshot.hasData == false)
                                      ? const CircularProgressIndicator()
                                      : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: chartdata.length,
                                      itemBuilder: (BuildContext context,i){
                                        return Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Text(
                                                  '${chartdata[i].category}',
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Align(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Container(
                                                  height: 10,
                                                  width:
                                                  100, // Adjust the width as needed
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(0),
                                                    child:
                                                    LinearProgressIndicator(
                                                      value:
                                                      0.0, // Adjust the value as needed
                                                      backgroundColor:
                                                      chartdata[i].color,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                default:
                                  return const Text("default",
                                      style:
                                          TextStyle(color: Colors.white));
                              }
                            }),
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Expanded(
                      //     child:
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         Container(
                      //           width: 100,
                      //           height: 60,
                      //           alignment: Alignment.center,
                      //           color: Color(0xff776ade),
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Text(
                      //               'Date',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(width: 5),
                      //         Container(
                      //           width: 100,
                      //           alignment: Alignment.centerLeft,
                      //           color: Color(0xff776ade),
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Text('Expense Reason',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(width: 5),
                      //         Container(
                      //           width: 100,
                      //           alignment: Alignment.centerLeft,
                      //           color: Color(0xff776ade),
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Text(
                      //               'Expense amount',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(width: 5),
                      //         Container(
                      //           width: 100,
                      //           height: 62,
                      //           alignment: Alignment.centerLeft,
                      //           color: Color(0xff776ade),
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Text(
                      //               'Sub category amount',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(width: 5),
                      //         Container(
                      //           width: 100,
                      //           alignment: Alignment.centerLeft,
                      //           color: Color(0xff776ade),
                      //           child: Padding(
                      //             padding: EdgeInsets.all(15.0),
                      //             child: Text(
                      //               'View Receipt',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExpenseAnalytics()),
                          );
                        },
                        child: Container(
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xff3461a6),
                          child: Center(child: Text("Detail Expense Analytics",style: GoogleFonts.mukta(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          )),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final BudgetController budgetController = Get.find();
  // List<Color> colorslist=[Color(0xffa93de8),Color(0xffd06426),Color(0xff8dabe1),Color(0xff3de840),Color(0xffe83d3d),Color(0xff2656d0)];

  Widget createPieChart() {
    final data = [
      ChartData(
          'Category 1', 20, Color(0xffe83d3d)), // Custom color for Category 1
      ChartData(
          'Category 2', 70, Color(0xff2656d0)), // Custom color for Category 2
      ChartData(
          'Category 3', 30, Color(0xff8dabe1)), // Custom color for Category 3
    ];

    final series = [
      charts.Series<ChartData, String>(
        id: 'PieChart',
        data: chartdata,
        domainFn: (ChartData chartData, _) => chartData.category,
        measureFn: (ChartData chartData, _) => chartData.value,
        colorFn: (ChartData chartData, _) =>
            charts.ColorUtil.fromDartColor(chartData.color), // Custom color
        labelAccessorFn: (ChartData chartData, _) =>
            '${chartData.category}: ${chartData.value}',
      ),
    ];

    return charts.PieChart(
      series,
      animate: true,
    );
  }

  // Widget createBarChart() {
  //
  //   final series = [
  //     charts.Series<ChartData, String>(
  //       id: 'BarChart',
  //       data: chartdata,
  //       domainFn: (ChartData chartData, _) => chartData.category,
  //       measureFn: (ChartData chartData, _) => chartData.value,
  //       colorFn: (ChartData chartData, _) => charts.ColorUtil.fromDartColor(chartData.color), // Custom color
  //     ),
  //   ];
  //
  //   return charts.BarChart(
  //     series,
  //     animate: true,
  //     defaultRenderer: charts.BarRendererConfig(
  //       cornerStrategy: const charts.ConstCornerStrategy(30), // Curved border
  //     ),
  //   );
  // }

  Widget createBarChart() {
    print("bottle ........ ${allexpensecalculation.length}");
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: <ChartSeries>[
        ColumnSeries<ExpenseData, String>(
          dataSource: allexpensecalculation,
          xValueMapper: (ExpenseData expenseData, _) => expenseData.expensename,
          yValueMapper: (ExpenseData expenseData, _) =>
              expenseData.expenseAmount,
          //color: (ExpenseData expenseData, _) => expenseData.color,
        ),
      ],
      // title: ChartTitle(text: 'Expense Bar Chart'),
    );
  }

  // Widget createBarChart() {
  //   // final List<ChartData> data = [
  //   //   ChartData('A1', 4, Color(0xffa93de8)),
  //   //   ChartData('A2', 3, Color(0xffd06426)),
  //   //   ChartData('A3', 2, Color(0xff8dabe1)),
  //   //   ChartData('A4', 1, Color(0xff8dabe1)),
  //   //   ChartData('A5', 1, Color(0xff8dabe1)),
  //   //   ChartData('A6', 1, Color(0xff8dabe1)),
  //   //   ChartData('A7', 1, Color(0xff8dabe1)),
  //   //   ChartData('A8', 1, Color(0xff8dabe1)),
  //   //   ChartData('A9', 1, Color(0xff8dabe1)),
  //   // ];
  //
  //   final double total = chartdata.fold(0, (sum, chartData) => sum + chartData.value);
  //   return SfCartesianChart(
  //     primaryXAxis: CategoryAxis(),
  //     primaryYAxis: NumericAxis(),
  //     series: <ChartSeries>[
  //       ColumnSeries<ChartData, String>(
  //         dataSource: chartdata,
  //         xValueMapper: (ChartData chartData, _) => chartData.category,
  //         yValueMapper: (ChartData chartData, _) => chartData.value,
  //         name: 'Individual Values',
  //       ),
  //       ColumnSeries<ChartData, String>(
  //         dataSource: [
  //           ChartData('Total', total, Color(0xff8dabe1)),
  //         ],
  //         xValueMapper: (ChartData chartData, _) => chartData.category,
  //         yValueMapper: (ChartData chartData, _) => chartData.value,
  //         name: 'Total',
  //         color: Colors.red,
  //       ),
  //     ],
  //   //  title: ChartTitle(text: 'Bar Chart'),
  //   );
  // }

  BudgetController allcatfromcontroller = Get.put(BudgetController());
  ExpenseGetListController allExpensebyCat =
      Get.put(ExpenseGetListController());
  List<CatIDName> allcat = [];
  List<String> cat_name = [];
  bool dropdownshow = false;

  List<ExpenseData> allexpensecalculation = [];
  StreamController<ExpenseData> streamController1 =
      StreamController.broadcast();

  calculateexpense() async {
    allcatfromcontroller.fetchBudgetList();

    var all = await allcatfromcontroller.budgetList.obs;

    if (all.value.isEmpty == false) {
      fetchbudgetcat().then((value) {
        print("fetchall cat ...... ${all.value.length} ");

        for (int i = 0; i < allcat.length; i++) {
          print(
              "allExpensebyCat.getlistOfExpense(allcat[i].id) ${allcat[i].id}");
          allExpensebyCat.getlistOfExpense(allcat[i].id);
        }
      });
    }

    fetchallcat().then((value) {
      print("tmmmmmmmmmtmmmmttmmmmm ${allExpensebyCat.expenseList.length}");

      for (int i = 0; i < allExpensebyCat.expenseList.length; i++) {
        var a = allExpensebyCat.expenseList[i];
        print("tmmmmmmmmmtmmmmttmmmmm ${a.expenseAmount}");

        allexpensecalculation.add(ExpenseData(
            a.expenseShopName,
            a.budgetAmountPerYear.toDouble(),
            a.expenseAmount.toDouble(),
            colorslist[i]));
        streamController1.add(ExpenseData(
            a.expenseShopName,
            a.budgetAmountPerYear.toDouble(),
            a.expenseAmount.toDouble(),
            colorslist[i]));
      }
      streamController1.stream;
    });
  }

  Future fetchallcat() async {
    int num = 0;
    int subnum = 0;

    allcatfromcontroller.fetchBudgetList();

    var all = await allcatfromcontroller.budgetList.obs;

    if (all.value.isEmpty == false) {
      fetchbudgetcat().then((value) {
        print("fetchall cat ...... ${all.value.length} ");

        for (int i = 0; i < allcat.length; i++) {
          print(
              "allExpensebyCat.getlistOfExpense(allcat[i].id) ${allcat[i].id}");
          allExpensebyCat.getlistOfExpense(allcat[i].id);
        }
        print(" ${allExpensebyCat.expenseList.length}");
      }).then((value) {
        Future.delayed(const Duration(milliseconds: 3000), () {

          // Here you can write your code
          print("tmmmmmmmmmtmmmmttmmmmm ${allExpensebyCat.expenseList.length}");
          for (int i = 0; i < allExpensebyCat.expenseList.length; i++) {
            var a = allExpensebyCat.expenseList[i];
            print("tmmmmmmmmmtmmmmttmmmmm ${a.expenseAmount}");
            allexpensecalculation.add(ExpenseData(
                a.expenseShopName,
                a.budgetAmountPerYear.toDouble(),
                a.expenseAmount.toDouble(),
                colorslist[i]));
            streamController1.add(ExpenseData(
                a.expenseShopName,
                a.budgetAmountPerYear.toDouble(),
                a.expenseAmount.toDouble(),
                colorslist[i]));
          }
          streamController1.stream;

        });

      });
    }
  }

  Future fetchbudgetcat() async {
    int num = 0;
    allcatfromcontroller.budgetList.forEach((element) {
      allcat.add(CatIDName(
          name: element.catName.toString(), id: element.catId.toString()));
      cat_name.add('${element.catName.toString()}');
      setState(() {
        dropdownshow = true;
      });
      num = num + 1;
      print("fetchbudgetcat:::::::::: ${element.catName} ${cat_name}");
      if (allcat.isNotEmpty) {}
      // if(allcatfromcontroller.budgetList.length==num){
      //   // for(int i=0;i<=allcat.length;i++){
      //   //
      //   //   getlistsubCatagory.getlistOfSubCat(allcat[i].id);
      //   //
      //   // }
      // }
    });
  }

}

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}

class ExpenseData {
  final String expensename;
  final double budgetAmountPerYear;
  final double expenseAmount;
  final Color color;

  ExpenseData(
    this.expensename,
    this.budgetAmountPerYear,
    this.expenseAmount,
    this.color,
  );
}
