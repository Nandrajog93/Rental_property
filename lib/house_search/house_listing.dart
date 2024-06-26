//import 'package:google_maps/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_maps/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps/google_maps.dart';
import 'package:rental_property/house_search/google_maps_widget.dart';
//import 'package:rental_property/house_search/houses.dart';
import 'package:rental_property/house_search/list_house_wigdet.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
//import 'houses.dart';
class ListItem {
  final String name;
  final double lat;
  final double long;
  final String location;
  final String imagePath;

  ListItem({
    required this.name,
    required this.lat,
    required this.long,
    required this.location,
    required this.imagePath
  });

  factory ListItem.fromCsv(List<dynamic> row) {
    return ListItem(
      imagePath: row[5].toString(),
      name: row[1].toString(),
      lat: row[5],
      long: row[6],  // Fix here, changed row[3] to row[4] for longitude
      location: row[7].toString(),  // Assuming location is in row[2]
    );
  }

  @override
  String toString() {
    return 'ListItem(name: $name, lat: $lat, long: $long, location: $location)';
  }
}

class DeviceConfig {
  static int getCrossAxisCount(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 4;
      case DeviceScreenType.tablet:
        return 3;
      case DeviceScreenType.mobile:
      default:
        return 2;
    }
  }

  static double getSearchBarWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.mobile:
        return MediaQuery.of(context).size.width * 0.8;
      case DeviceScreenType.tablet:
        return MediaQuery.of(context).size.width * 0.6;
      case DeviceScreenType.desktop:
      default:
        return MediaQuery.of(context).size.width * 0.5;
    }
  }

  static double getTextSize(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 14.0;
      case DeviceScreenType.tablet:
        return 12.0;
      case DeviceScreenType.mobile:
      default:
        return 12.0;
    }
  }

  static double getPadding(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 16.0;
      case DeviceScreenType.tablet:
        return 12.0;
      case DeviceScreenType.mobile:
      default:
        return 8.0;
    }
  }
}

class HouseList extends StatefulWidget {
  @override
  _HouseListState createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  final TextEditingController _searchController = TextEditingController();
  LatLng _mapCenter = LatLng(1.3521, 103.8198);
  List<ListItem> listinfo = [];
  bool _isDataLoaded = false;
  final GlobalKey<CustomGoogleMapState> _mapKey = GlobalKey<CustomGoogleMapState>();

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  void _loadCsvData() async {
    try {
      final rawData = await rootBundle.loadString('/Users/nandrajog/Downloads/rental_property/lib/House_dataset/house_data_mac.csv'); // Ensure the path is correct
      List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(rawData, eol: '\n');

      List<ListItem> imageItems = rowsAsListOfValues.map((row) {
        return ListItem.fromCsv(row);
      }).toList();

      setState(() {
        listinfo = List.from(imageItems);
        _isDataLoaded = true;
      });
    } catch (e) {
      print('Error loading CSV data: $e');
      setState(() {
        _isDataLoaded = true;
      });
    }
  }

  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;

  @override
  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              width: DeviceConfig.getSearchBarWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.0,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'House Rental',
                                      style: GoogleFonts.raleway(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                         
                        SizedBox(height: 14.0),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.0),
                        Expanded(child: ListHouse(
                                    
                                    controller : _searchController,
                                    
                                    onHouseSelected: (HouseItem houseItem) {
                                    setState(() {
                                      _mapCenter = LatLng(houseItem.latitude, houseItem.longitude);
                                    });
                                     _mapKey.currentState?.moveCameraToPosition(
                                      houseItem.latitude,
                                      houseItem.longitude,
                                    );
                                    }    
                               )
                               ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CustomGoogleMap(
                    key: _mapKey,
                    center: _mapCenter,
                    latlong: listinfo.map((item) {
                      return LatLong(
                        name: item.name,
                        lat: item.lat,
                        long: item.long,
                        location: item.location,
                        ImagePath: item.imagePath
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget filterButton(IconData icon, String label, bool isPressed, int buttonNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: isPressed ? Colors.white : Colors.black,
          backgroundColor: isPressed ? Colors.blue : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          setState(() {
            switch (buttonNumber) {
              case 1:
                _hasBeenPressed1 = !_hasBeenPressed1;
                break;
              case 2:
                _hasBeenPressed2 = !_hasBeenPressed2;
                break;
              case 3:
                _hasBeenPressed3 = !_hasBeenPressed3;
                break;
              case 4:
                _hasBeenPressed4 = !_hasBeenPressed4;
                break;
            }
          });
        },
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
