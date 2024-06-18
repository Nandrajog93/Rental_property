import 'package:flutter/material.dart';

class HouseItem {
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
  final double latitude;
  final double longitude;
  //final TextEditingController search;

  HouseItem( {
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
    required this.latitude,
    required this.longitude
   // required TextEditingController this.search,
  });
}

class ListHouse extends StatefulWidget {
  final List<HouseItem> houseItems;
  final TextEditingController controller;
  final Function(HouseItem) onHouseSelected;

  const ListHouse({
    Key? key,
    required this.houseItems,
    required this.controller,
    required this.onHouseSelected,
  }) : super(key: key);

  @override
  _ListHouseState createState() => _ListHouseState();
}

class _ListHouseState extends State<ListHouse> {
  late List<HouseItem> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.houseItems); // Initialize with all items
    widget.controller.addListener(_onSearch); // Listen to changes in search text
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSearch); // Clean up listener
    super.dispose();
  }

  void _onSearch() {
    final query = widget.controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(widget.houseItems); // Reset to all items
      } else {
        _filteredItems = widget.houseItems.where((item) =>
            item.name.toLowerCase().contains(query)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _filteredItems.length,
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              widget.onHouseSelected(item); // Notify parent widget of selection
            },
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
                        item.image,
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
                              item.brand,
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
                                  item.name,
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
                                  item.fuel,
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
                                  item.color,
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
                                  item.rating,
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
                                  item.location,
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
                            '${item.price}/week',
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
        );
      },
    );
  }

  Widget favoriteButton(IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey, backgroundColor: Colors.transparent, shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        side: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      onPressed: () {},
      child: Icon(
        icon,
        color: Colors.grey,
        size: 20.0,
      ),
    );
  }
}
