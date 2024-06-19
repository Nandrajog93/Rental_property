//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rental_property/src/Grid_search_bar.dart';

import '../../house_search/house_listing.dart';

class ImageSearchScreen extends StatefulWidget {
  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}


class _ImageSearchScreenState extends State<ImageSearchScreen> {


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            '/home/utente/rental_property/lib/download.png',
            height: 50,
          ),
          bottom: const TabBar(
            indicatorColor: Colors.lightBlue,
            indicatorWeight: 4.0,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.backpack)),
              Tab(icon: Icon(Icons.fire_extinguisher)),
              Tab(icon: Icon(Icons.hail)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           // SearchPage(),
            //SearchPage(),
         Scaffold(
            body:  ImageGrid()
    ),
            Scaffold(
            body:  ImageGrid(
              // images: [
              //   ImageItem(
              //     imagePath: '/home/utente/rental_property/lib/logo6.jpeg',
              //     description: 'Description 1',
              //     expiration_: DateTime.now().add(Duration(hours: 1)),
              //   ),
              //   ImageItem(
              //     imagePath: '/home/utente/rental_property/lib/logo4.jpeg',
              //     description: 'Description 2',
              //     expiration_: DateTime.now().add(Duration(hours: 3)),
              //   ),
              //   ImageItem(
              //     imagePath: '/home/utente/rental_property/lib/logo5.jpeg',
              //     description: 'Description 3',
              //     expiration_: null,
              //   ),
              // ],
            )
    ),
     Scaffold(
      body: HouseList(),
    ),
           // Text(''),
            Text(''),
            Text(''),
          ],
        ),
      ),
    );
  }
}