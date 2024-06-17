import 'package:flutter/material.dart';

class CarItem {
  final String name;
  final double price;
  final String image;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String rating;
  final String location;
  final String description;
  //final TextEditingController search;

  CarItem( {
    required this.name,
    required this.price,
    required this.image,
    required this.color,
    required this.gearbox,
    required this.fuel,
    required this.brand,
    required this.rating,
    required this.location,
    required this.description,
   // required TextEditingController this.search,
  });
}

class ListCar extends StatefulWidget {
  final List<CarItem> carItems;
  final TextEditingController controller;

  const ListCar({Key? key, required this.carItems, required this.controller}) : super(key: key);

  @override
  State<ListCar> createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {
  late List<CarItem> _filteredImages;
  late TextEditingController _searchController; 
 // final TextEditingController controller = TextEditingController();
  bool _hasBeenPressed2 = false;

  @override
  void initState() {
    super.initState();
    _filteredImages = List.from(widget.carItems);
    _searchController = widget.controller; // Initialize _searchController
    _searchController.addListener(_onSearch); // Add listener to _searchController
  }

    void _onSearch() {
    final query = _searchController.text;
    setState(() {
      if (query.isEmpty) {
        _filteredImages = List.from(widget.carItems);
      } else {
        _filteredImages = widget.carItems
            .where((item) =>
                item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }


  // @override
  // void initState() {
  //   super.initState();
  //   _initializeImages();
  //   _searchController.addListener(_onSearch);
  // }

  // void _initializeImages() {
  //   _filteredImages = List.from(widget.carItems);
  // }

  // void _onSearch() {
  //   final query = _searchController.text;
  //   setState(() {
  //     if (query.isEmpty) {
  //       _filteredImages = List.from(widget.carItems);
  //     } else {
  //       _filteredImages = widget.carItems
  //           .where((image) =>
  //               image.name.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     }
  //   });
  // }

  @override
  void dispose() {
    _searchController.removeListener(_onSearch);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: _filteredImages.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: Container(
            height: 180,
            width: double.maxFinite,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      _filteredImages[i].image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover, // Adjust based on your image aspect ratio
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _filteredImages[i].brand,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.circle, color: Colors.grey, size: 10),
                              SizedBox(width: 5),
                              Text(
                                _filteredImages[i].name,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.circle, color: Colors.grey, size: 10),
                              SizedBox(width: 5),
                              Text(
                                _filteredImages[i].fuel,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.circle, color: Colors.grey, size: 10),
                              SizedBox(width: 5),
                              Text(
                                _filteredImages[i].color,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 14),
                              SizedBox(width: 5),
                              Text(
                                _filteredImages[i].rating,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey, size: 14),
                              SizedBox(width: 5),
                              Text(
                                _filteredImages[i].location,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        favoriteButton(Icons.favorite),
                        SizedBox(height: 10),
                        Text(
                          '${_filteredImages[i].price}/week',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget favoriteButton(IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _hasBeenPressed2 ? Color(0xFF3023AE) : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        side: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      onPressed: () {
        setState(() {
          _hasBeenPressed2 = !_hasBeenPressed2;
        });
      },
      child: Icon(
        icon,
        color: _hasBeenPressed2 ? Colors.white : Colors.grey,
        size: 20.0,
      ),
    );
  }
}
