
// //import 'package:car_rental/widgets/list_car_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rental_property/house_search/list_house_wigdet.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// //import 'google_maps_widget.dart';

// class DeviceConfig {
//   static int getCrossAxisCount(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);

//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 4;
//       case DeviceScreenType.tablet:
//         return 3;
//       case DeviceScreenType.mobile:
//       default:
//         return 2;
//     }
//   }

//   static double getSearchBarWidth(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);

//     switch (deviceType) {
//       case DeviceScreenType.mobile:
//         return MediaQuery.of(context).size.width * 0.8;
//       case DeviceScreenType.tablet:
//         return MediaQuery.of(context).size.width * 0.6;
//       case DeviceScreenType.desktop:
//       default:
//         return MediaQuery.of(context).size.width * 0.5;
//     }
//   }

//   static double getTextSize(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 14.0;
//       case DeviceScreenType.tablet:
//         return 12.0;
//       case DeviceScreenType.mobile:
//       default:
//         return 12.0;
//     }
//   }

//   static double getPadding(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 16.0;
//       case DeviceScreenType.tablet:
//         return 12.0;
//       case DeviceScreenType.mobile:
//       default:
//         return 8.0;
//     }
//   }
// }
// class HouseList extends StatefulWidget {
//   @override
//   _HouseListState createState() => _HouseListState();
// }

// class _HouseListState extends State<HouseList> {
//   bool _hasBeenPressed1 = false;
//   bool _hasBeenPressed2 = false;
//   bool _hasBeenPressed3 = false;
//   bool _hasBeenPressed4 = false;
//   @override
//   Widget build(BuildContext context) {
//     double textSize = DeviceConfig.getTextSize(context);
//     double padding = DeviceConfig.getPadding(context);
//     return Scaffold(

//       //appBar: AppBar(),
    
      
//       body: Column(
//         children: [
//           Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             width: DeviceConfig.getSearchBarWidth(context),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.grey[200],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextField(
//               //  controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 ),
//               ),
//             ),
//           ),
//         ),
//           Expanded(
//             child: Row(
              
