// // import 'package:flutter/material.dart';
// // import 'dart:async';

// // // class Countdown extends StatefulWidget {
// // //   final DateTime expiration;
// // //   final double? monthlyPrice;

// // //   Countdown({required this.expiration, this.monthlyPrice});

// // //   @override
// // //   _CountdownState createState() => _CountdownState();
// // // }

// // // class _CountdownState extends State<Countdown> {
// // //   late Timer _timer;
// // //   late Duration _timeLeft;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _timeLeft = _calculateTimeLeft(widget.expiration);
// // //     _startTimer();
// // //   }

// // //   void _startTimer() {
// // //     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
// // //       setState(() {
// // //         _timeLeft = _calculateTimeLeft(widget.expiration);
// // //       });
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _timer.cancel();
// // //     super.dispose();
// // //   }

// // //   Duration _calculateTimeLeft(DateTime expiration) {
// // //     final now = DateTime.now();
// // //     final difference = expiration.difference(now);

// // //     if (difference.isNegative) {
// // //       return Duration.zero;
// // //     }

// // //     return difference;
// // //   }

// // //   String _formatTime(int time) {
// // //     return time < 10 ? '0$time' : time.toString();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final hours = _timeLeft.inHours;
// // //     final minutes = _timeLeft.inMinutes % 60;
// // //     final seconds = _timeLeft.inSeconds % 60;

// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Text(
// // //           'Scadenza: ${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
// // //           style: TextStyle(fontSize: 16),
// // //         ),
// // //         if (widget.monthlyPrice != null)
// // //           Text(
// // //             'Prezzo mensile: \$${widget.monthlyPrice}',
// // //             style: TextStyle(fontSize: 16),
// // //           ),
// // //       ],
// // //     );
// // //   }
// // // }


// // class Countdown extends StatefulWidget {
// //   final DateTime expiration;
// //   final double? monthlyPrice;

// //   Countdown({required this.expiration, this.monthlyPrice});

// //   @override
// //   _CountdownState createState() => _CountdownState();
// // }

// // class _CountdownState extends State<Countdown> {
// //   late Timer _timer;
// //   late Duration _timeLeft;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _timeLeft = _calculateTimeLeft(widget.expiration);
// //     _startTimer();
// //   }

// //   void _startTimer() {
// //     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
// //       setState(() {
// //         _timeLeft = _calculateTimeLeft(widget.expiration);
// //       });
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _timer.cancel();
// //     super.dispose();
// //   }

// //   Duration _calculateTimeLeft(DateTime expiration) {
// //     final now = DateTime.now();
// //     final difference = expiration.difference(now);

// //     if (difference.isNegative) {
// //       return Duration.zero;
// //     }

// //     return difference;
// //   }

// //   String _formatTime(int time) {
// //     return time < 10 ? '0$time' : time.toString();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final hours = _timeLeft.inHours;
// //     final minutes = _timeLeft.inMinutes % 60;
// //     final seconds = _timeLeft.inSeconds % 60;

// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Scadenza: ${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
// //           style: TextStyle(fontSize: 16),
// //         ),
// //         if (widget.monthlyPrice != null)
// //           Text(
// //             'Prezzo mensile: \$${widget.monthlyPrice}',
// //             style: TextStyle(fontSize: 16),
// //           ),
// //       ],
// //     );
// //   }
// // }


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:test_application/src/calculation.dart';

// class ImageSearchScreen extends StatefulWidget {
//   @override
//   _ImageSearchScreenState createState() => _ImageSearchScreenState();
// }

// class _ImageSearchScreenState extends State<ImageSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<ImageItem> _images = [];
//   List<ImageItem> _filteredImages = [];

//   List<ImageItem> _images2 = [];
//   List<ImageItem> _filteredImages2 = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeImages();
//     _initializeImages2();
//   }

//   void _initializeImages() {
//     _images = [
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo6.jpeg', description: 'Description 1',
//       expiration_: null ),
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo4.jpeg', description: 'Description 2',
//       expiration_: null),
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg', description: 'Description 3',
//       expiration_: null),
//     ];

//     _filteredImages = List.from(_images);
//   }

//   void _initializeImages2() {
//     _images2 = [
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo.jpeg', 
//       description: 'Description 1',
//       expiration_: DateTime.now().add(Duration(hours: 1))),
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg', description: 'Description 3',
//       expiration_: DateTime.now().add(Duration(hours: 6, minutes: 30))),
      
