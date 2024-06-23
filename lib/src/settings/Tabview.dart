//import 'dart:async';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_property/house_search/Standard_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rental_property/src/Grid_search_bar.dart';

import '../../house_search/house_listing.dart';

class HouseItem {
  final String name;
  final double price;
  final String imagePath;
  final String location;
  final String description;
  final double latitude;
  final double longitude;
  final String address ;
  final String extraimage1;

  HouseItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.extraimage1,
  });


  factory HouseItem.fromCsv(List<dynamic> row) {
    return HouseItem(
      name: row[1].toString(),
      price: row[2],
      imagePath: row[8].toString(),
      location: row[7].toString(),
      description: row[0].toString(),
      latitude: row[5],
      longitude: row[6],
      address: row[4].toString(),
      extraimage1: row[9].toString(),
    );
  }
}


class ImageSearchScreen extends StatefulWidget {
  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}


class _ImageSearchScreenState extends State<ImageSearchScreen> {

List<HouseItem> imageItems = [];
  bool _isDataLoaded = false;

@override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  void _loadCsvData() async {
    try {
      final rawData = await rootBundle.loadString('/home/utente/rental_property/lib/House_dataset/house_data.csv');
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(rawData, eol: '\n');

      List<HouseItem> loadedItems = rowsAsListOfValues.map((row) {
        return HouseItem.fromCsv(row);
      }).toList();

      setState(() {
         imageItems = loadedItems;
        _isDataLoaded = true;
      });
    } catch (e) {
      print('Error loading CSV data: $e');
      setState(() {
        _isDataLoaded = true;
      });
    }
  }

  @override
  Widget build( BuildContext context ) {

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            '/home/utente/rental_property/lib/assets/fire.svg',
            height: 50,
          ),
          bottom: const TabBar(
            indicatorColor: Colors.lightBlue,
            indicatorWeight: 4.0,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              // Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.house )),
              Tab(icon: Icon(Icons.bedroom_child_rounded)),
              Tab(icon: Icon(Icons.access_alarms_outlined)),
              Tab(icon: Icon(Icons.tag_faces )),
              Tab(icon: Icon(Icons.discount )),
              Tab(icon: Icon(Icons.key )),
              Tab(icon: Icon(Icons.sync_outlined )),
            ],
          ),
        ),
        body: TabBarView(
          
          children: [
            // Scaffold(body:  ImageGrid()),
             Scaffold(body:  ImageGrid()),
            Scaffold(body: HouseList()),
           Scaffold(
                    body: imageItems.isNotEmpty
                        ? Standard_page(
                            pageText: 'Affiti Condivisi',
                            image1: imageItems[0].imagePath,
                            location: imageItems[0].location,
                            description: imageItems[0].description,
                            name: imageItems[0].name,
                            address: imageItems[0].address,
                            price: imageItems[0].price.toString(),
                          )
                        : Center(child: Text('No Image Available')),
                  ),
                             Scaffold(
                    body: imageItems.isNotEmpty
                        ? Standard_page(
                           pageText: 'Affiti del Giorno',
                            image1: imageItems[0].imagePath,
                            location: imageItems[0].location,
                            description: imageItems[0].description,
                            name: imageItems[0].name,
                            address: imageItems[0].address,
                            price: imageItems[0].price.toString(),
                          )
                        : Center(child: Text('No Image Available')),
                  ),
                             Scaffold(
                    body: imageItems.isNotEmpty
                        ? Standard_page(
                          pageText: 'Affiti Popolari',
                            image1: imageItems[0].imagePath,
                            location: imageItems[0].location,
                            description: imageItems[0].description,
                            name: imageItems[0].name,
                            address: imageItems[0].address,
                            price: imageItems[0].price.toString(),
                          )
                        : Center(child: Text('No Image Available')),
                  ),
                             Scaffold(
                    body: imageItems.isNotEmpty
                        ? Standard_page(
                          pageText: 'Affiti Lampo',
                            image1: imageItems[0].imagePath,
                            location: imageItems[0].location,
                            description: imageItems[0].description,
                            name: imageItems[0].name,
                            address: imageItems[0].address,
                            price: imageItems[0].price.toString(),
                          )
                        : Center(child: Text('No Image Available')),
                  ),
                             Scaffold(
                    body: imageItems.isNotEmpty
                        ? Standard_page(
                          pageText: 'Affiti a Ribaso',
                            image1: imageItems[0].imagePath,
                            location: imageItems[0].location,
                            description: imageItems[0].description,
                            name: imageItems[0].name,
                            address: imageItems[0].address,
                            price: imageItems[0].price.toString(),
                          )
                        : Center(child: Text('No Image Available')),
                  ),
             
         ],
              ),
            //  Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