//               children: <Widget>[
            
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 80.0,
//                           alignment: Alignment.centerRight,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'House Rental',
//                                       style: GoogleFonts.raleway(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           //padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: SingleChildScrollView(
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Filters',
//                                   style: GoogleFonts.raleway(
//                                     color: Colors.black,
//                                     fontSize: 23,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Text(
//                                     'More Filters',
//                                     textAlign: TextAlign.end,
//                                     style: GoogleFonts.raleway(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       color:Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 14.0,
//                         ),
//                         Container(
//                           //padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: SingleChildScrollView(
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 filterButton(
//                                   Icons.house_rounded,
//                                   "Car Rental",
//                                 ),
//                                 filterButton2(
//                                   Icons.electric_car,
//                                   "Electric Car",
//                                 ),
//                                 filterButton3(
//                                   Icons.edit_location,
//                                   "Nearby",
//                                 ),
//                                 filterButton4(
//                                   Icons.car_repair,
//                                   "Car Repair",
//                                 ),
//                               ],
//                             ),
//                           )
//                         ),
//                         SizedBox(
//                           height: 14.0,
//                         ),
//                         Divider(
//                           thickness: 0.5,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Expanded(child: ListCar()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10,10,10,10),
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                    // child: GoogleMap()
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget filterButton(icons, name) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(

//      //   onPrimary: _hasBeenPressed1 ? Color(0xe8454545) : Color(0xe8303030),
//       //  primary: _hasBeenPressed1 ? Color(0xe8454545) : Color(0xe8303030),
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         side: BorderSide(
//           width: 1,
//           color: Color(0xe8454545)
//         ),
//       ),
//       onPressed: () {
//         setState(() {
//           _hasBeenPressed1 = !_hasBeenPressed1;
//         });
//       },
//       child: Container(
//         height: 45,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 35,
//               width: 35,
//               decoration: BoxDecoration(
//                 color: _hasBeenPressed1 ? Color(0xff4e3bff) : Colors.black26,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icons,
//                 color: _hasBeenPressed1 ? Colors.white70 : Colors.grey,
//                 size: 20.0,
//               ),
//             ),
//             SizedBox(
//               width: 6.0,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                 color: _hasBeenPressed1 ? Colors.white70 : Colors.grey
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget filterButton2(icons, name) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//        // onPrimary: _hasBeenPressed2 ? Color(0xe8454545) : Color(0xe8303030),
//         //primary: _hasBeenPressed2 ? Color(0xe8454545) : Color(0xe8303030),
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         side: BorderSide(
//             width: 1,
//             color: Color(0xe8454545)
//         ),
//       ),
//       onPressed: () {
//         setState(() {
//           _hasBeenPressed2 = !_hasBeenPressed2;
//         });
//       },
//       child: Container(
//         height: 45,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 35,
//               width: 35,
//               decoration: BoxDecoration(
//                 color: _hasBeenPressed2 ? Color(0xff4e3bff) : Colors.black26,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icons,
//                 color: _hasBeenPressed2 ? Colors.white70 : Colors.grey,
//                 size: 20.0,
//               ),
//             ),
//             SizedBox(
//               width: 6.0,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                   color: _hasBeenPressed2 ? Colors.white70 : Colors.grey
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget filterButton3(icons, name) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//      //   onPrimary: _hasBeenPressed3 ? Color(0xe8454545) : Color(0xe8303030),
//       //  primary: _hasBeenPressed3 ? Color(0xe8454545) : Color(0xe8303030),
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         side: BorderSide(
//             width: 1,
//             color: Color(0xe8454545)
//         ),
//       ),
//       onPressed: () {
//         setState(() {
//           _hasBeenPressed3 = !_hasBeenPressed3;
//         });
//       },
//       child: Container(
//         height: 45,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 35,
//               width: 35,
//               decoration: BoxDecoration(
//                 color: _hasBeenPressed3 ? Color(0xff4e3bff) : Colors.black26,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icons,
//                 color: _hasBeenPressed3 ? Colors.white70 : Colors.grey,
//                 size: 20.0,
//               ),
//             ),
//             SizedBox(
//               width: 6.0,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                   color: _hasBeenPressed3 ? Colors.white70 : Colors.grey
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget filterButton4(icons, name) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//    //     onPrimary: _hasBeenPressed4 ? Color(0xe8454545) : Color(0xe8303030),
//     //    primary: _hasBeenPressed4 ? Color(0xe8454545) : Color(0xe8303030),
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         side: BorderSide(
//             width: 1,
//             color: Color(0xe8454545)
//         ),
//       ),
//       onPressed: () {
//         setState(() {
//           _hasBeenPressed4 = !_hasBeenPressed4;
//         });
//       },
//       child: Container(
//         height: 45,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: 35,
//               width: 35,
//               decoration: BoxDecoration(
//                 color: _hasBeenPressed4 ? Color(0xff4e3bff) : Colors.black26,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 icons,
//                 color: _hasBeenPressed4 ? Colors.white70 : Colors.grey,
//                 size: 20.0,
//               ),
//             ),
//             SizedBox(
//               width: 6.0,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                   color: _hasBeenPressed4 ? Colors.white70 : Colors.grey
//               ),
//             )
//           ],
//         ),
//       ),
//     );


//   }
// }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// //import 'package:rental_property/house_search/list_house_widget.dart';
// import 'package:rental_property/house_search/list_house_wigdet.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// // import 'google_maps_widget.dart'; // Uncomment if you are using Google Maps

// class DeviceConfig {
//   static int getCrossAxisCount(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);

//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 4;
//       case DeviceScreenType.tablet:
//         return 3;
//       case DeviceScreenType.mobile:
//       default:
//         return 2;
//     }
//   }

//   static double getSearchBarWidth(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);

//     switch (deviceType) {
//       case DeviceScreenType.mobile:
//         return MediaQuery.of(context).size.width * 0.8;
//       case DeviceScreenType.tablet:
//         return MediaQuery.of(context).size.width * 0.6;
//       case DeviceScreenType.desktop:
//       default:
//         return MediaQuery.of(context).size.width * 0.5;
//     }
//   }

//   static double getTextSize(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 14.0;
//       case DeviceScreenType.tablet:
//         return 12.0;
//       case DeviceScreenType.mobile:
//       default:
//         return 12.0;
//     }
//   }

//   static double getPadding(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     switch (deviceType) {
//       case DeviceScreenType.desktop:
//         return 16.0;
//       case DeviceScreenType.tablet:
//         return 12.0;
//       case DeviceScreenType.mobile:
//       default:
//         return 8.0;
//     }
//   }
// }

// class HouseList extends StatefulWidget {
//   @override
//   _HouseListState createState() => _HouseListState();
// }

// class _HouseListState extends State<HouseList> {
//   bool _hasBeenPressed1 = false;
//   bool _hasBeenPressed2 = false;
//   bool _hasBeenPressed3 = false;
//   bool _hasBeenPressed4 = false;

//   @override
//   Widget build(BuildContext context) {
//     double textSize = DeviceConfig.getTextSize(context);
//     double padding = DeviceConfig.getPadding(context);

//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(padding),
//             child: Container(
//               width: DeviceConfig.getSearchBarWidth(context),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Colors.grey[200],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search...',
//                     border: InputBorder.none,
//                     prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   flex: 3,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: padding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 80.0,
//                           alignment: Alignment.centerRight,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'House Rental',
//                                       style: GoogleFonts.raleway(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Filters',
//                                 style: GoogleFonts.raleway(
//                                   color: Colors.black,
//                                   fontSize: 23,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   'More Filters',
//                                   textAlign: TextAlign.end,
//                                   style: GoogleFonts.raleway(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 14.0),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               filterButton(Icons.house_rounded, "Car Rental", _hasBeenPressed1, 1),
//                               filterButton(Icons.electric_car, "Electric Car", _hasBeenPressed2, 2),
//                               filterButton(Icons.edit_location, "Nearby", _hasBeenPressed3, 3),
//                               filterButton(Icons.car_repair, "Car Repair", _hasBeenPressed4, 4),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 14.0),
//                         Divider(
//                           thickness: 0.5,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(height: 10.0),
//                         Expanded(child: ListCar()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     padding: EdgeInsets.all(padding),
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     // Placeholder for Google Map
//                     child: Center(
//                       child: Text('Google Map Placeholder'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget filterButton(IconData icon, String label, bool isPressed, int buttonNumber) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8.0),
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: isPressed ? Colors.white : Colors.black, backgroundColor: isPressed ? Colors.blue : Colors.grey[200],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         onPressed: () {
//           setState(() {
//             switch (buttonNumber) {
//               case 1:
//                 _hasBeenPressed1 = !_hasBeenPressed1;
//                 break;
//               case 2:
//                 _hasBeenPressed2 = !_hasBeenPressed2;
//                 break;
//               case 3:
//                 _hasBeenPressed3 = !_hasBeenPressed3;
//                 break;
//               case 4:
//                 _hasBeenPressed4 = !_hasBeenPressed4;
//                 break;
//             }
//           });
//         },
//         icon: Icon(icon),
//         label: Text(label),
//       ),
//     );
//   }

//   // Widget ListCar() {
//   //   // Replace this with your actual list view for cars
//   //   return ListView.builder(
//   //     itemCount: 10,
//   //     itemBuilder: (context, index) {
//   //       return ListTile(
//   //         title: Text('Car $index'),
//   //       );
//   //     },
//   //   );
//   // }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_property/house_search/houses.dart';
//import 'package:rental_property/house_search/houses.dart';
import 'package:rental_property/house_search/list_house_wigdet.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'houses.dart';

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
   //final List<CarItem> images;

  //const HouseList({Key? key, required this.images}) : super(key: key);

  @override
  _HouseListState createState() => _HouseListState();
}

class _HouseListState extends State<HouseList> {
  final TextEditingController _searchController = TextEditingController();
  //final List<CarItem> images;




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
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Filters',
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'More Filters',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.raleway(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.0),
                        SingleChildScrollView(
                          //scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              filterButton(Icons.house_rounded, "Car Rental", _hasBeenPressed1, 1),
                              filterButton(Icons.electric_car, "Electric Car", _hasBeenPressed2, 2),
                              filterButton(Icons.edit_location, "Nearby", _hasBeenPressed3, 3),
                              filterButton(Icons.car_repair, "Car Repair", _hasBeenPressed4, 4),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10.0),
                        Expanded(child: ListCar(carItems: [
                                CarItem(
                                    name: "Civic",
                                    price: 123,
                                    image: "/Users/nandrajog/Downloads/rental_property/lib/logo6.jpeg",
                                    color: "white",
                                    gearbox: "automatic",
                                    fuel: "petrol",
                                    brand: "Honda",
                                    rating: "4.5",
                                    location: "Port-Louis", description: 'sd',
                                ),
                                
                                CarItem(
                                    name: "8 Series",
                                    price: 123,
                                    image: "/Users/nandrajog/Downloads/rental_property/lib/logo6.jpeg",
                                    color: "blue",
                                    gearbox: "automatic",
                                    fuel: "petrol",
                                    brand: "BMW",
                                    rating: "4.5",
                                    location: "Port-Louis", description: 'ds'),],controller : _searchController, )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(padding),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    // Placeholder for Google Map
                    child: Center(
                      child: Text('Google Map Placeholder'),
                    ),
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
