
import 'package:flutter/material.dart';
import 'package:rental_property/upload_images.dart';
import 'package:responsive_builder/responsive_builder.dart';


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

class UserQuestionsPage extends StatefulWidget {
  final String userType;

  UserQuestionsPage({required this.userType});

  @override
  _UserQuestionsPageState createState() => _UserQuestionsPageState();
}

class _UserQuestionsPageState extends State<UserQuestionsPage> {
  final _formKey = GlobalKey<FormState>();
  String _budget = '500-1000 EUR';
  String _propertyType = 'Appartamento';
  int _rooms = 1;
  String _location = 'Centro città';
  DateTime _startDate = DateTime.now();
  int _duration = 3;
  String _ageRange = '18-25';
  String _occupation = 'Studente';
  int _familyMembers = 1;

  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);
    double cardWidth = DeviceConfig.getCardWidth(context);
    double cardHeight = DeviceConfig.getCardHeight(context);

    return Scaffold(
     
      appBar: AppBar(title: Center(child: Text('Domande a Risposta Chiusa'))),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ScreenTypeLayout(
                mobile: buildMobileLayout(textSize, padding),
                tablet: buildTabletLayout(textSize, padding),
                desktop: buildDesktopLayout(textSize, padding),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopLayout(double textSize, double padding) {
    return Row(
      children: [

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Row(
                  children: [
                    Text(
                     "Sign-Up: ${widget.userType}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.deepPurple,
                        size: textSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: padding),
                Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      if (widget.userType == 'Cliente') ...[
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Budget mensile'),
                          value: _budget,
                          items: ['500-1000 EUR', '1000-1500 EUR', '1500-2000 EUR'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _budget = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Tipo di abitazione'),
                          value: _propertyType,
                          items: ['Appartamento', 'Stanza', 'Casa'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _propertyType = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Numero di stanze'),
                          value: _rooms,
                          items: [1, 2, 3].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _rooms = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Preferenze di localizzazione'),
                          value: _location,
                          items: ['Centro città', 'Periferia', 'Vicino ai trasporti pubblici'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _location = newValue!;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Data di inizio locazione'),
                          initialValue: _startDate.toLocal().toString().split(' ')[0],
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null && pickedDate != _startDate)
                              setState(() {
                                _startDate = pickedDate;
                              });
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Durata prevista della locazione'),
                          value: _duration,
                          items: [1, 3, 6, 12].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _duration = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Range di età'),
                          value: _ageRange,
                          items: ['18-25', '26-35', '36-45', '46+'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _ageRange = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Occupazione'),
                          value: _occupation,
                          items: ['Studente', 'Lavoratore', 'Pensionato'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _occupation = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Numero di componenti'),
                          value: _familyMembers,
                          items: [1, 2, 3, 4].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _familyMembers = newValue!;
                            });
                          },
                        ),
                      ] else if (widget.userType == 'Proprietario') ...[
                        // Campi specifici per il proprietario
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Tipo di proprietà'),
                          value: _propertyType,
                          items: ['Appartamento', 'Villa', 'Monolocale'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _propertyType = newValue!;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Prezzo mensile di affitto'),
                          onSaved: (value) {
                            // Salva il valore
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Numero di stanze'),
                          value: _rooms,
                          items: [1, 2, 3].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _rooms = newValue!;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Disponibilità'),
                          initialValue: _startDate.toLocal().toString().split(' ')[0],
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null && pickedDate != _startDate)
                              setState(() {
                                _startDate = pickedDate;
                              });
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Durata minima del contratto'),
                          value: _duration,
                          items: [1, 3, 6, 12].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _duration = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Range di età preferito per gli inquilini'),
                          value: _ageRange,
                          items: ['18-25', '26-35', '36-45', '46+'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _ageRange = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(labelText: 'Occupazione preferita degli inquilini'),
                          value: _occupation,
                          items: ['Studente', 'Lavoratore', 'Pensionato'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _occupation = newValue!;
                            });
                          },
                        ),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(labelText: 'Numero massimo di inquilini'),
                          value: _familyMembers,
                          items: [1, 2, 3, 4].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _familyMembers = newValue!;
                            });
                          },
                        ),
                        // Checkbox per i servizi inclusi
                      ],
             SizedBox(height: padding ),
                Container(
               width: double.infinity,
                height: padding * 1.5,  
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),


                    //             onPressed: () {
                    //   Navigator.push(
                    //     context,
                    //     PageRouteBuilder(
                    //       pageBuilder: (context, animation, secondaryAnimation) =>
                    //           UserQuestionsPage(userType: _userType),
                    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    //         return FadeTransition(
                    //           opacity: animation,
                    //           child: child,
                    //         );
                    //       },
                    //     ),
                    //   );
                    // },
           child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {

                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>UploadImage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );


                
              },
              child: Text(
                "Continua",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize * 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
                Expanded(
          child: Center(
            child: Image.asset(
              '/Users/nandrajog/Downloads/rental_property/lib/house.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildMobileLayout(double textSize, double padding) {
    return Center(child: Text("Mobile Layout"));
  }

  @override
  Widget buildTabletLayout(double textSize, double padding) {
    return Center(child: Text("Tablet Layout"));
  }
}

class AdSubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserimento Annuncio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Titolo Annuncio'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrizione'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Indirizzo'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prezzo Mensile (EUR)'),
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Numero di stanze'),
                items: [1, 2, 3].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dimensione (mq)'),
              ),
              ElevatedButton(
                child: Text('Carica Immagini'),
                onPressed: () {
                  // Logica di caricamento immagini
                },
              ),
              // Checkbox per i servizi inclusi
              ElevatedButton(
                child: Text('Inserisci Annuncio'),
                onPressed: () {
                  // Logica di inserimento annuncio
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// DeviceConfig class should be defined somewhere in your project
// Assuming DeviceConfig provides methods to get text size, padding, card width and height based on screen size



