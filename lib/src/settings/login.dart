//import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rental_property/src/settings/signup.dart';

class DeviceConfig {
  static double getTextSize(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 40.0;
      case DeviceScreenType.tablet:
        return 30.0;
      case DeviceScreenType.mobile:
      default:
        return 20.0;
    }
  }

  static double getPadding(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 35.0;
      case DeviceScreenType.tablet:
        return 25.0;
      case DeviceScreenType.mobile:
      default:
        return 15.0;
    }
  }

  static double getCardWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 800.0;
      case DeviceScreenType.tablet:
        return 600.0;
      case DeviceScreenType.mobile:
      default:
        return 400.0;
    }
  }

  static double getCardHeight(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 650.0;
      case DeviceScreenType.tablet:
        return 550.0;
      case DeviceScreenType.mobile:
      default:
        return 560.0;
    }
  }
}

class LoginScreen extends StatefulWidget {

  //final VoidCallback showLoginpage;
  //const LoginScreen({Key? key , required this.showLoginpage});


  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //@override

    final _textController     =  TextEditingController();
    final _passwordController =   TextEditingController();


    Future signIn() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _textController.text.trim(),
       password: _passwordController.text.trim());
    }
 @override
 void dispose(){
  _textController.dispose();
  _passwordController.dispose();
  super.dispose();
 }
  Widget build(BuildContext context) {

    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);
    double cardWidth = DeviceConfig.getCardWidth(context);
    double cardHeight = DeviceConfig.getCardHeight(context);

    return Scaffold(
      // appBar: AppBar(title: Text('Example')),
      appBar: AppBar(title: Text('Sign In')),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ScreenTypeLayout(
                mobile: buildMobileLayout(textSize, padding),
                tablet: buildTabletLayout(textSize, padding),
                desktop: buildDesktopLayout(textSize, padding),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMobileLayout(double textSize, double padding) {
    return SingleChildScrollView(
      child: Column(
       
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    Center(
            child: Image.asset(
              '/home/utente/rental_property/lib/house.gif',
              fit: BoxFit.cover,
              height: 150, // Adjust height as needed
            ),
          ),
                     SizedBox(height: padding),
          Row(
            children: [
              Text(
                "Sign-In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Icon(
                  Icons.login_rounded,
                  color: Colors.deepPurple,
                  size: textSize,
                ),
              ),
            ],
          ),
          SizedBox(height: padding),
          customTextField(_textController ,"Email", "you@example.com", Icons.mail, false, textSize),
          SizedBox(height: padding / 2),
          customTextField(_passwordController ,"Password", "Enter Password" ,Icons.lock, true, textSize),
          SizedBox(height: padding),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: textSize * 0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: padding / 2),
          Container(
            width: double.infinity,
            height: padding * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: ()async {
                   await signIn();
                  },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize * 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: padding / 2),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    // recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                                Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignupPage()),
                    // );
                    //               },
                    recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => SignupPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                    text: "Sign-Up",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabletLayout(double textSize, double padding) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Sign-In",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.deepPurple,
                        size: textSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: padding),
                customTextField(_textController,"Email", "you@example.com" , Icons.mail, false, textSize),
                SizedBox(height: padding / 2),
                customTextField(_passwordController,"Password", "Enter Password", Icons.lock, true, textSize),
                SizedBox(height: padding),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),
                Container(
                  width: double.infinity,
                  height: padding * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    ),
                    onPressed: ()async {
                   await signIn();
                  },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textSize * 0.4,
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 8),
                        ),
                        TextSpan(
                          text: "Sign-Up",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: textSize * 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              '/home/utente/rental_property/lib/house.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(double textSize, double padding) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Sign-In",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.deepPurple,
                        size: textSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: padding),
                customTextField(_textController,  "Email", "you@example.com" ,Icons.mail, false, textSize),
                SizedBox(height: padding / 2),
                customTextField(_passwordController,"Password", "Enter Password" , Icons.lock, false, textSize),
                SizedBox(height: padding),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),
                Container(
                  width: double.infinity,
                  height: padding * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    ),
                    onPressed:()async {
                              await signIn();
                  },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textSize * 0.4,
                          ),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 8),
                        ),
                        TextSpan( recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => SignupPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                          text: "Sign-Up",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: textSize * 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              '/home/utente/rental_property/lib/house.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget customTextField( final controller, String title,String hintText, IconData icon, bool isPassword, double textSize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
        
          title,
          style: TextStyle(
            fontSize: textSize * 0.4,
            color: Colors.black,
          ),
        ),

        TextField(
          //
         controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }
}

