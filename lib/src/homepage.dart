
// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:test_application/src/Grid_search_bar.dart';
// //import 'package:test_application/src/Image_Grid.dart';import 'package:test_application/src/settings/searchBar.dart';
// import 'timer.dart'; // Assuming you have a separate file for the Countdown widget

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// // class ImageItem {
// //   final String imagePath;
// //   final String description;
// //   final DateTime? expiration_;

// //   ImageItem({required this.imagePath, required this.description, this.expiration_});
// // }

// class _SearchPageState extends State<SearchPage> {
//   // List<ImageItem> _images2 = [];
//   // List<ImageItem> _filteredImages2 = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _initializeImages();
     
//   // }

//   // void _initializeImages() {
//   //   _images2 = [
//   //     ImageItem(
//   //       imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo6.jpeg',
//   //       description: 'Description 1',
//   //       expiration_: DateTime.now().add(Duration(hours: 1)),
//   //     ),
//   //     ImageItem(
//   //       imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo4.jpeg',
//   //       description: 'Description 2',
//   //       expiration_: DateTime.now().add(Duration(hours: 3)),
//   //     ),
//   //     ImageItem(
//   //       imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg',
//   //       description: 'Description 3',
//   //       expiration_: DateTime.now().add(Duration(hours: 7)),
//   //     ),
      
//   //   ];


//   //   _filteredImages2 = List.from(_images2);

//   // }

//   // int _getCrossAxisCount(BuildContext context) {
//   //   var deviceType = getDeviceType(MediaQuery.of(context).size);

//   //   switch (deviceType) {
//   //     case DeviceScreenType.desktop:
//   //       return 4;
//   //     case DeviceScreenType.tablet:
//   //       return 3;
//   //     case DeviceScreenType.mobile:
//   //     default:
//   //       return 2;
//   //   }
//   // }

//   // double _getTextSize(BuildContext context) {
//   //   var deviceType = getDeviceType(MediaQuery.of(context).size);

//   //   switch (deviceType) {
//   //     case DeviceScreenType.desktop:
//   //       return 14.0;
//   //     case DeviceScreenType.tablet:
//   //       return 12.0;
//   //     case DeviceScreenType.mobile:
//   //     default:
//   //       return 12.0;
//   //   }
//   // }

//   // double _getPadding(BuildContext context) {
//   //   var deviceType = getDeviceType(MediaQuery.of(context).size);

//   //   switch (deviceType) {
//   //     case DeviceScreenType.desktop:
//   //       return 16.0;
//   //     case DeviceScreenType.tablet:
//   //       return 12.0;
//   //     case DeviceScreenType.mobile:
//   //     default:
//   //       return 8.0;
//   //   }
//   // }



// //   void _filterImages(String query) {
// //   setState(() {
// //     if (query.isEmpty) {
// //       _filteredImages2 = List.from(_images2); // Reset to original list when query is empty
// //     } else {
// //       _filteredImages2 = _images2.where((image) =>
// //           image.description.toLowerCase().contains(query.toLowerCase())).toList();
// //     }
// //   });
// // }


//   @override
//   Widget build(BuildContext context) {
//     //double textSize = _getTextSize(context);
//     //double padding = _getPadding(context);

//     return Scaffold(
//       body:  ImageGrid(
//               images: [
//                 ImageItem(
//                   imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo6.jpeg',
//                   description: 'Description 1',
//                   expiration_: DateTime.now().add(Duration(hours: 1)),
//                 ),
//                 ImageItem(
//                   imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo4.jpeg',
//                   description: 'Description 2',
//                   expiration_: DateTime.now().add(Duration(hours: 3)),
//                 ),
//                 ImageItem(
//                   imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg',
//                   description: 'Description 3',
//                   expiration_: DateTime.now().add(Duration(hours: 7)),
//                 ),
//               ],
//             )
//     );
//   }
// }





//           // Expanded( // Add Expanded widget here
//           //   child: Padding(
//           //     padding: EdgeInsets.all(padding),
//           //     child: GridView.builder(
//           //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //         crossAxisCount: _getCrossAxisCount(context),
//           //         crossAxisSpacing: 8.0,
//           //         mainAxisSpacing: 8.0,
//           //       ),
//           //       itemCount: _filteredImages2.length,
//           //       itemBuilder: (context, index) {
//           //         return GridTile(
//           //           child: Column(
//           //             mainAxisAlignment: MainAxisAlignment.center,
//           //             crossAxisAlignment: CrossAxisAlignment.center,
//           //             children: [
//           //              Expanded(
//           //                     child: Image.asset(
//           //                       _filteredImages2[index].imagePath,
//           //                       fit: BoxFit.cover,
//           //                     ),
//           //                   ),
//           //               // Container(
//           //               //   padding: EdgeInsets.all(padding),    Instead of container use Expand 
//           //               //   child: Image.asset(
//           //               //     _filteredImages2[index].imagePath,
//           //               //     fit: BoxFit.contain,
//           //               //   ),
//           //               // ),
//           //               Padding(
//           //                 padding: EdgeInsets.all(padding),
//           //                 child: Text(
//           //                   _filteredImages2[index].description,
//           //                   textAlign: TextAlign.center,
//           //                   style: TextStyle(fontSize: textSize),
//           //                 ),
//           //               ),
//           //               if (_filteredImages2[index].expiration_ != null)
//           //                 Countdown(
//           //                   expiration: _filteredImages2[index].expiration_!,
//           //                   monthlyPrice: 100,
//           //                   textSize: textSize,
//           //                 ),
//           //               if (_filteredImages2[index].expiration_ == null)
//           //                 Text(
//           //                   'No expiration set',
//           //                   style: TextStyle(fontSize: textSize),
//           //                   textAlign: TextAlign.center,
//           //                 ),
//           //             ],
//           //           ),
//           //         );
//           //       },
//           //     ),
//           //   ),
//           // ),