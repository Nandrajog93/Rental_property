import 'package:flutter/material.dart';
import 'package:rental_property/house_search/houses.dart';

class ListCar extends StatefulWidget {
  //final TextEditingController searchController;
  //final List<CarItem> images;


  
  //const ListCar({requ});
  @override
  _ListCarState createState() => _ListCarState();
  
  
}



class _ListCarState extends State<ListCar> {
 // late List<CarItem> allCars;


  // @override
  // void initState() {
  //   super.initState();
  //   _initializeImages();
  //   widget.searchController.addListener(_onSearch);
  // }

  // void _initializeImages() {
  //   _filteredImages = List.from(widget.images);
  // }

  // void _onSearch() {
  //   final query = widget.searchController.text;
  //   setState(() {
  //     if (query.isEmpty) {
  //       _filteredImages = List.from(widget.images);
  //     } else {
  //       _filteredImages = widget.images
  //           .where((image) =>
  //               images.name.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     }
  //   });
  // }
    
  bool _hasBeenPressed2 = false;




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCars.cars.length,
      itemBuilder: (ctx, i) => Padding(
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
                      allCars.cars[i].image,
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
                            allCars.cars[i].brand,
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
                                allCars.cars[i].name,
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
                                allCars.cars[i].fuel,
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
                                allCars.cars[i].color,
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
                                allCars.cars[i].rating,
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
                                allCars.cars[i].location,
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
                          '${allCars.cars[i].price}/week',
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

