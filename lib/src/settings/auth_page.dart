import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_property/house_search/house_listing.dart';
import 'package:rental_property/src/settings/Tabview.dart';
import 'package:rental_property/src/settings/login.dart';

import 'package:rental_property/src/settings/login.dart';
import 'package:rental_property/src/settings/signup.dart';
//import 'package:test_application/test.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}
final user = FirebaseAuth.instance.currentUser;
class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>( stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData){
           //print("User ID: ${user}");
          return HouseList();
          
        }
        else {
           //print("User ID: ${user}");
        return LoginScreen();
        }
      }
      ),
    );
  }
}