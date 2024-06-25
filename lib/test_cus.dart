import 'package:flutter/material.dart';




class SignUpPage2 extends StatefulWidget {
  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _userType = 'Cliente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrati'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome utente'),
                onSaved: (value) {
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  _password = value!;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Tipo di utente'),
                value: _userType,
                items: ['Cliente', 'Proprietario'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _userType = newValue!;
                  });
                },
              ),
              ElevatedButton(
                child: Text('Registrati'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserQuestionsPage(userType: _userType),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domande a Risposta Chiusa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
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
              ElevatedButton(
                child: Text('Continua'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdSubmissionPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
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
                }).toList(), onChanged: (int? value) {  },
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