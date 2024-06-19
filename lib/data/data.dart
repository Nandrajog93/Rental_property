import 'dart:convert'; 
import 'dart:io'; 
import 'package:file_picker/file_picker.dart'; 
import 'package:flutter/material.dart'; 
import 'package:csv/csv.dart';

class UploadPage extends StatefulWidget { 
const UploadPage({Key? key}) : super(key: key); 
@override State<UploadPage> createState() => _UploadPageState(); } 
class _UploadPageState extends State<UploadPage> { 
List<List<dynamic>> _data = []; 
String? filePath;
 @override Widget build(BuildContext context) { 
return Scaffold(
         appBar: AppBar( 
         title: const Text("CSV Data Import"),
       ),
       body: Column( 
               children: [ 
                 ElevatedButton( 
                   child: const Text("Upload File"), 
                   onPressed: () { _pickFile(); },
           ),
             Expanded( 
               child: ListView.builder( 
                        itemCount: _data.length, 
                        itemBuilder: (_, index) { 
                          return ListTile( 
                                   title: Text(_data[index].join(', ')),
                                 );
                         },
             ),
        ),
      ],
   ),
  );
 } 
void _pickFile() async { 
  final result = await FilePicker.platform.pickFiles(allowMultiple: false); 
  if (result == null) return; 
  filePath = result.files.single.path!; 
  final input = File(filePath!).openRead(); 
  final fields = await input .transform(utf8.decoder) .transform(const CsvToListConverter()) .toList(); 
  setState(() { _data = fields; }); 
  }
}