//     ];

//     _filteredImages2 = List.from(_images2);
//   }

//   void _filterImages(String query) {
    
//     setState(() {
//       if (query.isEmpty) {
//         _filteredImages = List.from(_images);
//       } else {
//         _filteredImages = _images.where((image) => image.description.toLowerCase().contains(query.toLowerCase())).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Image.asset(
//             '/Users/nandrajog/Downloads/test_application/lib/download.png',
//             height: 50,
//           ),
//           bottom: const TabBar(
//             indicatorColor: Colors.lightBlue,
//             indicatorWeight: 4.0,
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Tab(icon: Icon(Icons.home)),
//               Tab(icon: Icon(Icons.search)),
//               Tab(icon: Icon(Icons.backpack)),
//               Tab(icon: Icon(Icons.fire_extinguisher)),
//               Tab(icon: Icon(Icons.hail)),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(50),
//               child: buildImageGrid2(),
//             ),
//             Column(
//               children: [
//                 buildSearchBar(context),
//                 Expanded(child: buildImageGrid()),
//               ],
//             ),
//             Text(''),
//             Text(''),
//             Text(''),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildImageGrid() {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: _getCrossAxisCount(context),
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//       ),
//       itemCount: _filteredImages.length,
//       itemBuilder: (context, index) {
//         return GridTile(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Image.asset(
//                   _filteredImages[index].imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0), 
//                 child: Text(
//                   _filteredImages[index].description,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget buildImageGrid2() {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: _getCrossAxisCount(context),
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//       ),
//       itemCount: _filteredImages2.length,
//       itemBuilder: (context, index) {
//         return GridTile(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Image.asset(
//                   _filteredImages2[index].imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   _filteredImages2[index].description,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//                if (_filteredImages2[index].expiration_ != null)
//                 Countdown(
//                   expiration: _filteredImages2[index].expiration_!,
//                   monthlyPrice: 100,
//                 ),
//               if (_filteredImages2[index].expiration_ == null)
//                 Text(
//                   'No expiration set',
//                   style: TextStyle(fontSize: 16),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   int _getCrossAxisCount(BuildContext context) {
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

//   Widget buildTabContent(BuildContext context, Color color, IconData icon) {
//     return Container(
//       color: color,
//       child: Center(
//         child: Icon(icon, size: 100.0, color: Colors.white),
//       ),
//     );
//   }

//   Widget buildSearchBar(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) {
//         double width;

//         if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
//           width = MediaQuery.of(context).size.width * 0.8;
//         } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
//           width = MediaQuery.of(context).size.width * 0.6;
//         } else {
//           width = MediaQuery.of(context).size.width * 0.5;
//         }

//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.grey[200],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: _filterImages,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class ImageItem {
//   final String imagePath;
//   final String description;
//   final DateTime? expiration_;

//   ImageItem({required this.imagePath, required this.description,required this.expiration_});
// }

// class Countdown extends StatefulWidget {
//   final DateTime expiration;
//   final double? monthlyPrice;

//   Countdown({required this.expiration, this.monthlyPrice});

//   @override
//   _CountdownState createState() => _CountdownState();
// }

// class _CountdownState extends State<Countdown> {
//   late Timer _timer;
//   late Duration _timeLeft;

//   @override
//   void initState() {
//     super.initState();
//     _timeLeft = _calculateTimeLeft(widget.expiration);
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _timeLeft = _calculateTimeLeft(widget.expiration);
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   Duration _calculateTimeLeft(DateTime expiration) {
//     final now = DateTime.now();
//     final difference = expiration.difference(now);

//     if (difference.isNegative) {
//       return Duration.zero;
//     }

//     return difference;
//   }

//   String _formatTime(int time) {
//     return time < 10 ? '0$time' : time.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final hours = _timeLeft.inHours;
//     final minutes = _timeLeft.inMinutes % 60;
//     final seconds = _timeLeft.inSeconds % 60;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Scadenza: ${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}',
//           style: TextStyle(fontSize: 16),
//         ),
//         if (widget.monthlyPrice != null)
//           Text(
//             'Prezzo mensile: \$${widget.monthlyPrice}',
//             style: TextStyle(fontSize: 16),
//           ),
//       ],
//     );
//   }
// }




