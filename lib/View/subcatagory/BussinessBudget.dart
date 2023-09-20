import 'package:flutter/material.dart';


class BussinessBudget extends StatefulWidget {
  const BussinessBudget({Key? key}) : super(key: key);

  @override
  State<BussinessBudget> createState() => _BussinessBudgetState();
}

class _BussinessBudgetState extends State<BussinessBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {},
        ),
        title: Row(
          children: [
            SizedBox(width: 4),
            Text(
              'Business...',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xff8278d6),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 2),
              Text(
                'New Sub category',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8278d6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sub Category Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Amount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'No Record Found',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
