import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:k1recipt/View/Add%20Employee/Addemployee.dart';
import 'package:k1recipt/View/Employee%20List/EmployeeList.dart';
import 'package:k1recipt/View/planStatistics/planStatistics.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/budgetListController/budgetListController.dart';
import 'package:k1recipt/controller/expenseController/deleteExpenseController.dart';
import 'package:k1recipt/controller/expenseController/expenseEditController.dart';
import 'package:k1recipt/controller/expenseController/listOfExpenseByBudgetId.dart';


class GeneralUserExpenseList extends StatefulWidget {
  GeneralUserExpenseList({Key? key}) : super(key: key);

  @override
  State<GeneralUserExpenseList> createState() => _GeneralUserExpenseListState();
}

class _GeneralUserExpenseListState extends State<GeneralUserExpenseList> {

  String selectedValue='';
  String selectedDropdownValue='';
  bool _isExpenseDeleted = false;


  List<CatIDName> allcat=[];
  List<String> cat_name=[];
  BudgetController allcatfromcontroller=Get.put(BudgetController());
  ExpenseGetListController allExpensebyCat=Get.put(ExpenseGetListController());
  EditExpenseController editExpenseController=Get.find();

  bool doesnotselect=true;

  @override
  void initState() {
    super.initState();
    allExpensebyCat.expenseList.clear();
    fetchallcat();
  }

