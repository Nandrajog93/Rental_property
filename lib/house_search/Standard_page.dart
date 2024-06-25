

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_property/house_search/Payment.dart';
import 'package:rental_property/src/timer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/services.dart' show rootBundle;

class HouseItem {
  final String name;
  final double price;
  final String imagePath;
  final String location;
  final String description;
  final double latitude;
  final double longitude;
  final String address ;
  final String extraimage1;
  final String extraimage2;
  final String extraimage3;
  final String extraimage4;
  final String extraimage5;

  HouseItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.extraimage1,
    required this.extraimage2,
    required this.extraimage3,
    required this.extraimage4,
    required this.extraimage5,
  });

  factory HouseItem.fromCsv(List<dynamic> row) {
    return HouseItem(
      name: row[1].toString(),
      price: row[2],
      imagePath: row[8].toString(),
      location: row[7].toString(),
      description: row[0].toString(),
      latitude: row[5],
      longitude: row[6],
      address: row[4].toString(),
      extraimage1: row[9].toString(),
      extraimage2: row[10].toString(),
      extraimage3: row[11].toString(),
      extraimage4: row[12].toString(),
      extraimage5: row[13].toString(),
    );
  }

  @override
  String toString() {
    return 'HouseItem(name: $name, price: $price, imagePath: $imagePath, location: $location, description: $description, latitude: $latitude, longitude: $longitude)';
  }
}
class  DeviceConfig{
  static double getTextSize(BuildContext contex){
    var deviceType = getDeviceType(MediaQuery.of(contex).size);


    switch (deviceType){
      case DeviceScreenType.desktop:
        return 40;
      case DeviceScreenType.tablet:
        return 30;
      case DeviceScreenType.mobile:
      default:  //error handling
        return 20;
    }
  }
///home/utente/rental_property/lib/download.png

static double getPadding(BuildContext context){
  var deviceType = getDeviceType(MediaQuery.of(context).size);

  switch (deviceType){
    case DeviceScreenType.desktop:
      return 35;
    case DeviceScreenType.tablet:
      return 25;
    case DeviceScreenType.mobile:
    default:
      return 10;
  }

}

  static double getCardWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 1200.0;
      case DeviceScreenType.tablet:
        return 600.0;
      case DeviceScreenType.mobile:
      default:
        return 350.0;
    }
  }

  static double getCardHeight(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 800.0;
      case DeviceScreenType.tablet:
        return 550.0;
      case DeviceScreenType.mobile:
      default:
        return 560.0;
    }
  }



  static double getImageWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 350.0;
      case DeviceScreenType.tablet:
        return 200.0;
      case DeviceScreenType.mobile:
      default:
        return 150.0;
    }
  }


  static double getImageHeight(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 250.0;
      case DeviceScreenType.tablet:
        return 200.0;
      case DeviceScreenType.mobile:
      default:
        return 150.0;
    }
  }


}
class Standard_page extends StatefulWidget {
  final String image1;
  final String location;
  final String description;
  // final double latitude;
  // final double longitude;
  final String name;
  final String address;
  final String price;
  final String pageText;
  final int? expiration1;

  const Standard_page ({required this.expiration1,required this.image1, required this.location, required this.description, required this.name, required this.address, required this.price, required this.pageText});

  @override
  State<StatefulWidget> createState() => _Standard_pageState();
  // final  String pageText   =  pageText; 


}

class _Standard_pageState extends State<Standard_page> {



  


  @override
  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);
    double cardWidth= DeviceConfig.getCardWidth(context);
    double cardHeight = DeviceConfig.getCardHeight(context);
    Color cardColor = Colors.white; 

    return Container(
      

      //  appBar: AppBar(title: Center(child: Text(widget.pageText))),
      child : Center(
        
        child: Card(
          color: cardColor,
          
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: padding,
          vertical: padding/2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),

          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ScreenTypeLayout(
                
                // mobile: ,
              // tablet: ,
                mobile: buildMobileLayout(textSize,padding),
                tablet: buildTabletLayout(textSize, padding),
                 desktop: buildDesktopLayout(textSize , padding),
                
                ),
            ),
  
          ),
        ),
      )
 );
  }



Widget buildDesktopLayout (double textSize, double padding) {
  return  Scaffold(

   body: Center(
      child: Column(
        children: [
          Wrap(
            children: [

              Image.asset(widget.image1),

        SizedBox(height: 20),
      _buildTextInfo(Colors.white, 
                    widget.name,
                    widget.description, 
                    widget.location, 
                    widget.address,
                    // widget.latitude as String,
                    // widget.longitude as String,
                    widget.price,
                    widget.expiration1),
            
          
            ],
          ),]
      ),
   ),
  );
}
Widget _buildTextInfo(Color cardColor, String name, String description ,String location, 
                        String address,  String price, int? expiration1) {
  return Container(
    color: cardColor,
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
        Text(name, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(description, style: TextStyle(color: Colors.grey, fontSize: 16)),
        SizedBox(height: 5),
        Text(location, style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 5),
        Text(address.toString(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text('€ '+price.toString()+'.00', style: TextStyle(color: Colors.grey, fontSize: 14)),
                SizedBox(height: 20),
        
        if (expiration1 != null)
          Padding(
              padding: EdgeInsets.all(10),
              child: Countdown(expiration: DateTime.now().add(Duration(hours: expiration1)),monthlyPrice: 40000, textSize:5)
              ),
      

 
        // Text('Expiration: $expiration'),
        // Text('€ '+expiration.toString()+'.00', style: TextStyle(color: Colors.grey, fontSize: 14)),
        //         SizedBox(height: 20),
        

        ElevatedButton(style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Change text (and icon) color here
  ),
                        child: Text('Payment'),
                        onPressed: (){Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Payment(),
                       ));
                      
                       },
                          )  

      ],
        ),
      ],
    ),

    
  );
}




Widget buildTabletLayout(double textSize, double padding) {

return Scaffold();
}


Widget buildMobileLayout(double textSize, double padding) {

return Scaffold();
}

}


















































