// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'timer.dart'; // Ensure this file exists and has the Countdown widget implemented

// // class ImageItem {
// //   final String imagePath;
// //   final String description;
// //   final DateTime? expiration_;

// //   ImageItem({
// //     required this.imagePath,
// //     required this.description,
// //     this.expiration_,
// //   });
// // }
// // class DeviceConfig {
// //   static int getCrossAxisCount(BuildContext context) {
// //     var deviceType = getDeviceType(MediaQuery.of(context).size);

// //     switch (deviceType) {
// //       case DeviceScreenType.desktop:
// //         return 4;
// //       case DeviceScreenType.tablet:
// //         return 3;
// //       case DeviceScreenType.mobile:
// //       default:
// //         return 2;
// //     }
// //   }
  


// //   static double getSearchBarWidth(BuildContext context) {
// //     var deviceType = getDeviceType(MediaQuery.of(context).size);

// //     switch (deviceType) {
// //       case DeviceScreenType.mobile:
// //         return MediaQuery.of(context).size.width * 0.8;
// //       case DeviceScreenType.tablet:
// //         return MediaQuery.of(context).size.width * 0.6;
// //       case DeviceScreenType.desktop:
// //       default:
// //         return MediaQuery.of(context).size.width * 0.5;
// //     }
// //   }
// // }

// // class ImageGrid extends StatefulWidget {
// //   final List<ImageItem> images;

// //   const ImageGrid({Key? key, required this.images}) : super(key: key);

// //   @override
// //   State<ImageGrid> createState() => _ImageGridState();
// // }

// // class _ImageGridState extends State<ImageGrid> {
// //   final TextEditingController _searchController = TextEditingController();

// //   late List<ImageItem> _filteredImages;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeImages();
// //   }

// //   void _initializeImages() {
// //     _filteredImages = List.from(widget.images);
// //   }


// //   void _filterImages(String query) {
    
// //     setState(() {
// //       if (query.isEmpty) {
// //         _filteredImages = List.from(_images);
// //       } else {
// //         _filteredImages = _images.where((image) => image.description.toLowerCase().contains(query.toLowerCase())).toList();
// //       }
// //     });
// //   }
// //   int _getCrossAxisCount(BuildContext context) {
// //     var deviceType = getDeviceType(MediaQuery.of(context).size);
// //     switch (deviceType) {
// //       case DeviceScreenType.desktop:
// //         return 4;
// //       case DeviceScreenType.tablet:
// //         return 3;
// //       case DeviceScreenType.mobile:
// //       default:
// //         return 2;
// //     }
// //   }

// //   double _getTextSize(BuildContext context) {
// //     var deviceType = getDeviceType(MediaQuery.of(context).size);
// //     switch (deviceType) {
// //       case DeviceScreenType.desktop:
// //         return 14.0;
// //       case DeviceScreenType.tablet:
// //         return 12.0;
// //       case DeviceScreenType.mobile:
// //       default:
// //         return 12.0;
// //     }
// //   }

// //   double _getPadding(BuildContext context) {
// //     var deviceType = getDeviceType(MediaQuery.of(context).size);
// //     switch (deviceType) {
// //       case DeviceScreenType.desktop:
// //         return 16.0;
// //       case DeviceScreenType.tablet:
// //         return 12.0;
// //       case DeviceScreenType.mobile:
// //       default:
// //         return 8.0;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double textSize = _getTextSize(context);
// //     double padding = _getPadding(context);
// //     return GridView.builder(
// //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: _getCrossAxisCount(context),
// //         crossAxisSpacing: 8.0,
// //         mainAxisSpacing: 8.0,
// //       ),
// //       itemCount: _filteredImages.length,
// //       itemBuilder: (context, index) {
// //         return GridTile(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 child: Image.asset(
// //                   _filteredImages[index].imagePath,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.all(padding),
// //                 child: Text(
// //                   _filteredImages[index].description,
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(fontSize: textSize),
// //                 ),
// //               ),
// //               if (_filteredImages[index].expiration_ != null)
// //                 Countdown(
// //                   expiration: _filteredImages[index].expiration_!,
// //                   monthlyPrice: 100,
// //                   textSize: textSize,
// //                 ),
// //               if (_filteredImages[index].expiration_ == null)
// //                 Text(
// //                   'No expiration set',
// //                   style: TextStyle(fontSize: textSize),
// //                   textAlign: TextAlign.center,
// //                 ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }




