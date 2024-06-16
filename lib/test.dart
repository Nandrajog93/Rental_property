


// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// class ImageSearchScreen extends StatefulWidget {
//   @override
//   _ImageSearchScreenState createState() => _ImageSearchScreenState();
// }

// class _ImageSearchScreenState extends State<ImageSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<ImageItem> _images = [];
//   List<ImageItem> _filteredImages = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeImages();
//   }

//   void _initializeImages() {
//     _images = [
//       ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo6.jpeg', description: 'Description 1'),
//       ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo4.jpeg', description: 'Description 2'),
//       ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg', description: 'Description 3'),
//       // Add more images as needed
//     ];

//     _filteredImages = List.from(_images);
//   }

//   void _filterImages(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredImages = List.from(_images);
//       } else {
//         _filteredImages = _images
//             .where((image) =>
//                 image.description.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Search'),
//       ),
//       body: Column(
//         children: [
//           buildSearchBar(context),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredImages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.asset(_filteredImages[index].imagePath),
//                   title: Text(_filteredImages[index].description),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildSearchBar(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) {
//         double width;

//         if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
//           width = MediaQuery.of(context).size.width * 0.9;
//         } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
//           width = MediaQuery.of(context).size.width * 0.7;
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

//   ImageItem({required this.imagePath, required this.description});
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rental_property/src/calculation.dart';

class ImageSearchScreen extends StatefulWidget {
  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ImageItem> _images = [];
  List<ImageItem> _filteredImages = [];

  List<ImageItem> _images2 = [];
  List<ImageItem> _filteredImages2 = [];

  @override
  void initState() {
    super.initState();
    _initializeImages();
    _initializeImages2();
  }


 

  void _initializeImages() {
    _images = [
      ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo6.jpeg', description: 'Description 1'),
      ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/logo4.jpeg', description: 'Description 2'),
       ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg', description: 'Description 3'),
      // Add more images as needed
    ];

    _filteredImages = List.from(_images);
    
  }

  void _filterImages(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredImages = List.from(_images);
      } else {
        _filteredImages = _images
            .where((image) =>
                image.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,  
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, 
          elevation: 0, 
          title: Image.asset(
                  '/Users/nandrajog/Downloads/test_application/lib/download.png',
                  height: 50, // Adjust the height according to your needs
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
          //Text('Home Tab Content'), 
           Padding(
             padding: const EdgeInsets.all(50),
             child: buildImageGrid2(),
              
           ),
       
          Column(                                           //2nd
            children: [                                    //2nd
              buildSearchBar(context),                      //2nd
              Expanded(child: buildImageGrid()),          //2ns
            ],
          ),
        
             Text(''), // Fire Extinguisher tab content  //3RD
             Text(''),
             Text(''), //   4th
        ],
        )
 
      ),
    );
  }


  Widget buildImageGrid(){

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getCrossAxisCount(context),
      crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,),
        itemCount: _filteredImages.length, 
        itemBuilder: (context,index){
          return GridTile(
            child: Column(
              children: [
                Expanded(child: Image.asset( _filteredImages[index].imagePath,
                                             fit: BoxFit.cover,)
                                             ),
                Padding(padding: EdgeInsets.all(8.0),
                child: Text(
                  _filteredImages[index].description,
                  textAlign: TextAlign.center,
                ),
                ),
              ],
            ),
            );

      },
      );

  }

  int _getCrossAxisCount(BuildContext context) {
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
  Widget buildTabContent(BuildContext context, Color color, IconData icon) {
    return Container(
      color: color,
      child: Center(
        child: Icon(icon, size: 100.0, color: Colors.white),
      ),
    );
  }
  Widget buildSearchBar(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double width;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          width = MediaQuery.of(context).size.width * 0.8;
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          width = MediaQuery.of(context).size.width * 0.6;
        } else {
          width = MediaQuery.of(context).size.width * 0.5;
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterImages,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
    void _initializeImages2() {
    _images2 = [
      ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo.jpeg', description: 'Description 1'),
     // ImageItem(imagePath: '/Users/nandrajog/Downloads/test_application/lib/download.jpeg', description: 'Description 2'),
     //  ImageItem(imagePath:  '/Users/nandrajog/Downloads/test_application/lib/logo5.jpeg', description: 'Description 3'),
      // Add more images as needed
    ];

    _filteredImages2 = List.from(_images2);
  }



    Widget buildImageGrid2(){

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getCrossAxisCount(context),
      crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,),
       itemCount: _filteredImages2.length, 
        itemBuilder: (context,index){
          return GridTile(
            child: Column(
              children: [
                Expanded(child: Image.asset( _filteredImages2[index].imagePath,
                                             fit: BoxFit.cover,)
                                             ),
                Padding(padding: EdgeInsets.all(8.0),
                child: Text(
                  _filteredImages2[index].description,
                  textAlign: TextAlign.center,
                ),
                ),
              ],
            ),
            );

      },
      );

  }
}

class ImageItem {
  final String imagePath;
  final String description;

  ImageItem({required this.imagePath, required this.description});
}









