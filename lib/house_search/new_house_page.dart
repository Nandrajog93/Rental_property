

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_property/house_search/Payment.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/services.dart' show rootBundle;

// class MoreInfo{
//   final String image1;
//   final String image2;
//   final String image3;
//   final String image4;
//   final String image5;

//     MoreInfo({
//     required this.image1,
//     required this.image2,
//     required this.image3,
//     required this.image4,
//     required this.image5,
//   });

// factory MoreInfo.fromCsv(List<dynamic> row){
//   return MoreInfo(
//     image1: row[8],
//     image2: row[8],
//     image3: row[8], 
//     image4: row[8], 
//     image5: row[8]);

// }




// }

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



                        // image1: item.extraimage1,
                        // image2: item.extraimage2,
                        // image3: item.extraimage3,
                        // image4: item.extraimage4,
                        // image5: item.extraimage5,
                        // description: item.description,
                        // location:item.location,
                        // latitude : item.latitude,
                        // longitude: item.longitude,
                        // name: item.name,
                        // address: item.address

}
class Redirect_page extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String location;
  final String description;
  final String name;
  final String address;
  final String price;

 Redirect_page({
  required this.image1,
  required this.image2, 
  required this.image3,
  required this.image4,
  required this.image5,
  required this.location,
  required this.description,
  required this.name,
  required this.address,
  required this.price,
  });


  @override
  State<StatefulWidget> createState() => _Redirect_pageState();


}

class _Redirect_pageState extends State<Redirect_page> {


  @override
  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);
    double cardWidth= DeviceConfig.getCardWidth(context);
    double cardHeight = DeviceConfig.getCardHeight(context);
    Color cardColor = Colors.white; 
    
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('House Information'))),
      body : Center(
        
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
                desktop: buildDesktopLayout(textSize, padding),
                
                ),
            ),
  
          ),
        ),
      )
 );
  }



