import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rental_property/customer_owner.dart';
import 'package:rental_property/data/data.dart';
import 'package:rental_property/house_search/house_listing.dart';
import 'package:rental_property/map_test.dart';
import 'package:rental_property/src/Grid_search_bar.dart';
import 'package:rental_property/src/homepage.dart';
import 'package:rental_property/src/settings/Tabview.dart';
import 'package:rental_property/src/settings/auth_page.dart';
import 'package:rental_property/src/settings/login.dart';
import 'package:rental_property/src/settings/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:test_application/src/calculation.dart';
//import 'package:flutter_application_1/src/maps.dart';
//import 'package:flutter_application_1/src/settings/test.dart';
// import 'package:test_application/src/homepage.dart';
// import 'package:test_application/src/search.dart';
// import 'package:test_application/src/settings/searchBar.dart';
//import 'package:test_application/test.dart';

// import 'shared/navigation/app_router.dart';
import '/src/color.dart';
import 'house_search/list_house_wigdet.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // name:"RentalProperty",
    options: FirebaseOptions(
        apiKey: "AIzaSyD7t0uVA2OrPiUVhZNL5dW1cs7_1hxxzUc",
      //authDomain: "rentalproperty-ea845.firebaseapp.com",
      projectId: "rentalproperty-ea845",
    //  storageBucket: "rentalproperty-ea845.appspot.com",
      messagingSenderId: "829048327348",
      appId: "1:829048327348:ios:4282fa7dd32589bca69be1",
     // appId:   "1:829048327348:web:198d4f49ce710472a69be1",
     // measurementId: "G-PLSBFWPPFJ"
           ),
  );
   //: await Firebase.initializeApp();

  //await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
       //colorScheme: Colors.white,

      ),
      home:  LoginScreen(),
    );
  }
}


//1) Add the page functionaliy >>> New page
//2) Add the timmer functionality    >>> timer
//3) Add main pages which are described in the presentation  with a button payment 
//4) Add logout button  ****************************
//5) Connect signup to firebase   ************************
//7) Singup as a client         --->   Can't deloy 
////8) SIngup as a customer     ---> 



/// 6) Make it bit presenatble 
