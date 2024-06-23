import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:rental_property/house_search/new_house_page.dart';
import 'package:rental_property/src/settings/signup.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
  final String extraimage2;
  final String extraimage3;
  final String extraimage4;
  final String extraimage5;

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
    required this.extraimage2,
    required this.extraimage3,
    required this.extraimage4,
    required this.extraimage5,
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
      extraimage2: row[10].toString(),
      extraimage3: row[11].toString(),
      extraimage4: row[12].toString(),
      extraimage5: row[13].toString(),
    );
  }

  @override
  String toString() {
    return 'HouseItem(name: $name, price: $price, imagePath: $imagePath, location: $location, description: $description, latitude: $latitude, longitude: $longitude)';
  }
}

class ListHouse extends StatefulWidget {
  final TextEditingController controller;
  final Function(HouseItem) onHouseSelected;

  const ListHouse({
    Key? key,
    required this.controller,
    required this.onHouseSelected,
  }) : super(key: key);

  @override
  _ListHouseState createState() => _ListHouseState();
}

class _ListHouseState extends State<ListHouse> {
  List<HouseItem> _filteredImages = [];
  List<HouseItem> _allImages = [];
  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadCsvData();
    widget.controller.addListener(_onSearch);  // Add listener here
  }

  void _loadCsvData() async {
    try {
      final rawData = await rootBundle.loadString('/home/utente/rental_property/lib/House_dataset/house_data.csv');
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(rawData, eol: '\n');

      List<HouseItem> imageItems = rowsAsListOfValues.map((row) {
        return HouseItem.fromCsv(row);
      }).toList();

      setState(() {
        _allImages = imageItems;
        _filteredImages = List.from(imageItems);
        _isDataLoaded = true;
      });
    } catch (e) {
      print('Error loading CSV data: $e');
      setState(() {
        _isDataLoaded = true;
      });
    }
  }

  void _onSearch() {
    final query = widget.controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredImages = List.from(_allImages);
      } else {
        _filteredImages = _allImages.where((image) => image.name.toLowerCase().contains(query)).toList();
      }
    });
    print('Filtered Images: $_filteredImages');
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSearch);
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  if (!_isDataLoaded) {
    return Center(child: CircularProgressIndicator());
  }
  return ListView.builder(
    itemCount: _filteredImages.length,
    itemBuilder: (context, index) {
      final item = _filteredImages[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            widget.onHouseSelected(item);
          },
          child: Container(
            height: 180,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      item.imagePath,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_city, color: Colors.grey, size: 10),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                item.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.euro, color: Colors.grey, size: 10),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                item.price.toString() + '.00',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 14),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                item.description.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey, size: 14),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                item.location.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        ElevatedButton(
                        child: Text('More Info'),
                        onPressed: (){Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Redirect_page(
                        image1: item.extraimage1,
                        image2: item.extraimage2,
                        image3: item.extraimage3,
                        image4: item.extraimage4,
                        image5: item.extraimage5,
                        name: item.name,
                        description:item.description,
                        location: item.location,
                        address: item.address,
                        // latitude:item.latitude,
                        // longitude:item.longitude, 
                        price: item.price.toString(),
                        // price: item.price,
                        
                       )
                       )
                       );
                       },
                          )   ,
                        
                      ],)
                      ],
                 
                    ),
                  ),
                )



//  recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) => SignupPage(),
//                         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                           return FadeTransition(
//                             opacity: animation,
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   }


                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       favoriteButton(Icons.favorite),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         '${item.price}/week',
                  //         style: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w300,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget favoriteButton(IconData icon) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.grey,
      backgroundColor: Colors.transparent,
      shape: CircleBorder(),
      padding: EdgeInsets.all(10),
      side: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    onPressed: () {},
    child: Icon(
      icon,
      color: Colors.grey,
      size: 20.0,
    ),
  );
}
}