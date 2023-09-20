import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:k1recipt/constants/global.dart';
import 'package:k1recipt/controller/addSubCat/addSubCat.dart';
import 'package:k1recipt/controller/addSubCat/checkSubCatReaming.dart';
import 'package:k1recipt/controller/addSubCat/delSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/editSubCatController.dart';
import 'package:k1recipt/controller/addSubCat/getListSubCatController.dart';

class VehicleBudget extends StatefulWidget {
  VehicleBudget({Key? key,required this.cat_id,required this.catname}) : super(key: key);
  String cat_id;
  String catname;
  @override
  State<VehicleBudget> createState() => _VehicleBudgetState();
}

class _VehicleBudgetState extends State<VehicleBudget> {
  // SubCatagoryAddController subCatagoryAddController=Get.find();


  //GetListSubCatController getlistsubCatagory = Get.find();
  GetListSubCatController getlistsubCatagory =Get.put(GetListSubCatController());
  //SubCatagoryAddController subCatagoryAddController = Get.find();
  SubCatagoryAddController subCatagoryAddController = Get.put(SubCatagoryAddController());

  //DeleteSubCatController deleteSubCatController = Get.find();
  DeleteSubCatController deleteSubCatController =Get.put(DeleteSubCatController());


  //CheckSubCatReamingController checkSubCatReamingController = Get.find();
  CheckSubCatReamingController checkSubCatReamingController = Get.put(CheckSubCatReamingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("sub cat name ${widget.cat_id}");
    Get.put(GetListSubCatController());
    //getlistsubCatagory.cat_id =widget.cat_id  ;
    getlistsubCatagory.getlistOfSubCat(widget.cat_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            SizedBox(width: 4),
            Text(
              '${widget.catname}',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){

              // checkSubCatReamingController.getReamingSubCat(widget.cat_id)
              //     .then((value) {
              //   print("::::: ${checkSubCatReamingController.reaming.value}");
              //   checkSubCatReamingController.reaming.value==true ?
              //   Get.snackbar(
              //     'Upgrade your plan',
              //     'You cannot create new sub catagory.',
              //     backgroundColor: Colors.red,
              //     colorText: Colors.white,
              //   ) : showDialogMethod(context);
              // });


              showDialogMethod(context);
            },
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Color(0xff8278d6),
                  ),
                  onPressed: () {},
                ),
                Text(
                  'New Sub category',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff8278d6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sub Category Name',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Amount',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                //color: Colors.purpleAccent,
                height: 600.h,
                child: Obx(()=>
                  getlistsubCatagory.subcatList.isEmpty
                      ? getlistsubCatagory.loader.value==true ? Center(child: Text("No Sub Catagory found")):
                          Center(child: CircularProgressIndicator(),) :
                          ListView.builder(
                              itemCount: getlistsubCatagory.subcatList.length,
                              itemBuilder: (context,i){
                                final budget = getlistsubCatagory.subcatList[i];
                                return   Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Slidable(
                                    key:  ValueKey(0),
                                    endActionPane:  ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed:(BuildContext context){
                                            delcat(context,budget.subcatId.toString(),budget.budgetId.toString());
                                          },
                                          backgroundColor: Color(0xFFF09EC4),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                        SlidableAction(
                                          onPressed:(BuildContext context){
                                            doNothing(context,'${d_id}','${widget.cat_id}',
                                              '${budget.subcatId}','${budget.subcatName}',
                                              '${budget.amountPerYear}',);
                                          },
                                          backgroundColor: Color(0xFFA8D6FA),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Edit',
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      elevation: 4.0,
                                      child:
                                      Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child:
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.9,
                                          child: ListTile(
                                            title: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${getlistsubCatagory.subcatList[i].subcatName}',
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Text(
                                                  '\$${getlistsubCatagory.subcatList[i].amountPerYear}',
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ),
                                    ),),);}),),),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Slidable(
              //     key: const ValueKey(0),
              //     endActionPane: const ActionPane(
              //       motion: ScrollMotion(),
              //       children: [
              //         SlidableAction(
              //           onPressed: doNothing,
              //           backgroundColor: Color(0xFFF09EC4),
              //           foregroundColor: Colors.white,
              //           icon: Icons.delete,
              //           label: 'Delete',
              //         ),
              //         SlidableAction(
              //           onPressed: doNothing,
              //           backgroundColor: Color(0xFFA8D6FA),
              //           foregroundColor: Colors.white,
              //           icon: Icons.edit,
              //           label: 'Edit',
              //         ),
              //       ],
              //     ),
              //
              //     child: Card(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       elevation: 4.0,
              //       child:
              //       Padding(
              //         padding: EdgeInsets.all(7.0),
              //         child: Container(
              //           width: MediaQuery.of(context).size.width * 0.9,
              //           child: ListTile(
              //             title: Align(
              //               alignment: Alignment.centerRight,
              //               child: Text(
              //                 '200\$',
              //                 style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              //                 textAlign: TextAlign.right,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],),],),);}

  void showDialogMethod(BuildContext context) {

    TextEditingController _categoryController = TextEditingController();
    TextEditingController _otherFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 400,
            height: 400,
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
                Text(
                  'Add Sub Category',
                  style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: subCatagoryAddController.setsubcat_name,
                  decoration: InputDecoration(
                    hintText: 'Sub Category Name',
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
                  keyboardType: TextInputType.number,
                  onChanged: subCatagoryAddController.setsub_budget_amount_per_year,
                  decoration: InputDecoration(
                    hintText: 'Budget Per Year',
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
                    subCatagoryAddController.addsubcat(widget.cat_id);
                    // Handle button press inside the dialog box
                    // String category = _categoryController.text;
                    // String otherField = _otherFieldController.text;
                    // // Perform desired action with the entered category and other field
                    // // Example: Save the category and other field values to a database or perform some other operation
                    // print('Category: $category');
                    // print('Other Field: $otherField');
                    // Navigator.of(context).pop();
                    // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor: const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(120, 48), // Increase width and height of the button
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


  delcat(context, String subcatid, String budgetid) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
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
                Text('Are you sure you want to delete?',style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),),
                SizedBox(height: 10.h,),
                ElevatedButton(
                  onPressed: () {
                    // editCatWithBudget.cat_id.value=catid;
                    //
                    // editCatWithBudget.cat_name.value=catname;
                    //
                    // editCatWithBudget.editCat();

                    // Handle button press inside the dialog box
                    // addCatagoryController.addcat();
                    // Perform desired action with the entered category and other field
                    deleteSubCatController.deleteSubCat(subcatid, budgetid);

                   // deleteCatWithBudgetController.deleteCatWithBudget(catid,budgetid);
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
                    'Yes',
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


  EditSubCatWithBudget editSubCatWithBudget=Get.find();
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();

  void doNothing(BuildContext context,String user_id,String category_id,
    String sub_category_id,String update_sub_cat_name,String update_budget_amount) {
    print("doNothing");

    editSubCatWithBudget.user_id.value = user_id;
    editSubCatWithBudget.category_id.value = category_id;
    editSubCatWithBudget.sub_category_id.value = sub_category_id;
    editSubCatWithBudget.update_sub_cat_name.value = update_sub_cat_name;
    editSubCatWithBudget.update_budget_amount.value = update_budget_amount;

    a.text=editSubCatWithBudget.update_sub_cat_name.value;
    b.text=editSubCatWithBudget.update_budget_amount.value;
    editSubCatWithBudget.setupdate_sub_cat_name(a.text);
    editSubCatWithBudget.setupdate_budget_amount(b.text);


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 400,
            height: 400,
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
                Text(
                  'Add Sub Category',
                  style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: a,
                  onChanged: editSubCatWithBudget.setupdate_sub_cat_name,
                  decoration: InputDecoration(
                    hintText: 'Sub Category Name',
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
                  keyboardType: TextInputType.number,
                  controller: b,
                  onChanged: editSubCatWithBudget.setupdate_budget_amount,
                  decoration: InputDecoration(
                    hintText: 'Budget Per Year',
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

                    editSubCatWithBudget.editSubCat();



                    // Handle button press inside the dialog box
                    // String category = _categoryController.text;
                    // String otherField = _otherFieldController.text;
                    // // Perform desired action with the entered category and other field
                    // // Example: Save the category and other field values to a database or perform some other operation
                    // print('Category: $category');
                    // print('Other Field: $otherField');
                    // Navigator.of(context).pop();
                    // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Set the border radius
                    ),
                    backgroundColor: const Color(0xFF4A7CC8), // Set the background color
                    minimumSize: Size(120, 48), // Increase width and height of the button
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



void showUpdateDialogMethod(BuildContext context) {
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _otherFieldController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 400,
          height: 400,
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
              Text(
                'Update Sub Category',
                style: TextStyle(fontSize: 20, color: Color(0xff608fd7)),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  hintText: 'Category Name',
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
                controller: _otherFieldController,
                decoration: InputDecoration(
                  hintText: 'Category Budget Amount',
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
                  // Handle button press inside the dialog box
                  String category = _categoryController.text;
                  String otherField = _otherFieldController.text;
                  // Perform desired action with the entered category and other field
                  // Example: Save the category and other field values to a database or perform some other operation
                  print('Category: $category');
                  print('Other Field: $otherField');
                  Navigator.of(context).pop(); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Set the border radius
                  ),
                  backgroundColor: const Color(0xFF4A7CC8), // Set the background color
                  minimumSize: Size(120, 48), // Increase width and height of the button
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

// void main() {
//   runApp(MaterialApp(
//     home: VehicleBudget(),
//   ));
// }