  bool dropdownshow=false;
  fetchallcat() async {

    int num=0;
    int subnum=0;
    var all= await allcatfromcontroller.budgetList.obs;

    print("::::: ${all.value.length}");
    if(all.value.isEmpty==false){
      allcatfromcontroller.budgetList.forEach((element) {

        allcat.add(CatIDName(name: element.catName.toString(), id: element.catId.toString()));
        cat_name.add('${element.catName.toString()}');
        setState(() {
          dropdownshow=true;
        });
        num=num+1;
        print(":::::::::: ${element.catName} ${cat_name}");
        if(allcat.isNotEmpty){

         // allExpensebyCat.getlistOfExpense(allcat.first.id);
        }
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

  DeleteExpenseController deleteExpensebyCat=Get.put(DeleteExpenseController());

  @override
  Widget build(BuildContext context) {
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
                    "Expense Details",
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
                  width: MediaQuery.of(context).size.width,
                  height: 523.h,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,border: Border.all(color: Colors.grey,width: 0.8,),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            dropdownshow ==true ?
                            Padding(
                              padding: EdgeInsets.only(left: 1.sp, top: 7.sp),
                              child: Container(
                                width: 160.sp,
                                height: 36.sp,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    // Customize the color of the  border
                                    width: 0.8, // Customize the width of the border
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      5.sp), // Customize the border radius
                                ),
                                child: LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints constraints) {
                                    final containerWidth = constraints.maxWidth * 0.8; // Adjust the percentage as needed

                                    return DropdownButton<String>(
                                      value: selectedDropdownValue.isEmpty ? null : selectedDropdownValue,
                                      hint: selectedDropdownValue.isEmpty
                                          ? Container(
                                        width: containerWidth,
                                        child: Text(
                                          ' Select Category',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.mukta(
                                            textStyle: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                            ),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                          : SizedBox.shrink(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          doesnotselect = false;
                                        });
                                        if (newValue != 'Select Category') {
                                          setState(() {
                                            selectedDropdownValue = newValue!;
                                          });
                                          for (int i = 0; i < allcat.length; i++) {
                                            if (allcat[i].name == selectedDropdownValue) {
                                              print("kia howa tera wada $selectedDropdownValue :: ${allcat[i].name} ::: ${allcat[i].id}");
                                              allExpensebyCat.getlistOfExpense(allcat[i].id);
                                            }
                                          }
                                        }
                                      },
                                      items: cat_name.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            width: containerWidth,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(width: 1.w),
                                                Text(value),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                )
                              ),
                            ) : SizedBox(),
                            Spacer(),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 500.h,
                              //color: Colors.green,
                              child: Obx(() =>
                                  allExpensebyCat.expenseList.isEmpty
                                  ? doesnotselect ==true ?Center(child: Text("Please select Catagory"))  :Center( child:allExpensebyCat.loader==true? Text("No Expense found"): CircularProgressIndicator(),) :
                                    ListView.builder(
                                      itemCount: allExpensebyCat.expenseList.length,
                                      itemBuilder: (context,i){
                                        final budget = allExpensebyCat.expenseList[i];

                                        int a=allExpensebyCat.expenseList[i].budgetAmountPerYear;
                                        int b=allExpensebyCat.expenseList[i].expenseAmount;
                                        double c,d,e;
                                        c=(b/a);
                                        d=(b-a) *(-1.0);
                                        print("::::::::::: $a and $b ::: $c");

                                        return  SizedBox(
                                          height: 210.h,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              height: 384.h,
                                              width: 320.w,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10.sp),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.1),
                                                    blurRadius: 8.sp,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Budget Details',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.mukta(
                                                                textStyle: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),

                                                            GestureDetector(
                                                              onTap: (){
                                                                updatecat(context,allExpensebyCat.expenseList[i].expenseAmount.toString(),allExpensebyCat.expenseList[i].expenseDescription.toString(),allExpensebyCat.expenseList[i].expenseShopName.toString(),allExpensebyCat.expenseList[i].expenseId.toString());
                                                              },
                                                              child: Icon(Icons.edit,size: 19.sp,color: Colors.red,)
                                                            ),

                                                            // IconButton(
                                                            //   onPressed: () {
                                                            //     // Delete action
                                                            //   },
                                                            //   icon: Icon(Icons.edit,size: 15.sp,),
                                                            //   color: Colors.red,
                                                            // ),
                                                            IconButton(
                                                              onPressed: () {
                                                                // Delete action
                                                                delexpense(context,allExpensebyCat.expenseList[i].expenseId.toString());
                                                              },
                                                              icon: Icon(Icons.delete),
                                                              color: Colors.red,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Category Name',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${allExpensebyCat.expenseList[i].catName}',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 0),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Budget',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${allExpensebyCat.expenseList[i].budgetAmountPerYear}',
                                                                textAlign: TextAlign.left,
                                                                style: GoogleFonts.inter(
                                                                  textStyle: TextStyle(
                                                                      fontSize: 10,
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold
                                                                  ),
                                                                ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 0),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Expense',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '${allExpensebyCat.expenseList[i].expenseAmount}',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.red,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 0),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Remaining Budget',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              '$d',
                                                              textAlign: TextAlign.left,
                                                              style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors.green,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 10,
                                                      width: 500, // Adjust the width as needed
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(5),
                                                        child: LinearProgressIndicator(
                                                          value: c, // Adjust the value as needed
                                                          backgroundColor: Colors.green,
                                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

  delexpense(BuildContext context, expenseid) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                width: 390.w,
                height: 150.h,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      'Are you sure you want to delete?',
                      style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
                    ),
                    SizedBox(height: 10.h,),
                    ElevatedButton(
                      onPressed: () {
                        deleteExpensebyCat.deletecat(expenseid);
                        setState(() {
                          // Rebuild the widget tree
                        });
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: const Color(0xFF4A7CC8),
                        minimumSize: Size(120, 48),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  TextEditingController updateCategoryController = TextEditingController();
  TextEditingController updateAmountController = TextEditingController();
  TextEditingController updatedescriptionController = TextEditingController();
  TextEditingController updateshopnameController = TextEditingController();

  updatecat(context,String expense_amount,String expense_description,String expense_shop_name,String id) {
    print(":::::::::: $id");
    editExpenseController.expenseid.value=id;
    editExpenseController.expense_amount.value.text=expense_amount;
    editExpenseController.expense_description.value.text=expense_description;
    editExpenseController.expense_shop_name.value.text=expense_shop_name;
    updateAmountController.text=expense_amount;
    updatedescriptionController.text=expense_description;
    updateshopnameController.text=expense_shop_name;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 390.w,
            height: 330.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Text('Update Category',style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),),
                SizedBox(height: 16),
               TextField(
                   keyboardType:TextInputType.number,
                   //controller: editExpenseController.expense_amount.value,
                    controller: updateAmountController,
                   onChanged: editExpenseController.setexpense_amount,
                   decoration: InputDecoration(
                     hintText: 'Expense Amount',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue),
                       borderRadius: BorderRadius.circular(8.0),
                     ),
                   ),
                 ),


                // Text("Catagory Name: $catname", style: GoogleFonts.mukta(textStyle: TextStyle(
                //   fontSize: 14,
                //   color: Colors.black,
                //   fontWeight:
                //   FontWeight.bold,
                // ),),),
                SizedBox(height: 16),
           TextField(
                  controller: updatedescriptionController,
                  onChanged:editExpenseController.setexpense_description,
                  decoration: InputDecoration(
                    hintText: 'Expense description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),


                SizedBox(height: 16),
           TextField(
                  controller: updateshopnameController,
                   onChanged: editExpenseController.setexpense_shop_name,
                  decoration: InputDecoration(
                    hintText: 'Expense shop name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),


                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    editExpenseController.editexpense();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor:
                    const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(
                        120, 48), // Increase width and height of the button
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
