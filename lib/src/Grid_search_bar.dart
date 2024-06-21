import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class ImageItem {
  final String imagePath;
  final String description;
  final DateTime? expiration;

  ImageItem({
    required this.imagePath,
    required this.description,
    this.expiration,
  });

  factory ImageItem.fromCsv(List<dynamic> row) {
    return ImageItem(
      imagePath: row.length > 1 ? row[1].toString() : '',
      description: row.length > 3 ? row[3].toString() : '',
      expiration: row.length > 3 && row[3] != null ? DateTime.tryParse(row[3]) : null,
    );
  }

 // @override
 // String toString() {
  //  return 'ImageItem(imagePath: $imagePath, description: $description, expiration: $expiration)';
  //}
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


  static double getImageHeight(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.mobile:
        return 200;
      case DeviceScreenType.tablet:
        return 300;
      case DeviceScreenType.desktop:
      default:
        return 100;
    }
  }


    static double getImageWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.mobile:
        return 200;
      case DeviceScreenType.tablet:
        return 300;
      case DeviceScreenType.desktop:
      default:
        return 300;
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
  const ImageGrid({Key? key}) : super(key: key);

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final TextEditingController _searchController = TextEditingController();
  List<ImageItem> _allImages = [];
  List<ImageItem> _filteredImages = [];
  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadCsvData(); // Initiate data loading
  }

void _loadCsvData() async {
  try {
    // Load raw CSV data from the file
    final rawData = await rootBundle.loadString('/home/utente/rental_property/lib/House_dataset/socal3.csv');
    //print('Raw CSV Data:\n$rawData'); // Debug raw CSV data

    // Ensure each line is treated as a separate row
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(rawData, eol: '\n');

    // Debug parsed rows to ensure correct splitting
    //print('Parsed rows: $rowsAsListOfValues');

    // Convert to ImageItem objects
    List<ImageItem> imageItems = rowsAsListOfValues.map((row) {
     // print('Row: $row'); // Debug each row
      return ImageItem.fromCsv(row);
    }).toList();

   // print('Image Items: $imageItems'); // Debug ImageItem objects

    setState(() {
      _allImages = imageItems;
      _filteredImages = List.from(imageItems); // Ensure _filteredImages is initially populated
      _isDataLoaded = true; // Data loading complete
    });

  } catch (e) {
    print('Error loading CSV data: $e');
    setState(() {
      _isDataLoaded = true; // Even if there's an error, we stop the loading spinner
    });
  }
}
  void _onSearch() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredImages = List.from(_allImages); // Show all images if query is empty
      } else {
        _filteredImages = _allImages.where((image) => image.description.toLowerCase().contains(query)).toList();
      }
    });

    print('Filtered Images: $_filteredImages'); // Check if filtered images are correct
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearch);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDataLoaded) {
      return Center(child: CircularProgressIndicator());
    }

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
                onChanged: (value) {
                  _onSearch(); // Call _onSearch on every text change
                },
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
                        width: DeviceConfig.getImageWidth(context),
                        height: DeviceConfig.getImageHeight(context),
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
