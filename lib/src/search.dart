// // import 'package:flutter/material.dart';


// // class SearchScreen extends StatefulWidget {
// //   @override
// //   _SearchScreenState createState() => _SearchScreenState();
// // }

// // class _SearchScreenState extends State<SearchScreen> {
// //   TextEditingController _searchController = TextEditingController();
// //   List<String> _fruits = ['Apple', 'Banana', 'Cherry', 'Date', 'Fig', 'Grape'];
// //   List<String> _filteredFruits = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _filteredFruits = _fruits;
// //     _searchController.addListener(_filterFruits);
// //   }

// //   @override
// //   void dispose() {
// //     _searchController.removeListener(_filterFruits);
// //     _searchController.dispose();
// //     super.dispose();
// //   }

// //   void _filterFruits() {
// //     String query = _searchController.text.toLowerCase();
// //     setState(() {
// //       _filteredFruits = _fruits
// //           .where((fruit) => fruit.toLowerCase().contains(query))
// //           .toList();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Fruit Search')),
// //       body: Column(
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(30),
// //               color: Colors.grey[200],
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: TextField(
// //                 controller: _searchController,
// //                 decoration: InputDecoration(
// //                   hintText: 'Search...',
// //                   border: InputBorder.none,
// //                   prefixIcon: Icon(Icons.search, color: Colors.grey),
// //                 ),
// //               ),
// //             ),
// //           ),
// //            Expanded(
// //              child: ListView.builder(
// //               itemCount: _filteredFruits.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(_filteredFruits[index]),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// // // const MyApp({
// // //     super.key,
// // //     required this.settingsController,
// // //   });

// // import 'package:flutter/material.dart';

// // class SearchPage extends StatefulWidget {
// //   const SearchPage({Key? key}) : super(key: key);

// //   @override
// //   _SearchPageState createState() => _SearchPageState();
// // }

// // class _SearchPageState extends State<SearchPage> {
// //   List<String> values = [
// //     'Hello',
// //     'Hello2',
// //     'Hello3',
// //   ];

// //   List<String> pickedValues = [];

// //   late TextEditingController  controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = TextEditingController();
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     controller.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SizedBox(
// //           width: 300,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               _buildValues(),
// //               const SizedBox(
// //                 height: 30,
// //               ),
// //               _buildSearchBar(),
// //               const SizedBox(
// //                 height: 30,
// //               ),
// //               _buildPickedValues(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildValues() {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: values
// //           .map(
// //             (value) => Container(
// //               padding: const EdgeInsets.symmetric(
// //                 horizontal: 10,
// //                 vertical: 10,
// //               ),
// //               color: Colors.blueGrey,
// //               child: Text(
// //                 value,
// //               ),
// //             ),
// //           )
// //           .toList(),
// //     );
// //   }

// //   Widget _buildSearchBar() {
// //     return TextFormField(
// //       controller: controller,
// //       onFieldSubmitted: search,
// //       decoration: InputDecoration(
// //         hintText: 'Search',
// //         fillColor: Colors.white,
// //         filled: true,
// //         isDense: true,
// //         suffixIcon: GestureDetector(
// //           onTap: () {
// //             search(controller.text);
// //           },
// //           child: const Padding(
// //             padding: EdgeInsets.symmetric(
// //               horizontal: 10,
// //               vertical: 10,
// //             ),
// //             child: Icon(
// //               Icons.search,
// //               size: 30,
// //             ),
// //           ),
// //         ),
// //         focusedBorder: const OutlineInputBorder(
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(5),
// //           ),
// //           borderSide: BorderSide(
// //             width: 1,
// //             color: Colors.blueAccent,
// //           ),
// //         ),
// //         disabledBorder: InputBorder.none,
// //         border: InputBorder.none,
// //         enabledBorder: const OutlineInputBorder(
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(5),
// //           ),
// //           borderSide: BorderSide(
// //             width: 1,
// //             color: Colors.grey,
// //           ),
// //         ),
// //         errorBorder: const OutlineInputBorder(
// //           borderRadius: BorderRadius.all(
// //             Radius.circular(5),
// //           ),
// //           borderSide: BorderSide(
// //             width: 1,
// //             color: Colors.red,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void search(String query) {
// //     final _formatQuery = query.toLowerCase();
// //     final _formatPickedValues = pickedValues
// //         .map(
// //           (e) => e.toLowerCase(),
// //         )
// //         .toList();
// //     final _formatValues = values
// //         .map(
// //           (e) => e.toLowerCase(),
// //         )
// //         .toList();
// //     if (!_formatPickedValues.contains(_formatQuery) &&
// //         _formatValues.contains(_formatQuery)) {
// //       pickedValues.add(query);
// //     }
// //     setState(() {});
// //   }

// //   Widget _buildPickedValues() {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: pickedValues
// //           .map(
// //             (value) => GestureDetector(
// //               onTap: () {
// //                 pickedValues.remove(value);
// //                 setState(() {});
// //               },
// //               child: Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 10,
// //                   vertical: 10,
// //                 ),
// //                 color: Colors.blueAccent,
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Text(
// //                       value,
// //                     ),
// //                     const SizedBox(
// //                       width: 4,
// //                     ),
// //                     const Icon(
// //                       Icons.close,
// //                       size: 20,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           )
// //           .toList(),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Property Search')),
//         body: PropertySearchWidget(),
//       ),
//     );
//   }
// }

// class PropertySearchWidget extends StatefulWidget {
//   @override
//   _PropertySearchWidgetState createState() => _PropertySearchWidgetState();
// }

// class _PropertySearchWidgetState extends State<PropertySearchWidget> {
//   List<String> properties = [
//     'Property A',
//     'Property B',
//     'Property C',
//     // Add more properties as needed
//   ];

//   TextEditingController _searchController = TextEditingController();

//   List<String> filteredProperties = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredProperties.addAll(properties);
//   }

//   void _updateFilteredProperties(String query) {
//     setState(() {
//       filteredProperties = properties.where((property) {
//         return property.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.grey[200],
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               onChanged: _updateFilteredProperties,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search, color: Colors.grey),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredProperties.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(filteredProperties[index]),
//                     // Add any other UI elements you want to display
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Property Search')),
        body: PropertySearchWidget(),
      ),
    );
  }
}

class PropertySearchWidget extends StatefulWidget {
  @override
  _PropertySearchWidgetState createState() => _PropertySearchWidgetState();
}

class _PropertySearchWidgetState extends State<PropertySearchWidget> {
  List<String> properties = [
    'Property A',
    'Property B',
    'Property C',
    // Add more properties as needed
  ];

  TextEditingController _searchController = TextEditingController();

  List<String> filteredProperties = [];

  @override
  void initState() {
    super.initState();
    filteredProperties.addAll(properties);
  }

  void _updateFilteredProperties(String query) {
    setState(() {
      filteredProperties = properties.where((property) {
        return property.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _updateFilteredProperties,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProperties[index]),
                    // Add any other UI elements you want to display
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
