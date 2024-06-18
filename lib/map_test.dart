// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:responsive_builder/responsive_builder.dart';

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
//   final TextEditingController _searchController = TextEditingController();
//   bool _hasBeenPressed1 = false;
//   bool _hasBeenPressed2 = false;
//   bool _hasBeenPressed3 = false;
//   bool _hasBeenPressed4 = false;

//   LatLng _mapCenter = LatLng(37.7749, -122.4194); // Default to San Francisco

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
//                   controller: _searchController,
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
//                           child: Row(
//                             children: [
//                               filterButton(Icons.house_rounded, "Car Rental", _hasBeenPressed1, 1),
//                               filterButton(Icons.electric_car, "Electric Car", _hasBeenPressed2, 2),
//                               filterButton(Icons.edit_location, "Nearby", _hasBeenPressed3, 3),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 14.0),
//                         Divider(
//                           thickness: 0.5,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(height: 10.0),
//                         Expanded(
//                           child: ListHouse(
//                             houseItems: [
//                               HouseItem(
//                                 name: "Civic",
//                                 price: 123,
//                                 image: "assets/logo6.jpeg",
//                                 color: "white",
//                                 gearbox: "automatic",
//                                 fuel: "petrol",
//                                 brand: "Honda",
//                                 rating: "4.5",
//                                 location: "Port-Louis",
//                                 description: 'sd',
//                                 latitude: 20.1609,
//                                 longitude: -74.9823,
//                               ),
//                               HouseItem(
//                                 name: "8 Series",
//                                 price: 123,
//                                 image: "assets/logo6.jpeg",
//                                 color: "blue",
//                                 gearbox: "automatic",
//                                 fuel: "petrol",
//                                 brand: "BMW",
//                                 rating: "4.5",
//                                 location: "Port-Louis",
//                                 description: 'ds',
//                                 latitude: 19.1609,
//                                 longitude: -73.9823,
//                               )
//                             ],
//                             controller: _searchController,
//                             onHouseSelected: (HouseItem houseItem) {
//                               setState(() {
//                                 _mapCenter = LatLng(houseItem.latitude, houseItem.longitude);
//                               });
//                             },
//                           ),
//                         ),
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
//                     child: Center(
//                       child: GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: _mapCenter,
//                           zoom: 14.0,
//                         ),
//                         markers: {
//                           Marker(
//                             markerId: MarkerId("houseLocation"),
//                             position: _mapCenter,
//                           ),
//                         },
//                       ),
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
//           foregroundColor: isPressed ? Colors.white : Colors.black,
//           backgroundColor: isPressed ? Colors.blue : Colors.grey[200],
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
//         icon: Icon(
//           icon,
//           size: 18.0,
//         ),
//         label: Text(
//           label,
//           style: GoogleFonts.raleway(fontSize: 13),
//         ),
//       ),
//     );
//   }
// }

// class ListHouse extends StatelessWidget {
//   final List<HouseItem> houseItems;
//   final TextEditingController controller;
//   final Function(HouseItem) onHouseSelected;

//   ListHouse({
//     required this.houseItems,
//     required this.controller,
//     required this.onHouseSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: DeviceConfig.getCrossAxisCount(context),
//         childAspectRatio: 0.75,
//         mainAxisSpacing: 16.0,
//         crossAxisSpacing: 16.0,
//       ),
//       itemCount: houseItems.length,
//       itemBuilder: (context, index) {
//         HouseItem houseItem = houseItems[index];
//         return GestureDetector(
//           onTap: () => onHouseSelected(houseItem),
//           child: Card(
//             child: Column(
//               children: [
//                 Image.asset(houseItem.image, fit: BoxFit.cover),
//                 ListTile(
//                   title: Text(houseItem.name, style: GoogleFonts.raleway()),
//                   subtitle: Text('\$${houseItem.price}', style: GoogleFonts.raleway()),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(houseItem.location, style: GoogleFonts.raleway()),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