Widget buildDesktopLayout (double textSize, double padding) {
  //   if (!_isDataLoaded) {
  //   return Center(child: CircularProgressIndicator());
  // }
  return  Scaffold(
   // backgroundColor: Colors.lightBlueAccent,
   body: Center(
      child: Column(
        children: [
          Wrap(
           // spacing: 10, // Horizontal spacing between images
            //runSpacing: 10, // Vertical spacing between rows
            children: [
              Image.asset(widget.image1, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context)),
              Image.asset(widget.image2, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context)),
              Image.asset(widget.image3, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context)),
              Image.asset(widget.image4, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context)),
              Image.asset(widget.image5, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context)),
              Image.asset(widget.image5, height: DeviceConfig.getImageHeight(context), width: DeviceConfig.getImageWidth(context))
          
            ],
          ),


        SizedBox(height: 20),
      _buildTextInfo(Colors.white, 
                    widget.name,
                    widget.description, 
                    widget.location, 
                    widget.address,
                    // widget.latitude as String,
                    // widget.longitude as String,
                    widget.price)
            
        ],
      ),

    ),
    

  );
}
Widget _buildTextInfo(Color cardColor, String name, String description ,String location, 
                        String address,  String price) {
  return Container(
    color: cardColor,
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(description, style: TextStyle(color: Colors.grey, fontSize: 16)),
        SizedBox(height: 5),
        Text(location, style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 5),
        Text(address.toString(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          children: [
           Icon(Icons.euro, color: Colors.grey, size: 10),
            Text(price.toString(), style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        SizedBox(height: 20),
        

        ElevatedButton(
                        child: Text('Payment'),
                        onPressed: (){Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Payment(),
                       ));
                      
                       },
                          )  
        // Text(longitude.toString(), style: TextStyle(color: Colors.grey, fontSize: 14)),
        // SizedBox(height: 5),
        
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


// Widget buildTabletLayout(double textSize, double padding) {
//     return Row(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding / 2),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Sign-In",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: textSize,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Center(
//                       child: Icon(
//                         Icons.login_rounded,
//                         color: Colors.deepPurple,
//                         size: textSize,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: padding),
//                 customTextField("Username", "username", Icons.account_circle, false,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Email", "you@example.com", Icons.mail, false,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Password", "Enter Password", Icons.lock, true,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Confirm Password", "Confirm Password", Icons.lock, true,textSize),
//                 SizedBox(height: padding),
//                 //SizedBox(height: padding / 2),
//                 Container(
//                   width: double.infinity,
//                   height: padding * 1.5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       "Already have an account?",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: textSize * 0.5,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: padding / 2),
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Don't have an account?",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: textSize * 0.4,
//                           ),
//                         ),
//                         WidgetSpan(
//                           child: SizedBox(width: 8),
//                         ),
//                         TextSpan(
//                           text: "Sign-In",
//                           style: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: textSize * 0.4,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: Image.asset(
//               '/home/utente/rental_property/lib/house.gif',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//     Widget buildDesktopLayout(double textSize, double padding) {
//     return Row(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding / 2),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Sign-Up",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: textSize,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Center(
//                       child: Icon(
//                         Icons.login_rounded,
//                         color: Colors.deepPurple,
//                         size: textSize,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: padding),
//                 customTextField("Username", "username", Icons.account_circle, false,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Email", "you@example.com", Icons.mail, false,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Password", "Enter Password", Icons.lock, true,textSize),
//                 SizedBox(height: padding/2),
//                 customTextField("Confirm Password", "Confirm Password", Icons.lock, true,textSize),
//                 SizedBox(height: padding),


//                 Container(
//                   width: double.infinity,
//                   height: padding * 1.5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: textSize * 0.5,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: padding / 2),
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Already have an account?",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: textSize * 0.4,
//                           ),
//                         ),
//                         WidgetSpan(
//                           child: SizedBox(width: 8),
//                         ),
//                         TextSpan(
//                                             recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
//                         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                           return FadeTransition(
//                             opacity: animation,
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                           text: "Sign-In",
//                           style: TextStyle(
//                             color: Colors.deepPurple,
//                             fontSize: textSize * 0.4,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: Image.asset(
//               '/home/utente/rental_property/lib/house.gif',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }


//   Widget customTextField(String title, String hintText, IconData icon, bool isPassword, double textSize) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: textSize * 0.4,
//             color: Colors.black,
//           ),
//         ),
//         TextFormField(
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             hintText: hintText,
//             prefixIcon: Icon(icon),
//           ),
//         ),
//       ],
//     );
//   }


// }

// //     return Scaffold(
// //       body: Container(
// //         child: Center(
// //           child: Card(
// //             elevation: 5,
// //             margin: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
// //             shadowColor: Colors.black,
// //             child: Container(
// //               width: double.infinity,
// //               height: 750.0,
// //               child: Padding(padding: EdgeInsets.all(35.0),
// //               child: Row(
// //                 children: <Widget>[
// //                   Expanded(
// //                     child: Padding(
// //                       padding: EdgeInsets.symmetric(horizontal: 12.0),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: <Widget>[
// //                           Row(
// //                             children: [
// //                               Text(
// //                                 "Sign-Up",
// //                                 style: TextStyle(
// //                                   fontSize: 40.0,
// //                                   color: Colors.white,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                               Center(
// //                                 child: Icon(
// //                                   Icons.login_rounded,
// //                                   color: Colors.deepPurple,
// //                                   size: 50,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(height: 25.0),
// //                           customTextField("Username", "username", Icons.account_circle, false),
// //                           SizedBox(height: 25.0),
// //                           customTextField("Email", "you@example.com", Icons.mail, false),
// //                           SizedBox(height: 25.0),
// //                           customTextField("Password", "Enter Password", Icons.lock, true),
// //                           SizedBox(height: 25.0),
// //                           customTextField("Confirm Password", "Confirm Password", Icons.lock, true),
// //                           SizedBox(height: 25.0),
// //                           Container(
// //                             width: double.infinity,
// //                             height: 50,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(25),
// //                             ),
// //                             child: ElevatedButton(
// //                               style: ButtonStyle(
// //                                 backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
// //                               ),
// //                               onPressed: () {},
// //                               child: Text(
// //                                 "Sign Up",
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w600
// //                                 ),
// //                               )
// //                             )
// //                           ),
// //                           SizedBox(height: 20.0),
// //                           Center(
// //                             child: RichText(
// //                               text: TextSpan(
// //                                 children: [
// //                                   TextSpan(
// //                                     text: "Already have an account?",
// //                                     style: TextStyle(
// //                                       color: Colors.white70,
// //                                       fontSize: 18,
// //                                     )
// //                                   ),
// //                                   TextSpan(
// //                                     text: "Sign-In",
// //                                     style: TextStyle(
// //                                       color: Colors.deepPurple,
// //                                       fontSize: 18,
// //                                     )
// //                                   ),
// //                                 ]
// //                               )
// //                             ),
// //                           )
// //                         ],
// //                       ),
// //                     )
// //                   ),
// //                   SizedBox(height: 23.0),
// //                   Expanded(
// //                     flex: 1,
// //                     child: Center(
// //                       child: Material(
// //                         borderRadius: BorderRadius.circular(17.0),
// //                        // child: _riveArtboard == null ? const SizedBox() : Rive(artboard: _riveArtboard),
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ));
// //   }

