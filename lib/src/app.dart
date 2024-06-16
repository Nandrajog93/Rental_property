// import 'package:flutter/material.dart';
// //import 'package:responsive_builder/responsive_builder.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double textSize = DeviceConfig.getTextSize(context);
//     double padding = DeviceConfig.getPadding(context);
//     double cardWidth = DeviceConfig.getCardWidth(context);
//     double cardHeight = DeviceConfig.getCardHeight(context);

//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Card(
//             elevation: 5,
//             margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
//             child: Container(
//               width: cardWidth,
//               height: cardHeight,
//               child: Padding(
//                 padding: EdgeInsets.all(padding),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Sign-In",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: textSize,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: padding),
//                     customTextField("Email", "you@example.com", Icons.mail, false),
//                     SizedBox(height: padding / 2),
//                     customTextField("Password", "Enter Password", Icons.lock, true),
//                     SizedBox(height: padding),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Forgot Password?",
//                           style: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: textSize * 0.5,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: padding / 2),
//                     Container(
//                       width: double.infinity,
//                       height: padding * 1.5,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Sign In",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: textSize * 0.5,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: padding / 2),
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Don't have an account? ",
//                               style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: textSize * 0.4,
//                               ),
//                             ),
//                             TextSpan(
//                               text: "Sign-Up",
//                               style: TextStyle(
//                                 color: Colors.deepPurple,
//                                 fontSize: textSize * 0.4,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget customTextField(String title, String hintText, IconData icon, bool isPassword) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: DeviceConfig.getTextSize(context) * 0.4,
//             color: Colors.black54,
//           ),
//         ),
//         TextFormField(
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             hintText: hintText,
//             prefixIcon: Icon(icon),
//           ),
//         ),
//       ],
//     );
//   }
// }
