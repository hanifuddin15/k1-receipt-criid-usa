import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:k1recipt/View/Scan%20Recipt/ScanRecipt.dart';
import 'package:k1recipt/constants/global.dart';
import 'dart:convert';
import 'package:k1recipt/controller/changePassword/changePassword.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePassword> {

  ChangePasswordController changepasswordController = Get.find();

  late TextEditingController _oldpasswordController;
  late TextEditingController _user_idController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _user_idController = TextEditingController();
    _oldpasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _user_idController.dispose();
    _oldpasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> changePassword() async {
    // Validate if New Password and Confirm Password match
    if (_newPasswordController.text != _confirmPasswordController.text) {
      _showSnackBar('New Password and Confirm Password do not match.');
      return;
    }

    // // Validate if Current Password matches the original password
    // final String originalPassword = 'YOUR_ORIGINAL_PASSWORD'; // Replace with your original password
    // if (_oldpasswordController.text != originalPassword) {
    //   _showSnackBar('Current Password is incorrect. Please try again.');
    //   return;
    // }

      else  {
      setState(() {
        _isLoading = true; // Show the loader
      });

      final url = Uri.parse('https://dev.k1receipt.com/api/change_password/');
      final response = await http.post(
        url,
        body: {
          'user_id': d_id,
          'old_password': _oldpasswordController.text,
          'new_password': _newPasswordController.text,
          'confirm_password': _confirmPasswordController.text,
        },
      );

      setState(() {
        _isLoading = false; // Hide the loader
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        final status = jsonData['status'];
        final msg = jsonData['message'];
        print('Password changed successfully ${response.body}');
        if (status == 400 && msg == 'Check your old password.') {
          _showSnackBar('$msg');
        } else {
          _showSnackBar('Password changed successfully');
          Get.offAll(ScanRecipt());
        }
      }
       else if (response.statusCode == 400) {
        print('Incorrect password');
        _showSnackBar('Incorrect password. Please try again.');
      } else {
        // Other error occurred
        print('Failed to change password');
        _showSnackBar('Failed to change password. Please try again later.');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Color(0xff3461a6),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Change Password',
                style: GoogleFonts.mukta(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3461a6),
                ),
              ),
              SizedBox(height: 40),
              // TextField(readOnly: true,
              //   controller: _user_idController,
              //   decoration: InputDecoration(
              //     labelText: '$d_id',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              TextField(
                controller: _oldpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child:ElevatedButton(
                  onPressed: _isLoading ? null : () => changePassword(),
                  child: _isLoading
                      ? CircularProgressIndicator() // Show the loader
                      : Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3461a6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    GetMaterialApp(
      home: ChangePassword(),
      theme: ThemeData(
        primaryColor: Color(0xff3461a6),
        hintColor: Color(0xff3461a6),
      ),
    ),
  );
}
