// import 'dart:async';
// import 'package:flutter/material.dart';
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
// }

// // class ImageItem {
// //   final String imagePath;
// //   final String description;
// //   final DateTime? expiration_;

// //   ImageItem({required this.imagePath, required this.description, required this.expiration_});
// // }

// // class ImageSearch extends StatefulWidget {
// //   final ValueChanged<String> onQueryChanged;

// //   const ImageSearch({Key? key, required this.onQueryChanged}) : super(key: key);

// //   @override
// //   State<ImageSearch> createState() => _ImageSearchState();
// // }

// // class _ImageSearchState extends State<ImageSearch> {
// //   final TextEditingController _searchController = TextEditingController();




// //   void _filterImages(String query) {
// //     widget.onQueryChanged(query);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ResponsiveBuilder(
// //       builder: (context, sizingInformation) {
// //         double width;

// //         if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
// //           width = MediaQuery.of(context).size.width * 0.8;
// //         } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
// //           width = MediaQuery.of(context).size.width * 0.6;
// //         } else {
// //           width = MediaQuery.of(context).size.width * 0.5;
// //         }

// //         return Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Container(
// //             width: width,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(30),
// //               color: Colors.grey[200],
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: TextField(
// //                 controller: _searchController,
// //                 onChanged: _filterImages,
// //                 decoration: InputDecoration(
// //                   hintText: 'Search...',
// //                   border: InputBorder.none,
// //                   prefixIcon: Icon(Icons.search, color: Colors.grey),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// class ImageSearch extends StatefulWidget {
//   final ValueChanged<String> onQueryChanged;

//   const ImageSearch({Key? key, required this.onQueryChanged}) : super(key: key);

//   @override
//   State<ImageSearch> createState() => _ImageSearchState();
// }
// class _ImageSearchState extends State<ImageSearch> {
//   final TextEditingController _searchController = TextEditingController();

//   void _filterImages(String query) {
//     widget.onQueryChanged(query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         width: DeviceConfig.getSearchBarWidth(context),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.grey[200],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: TextField(
//             controller: _searchController,
//             onChanged: _filterImages, // This triggers filtering when text changes
//             decoration: InputDecoration(
//               hintText: 'Search...',
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