// //     @override
// //   Widget search(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Container(
// //         width: DeviceConfig.getSearchBarWidth(context),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(30),
// //           color: Colors.grey[200],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           child: TextField(
// //             controller: _searchController,
// //             onChanged: _filteredImages, // This triggers filtering when text changes
// //             decoration: InputDecoration(
// //               hintText: 'Search...',
// //               border: InputBorder.none,
// //               prefixIcon: Icon(Icons.search, color: Colors.grey),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// List<ImageItem> filterImages(List<ImageItem> images, String query) {
//   if (query.isEmpty) {
//     return List.from(images);
//   } else {
//     return images.where((image) => image.description.toLowerCase().contains(query.toLowerCase())).toList();
//   }
// }

// void updateFilteredImages(Function setStateCallback, List<ImageItem> images, String query) {
//   setStateCallback(() {
//     _filteredImages = filterImages(images, query);
//   });
// }





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


// // import 'package:flutter/material.dart';
// // import 'device_config.dart';
// // import 'timer.dart'; // Ensure this file exists and has the Countdown widget implemented

// class ImageItem {
//   final String imagePath;
//   final String description;
//   final DateTime? expiration_;

//   ImageItem({
//     required this.imagePath,
//     required this.description,
//     this.expiration_,
//   });
// }

// class ImageGrid extends StatefulWidget {
//   final List<ImageItem> images;

//   const ImageGrid({Key? key, required this.images}) : super(key: key);

//   @override
//   State<ImageGrid> createState() => _ImageGridState();
// }

// class _ImageGridState extends State<ImageGrid> {
//   final TextEditingController _searchController = TextEditingController();
//   late List<ImageItem> _filteredImages;

//   @override
//   void initState() {
//     super.initState();
//     _initializeImages();
//   }

//   void _initializeImages() {
//     _filteredImages = List.from(widget.images);
//   }

//   void _filterImages(String query) {
//     setState(() {
//       _filteredImages = filterImages(widget.images, query);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double textSize = DeviceConfig.getTextSize(context);
//     double padding = DeviceConfig.getPadding(context);

//     return Column(
//       children: [
//         Padding(
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
//         ),
//         Expanded(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: DeviceConfig.getCrossAxisCount(context),
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             itemCount: _filteredImages.length,
//             itemBuilder: (context, index) {
//               return GridTile(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Image.asset(
//                         _filteredImages[index].imagePath,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(padding),
//                       child: Text(
//                         _filteredImages[index].description,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: textSize),
//                       ),
//                     ),
//                     if (_filteredImages[index].expiration_ != null)
//                       Countdown(
//                         expiration: _filteredImages[index].expiration_!,
//                         monthlyPrice: 100,
//                         textSize: textSize,
//                       ),
//                     if (_filteredImages[index].expiration_ == null)
//                       Text(
//                         'No expiration set',
//                         style: TextStyle(fontSize: textSize),
//                         textAlign: TextAlign.center,
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
// // Ensure this file exists and has the ImageGrid class implemented

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<ImageItem> images = [
//       ImageItem(imagePath: 'assets/image1.jpg', description: 'Image 1', expiration_: DateTime.now().add(Duration(days: 1))),
//       ImageItem(imagePath: 'assets/image2.jpg', description: 'Image 2', expiration_: null),
//       // Add more images here
//     ];

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Image Grid with Search'),
//         ),
//         body: ImageGrid(images: images),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'timer.dart'; // Ensure this file exists and has the Countdown widget implemented

class ImageItem {
  final String imagePath;
  final String description;
  final DateTime? expiration_;

  ImageItem({
    required this.imagePath,
    required this.description,
    this.expiration_,
  });
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

class ImageGrid extends StatefulWidget {
  final List<ImageItem> images;

  const ImageGrid({Key? key, required this.images}) : super(key: key);

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final TextEditingController _searchController = TextEditingController();
  late List<ImageItem> _filteredImages;

  @override
  void initState() {
    super.initState();
    _initializeImages();
    _searchController.addListener(_onSearch);
  }

  void _initializeImages() {
    _filteredImages = List.from(widget.images);
  }

  void _onSearch() {
    final query = _searchController.text;
    setState(() {
      if (query.isEmpty) {
        _filteredImages = List.from(widget.images);
      } else {
        _filteredImages = widget.images
            .where((image) =>
                image.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearch);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: DeviceConfig.getSearchBarWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DeviceConfig.getCrossAxisCount(context),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: _filteredImages.length,
            itemBuilder: (context, index) {
              return GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        _filteredImages[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Text(
                        _filteredImages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: textSize),
                      ),
                    ),
                    if (_filteredImages[index].expiration_ != null)
                      Countdown(
                        expiration: _filteredImages[index].expiration_!,
                        monthlyPrice: 100,
                        textSize: textSize,
                      ),
                    if (_filteredImages[index].expiration_ == null)
                      Text(
                        'No expiration set',
                        style: TextStyle(fontSize: textSize),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
