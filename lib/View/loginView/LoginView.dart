// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:k1recipt/controller/login/loginController.dart';
//
// class LoginPage extends GetView<LoginController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: controller.setUsername,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               onChanged: controller.setPassword,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: controller.login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }