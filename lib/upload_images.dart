import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:io' if (kIsWeb) 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Upload House Images')),
        body: UploadImage(),
      ),
    );
  }
}

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  List<PlatformFile>? _selectedFiles;
  bool _isUploading = false;

  Future<void> _pickFiles() async {
    setState(() {
      _isUploading = true;
    });

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
        _isUploading = false;
      });
    } else {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 16.0; // Replace with DeviceConfig.getTextSize(context) if you have DeviceConfig
    double padding = 16.0; // Replace with DeviceConfig.getPadding(context) if you have DeviceConfig
    double cardWidth = MediaQuery.of(context).size.width * 0.8; // Replace with DeviceConfig.getCardWidth(context) if you have DeviceConfig
    double cardHeight = MediaQuery.of(context).size.height * 0.6; // Replace with DeviceConfig.getCardHeight(context) if you have DeviceConfig

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Upload Images'))),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickFiles,
          child: Text('Upload House Images'),
        ),
        SizedBox(height: 20),
        _isUploading
            ? Center(
                child: SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : _selectedFiles != null
                ? Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _selectedFiles!.map((file) {
                      if (kIsWeb) {
                        return Image.memory(
                          file.bytes!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.file(
                          File(file.path!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      }
                    }).toList(),
                  )
                : Text('No images selected'),
                 SizedBox(height: 20),
      ElevatedButton(
          onPressed: (){},
          child: Text('Submit'),
        ),

      ],
    );
  }

  Widget buildMobileLayout(double textSize, double padding) {
    return Center(child: Text("Mobile Layout"));
  }

  Widget buildTabletLayout(double textSize, double padding) {
    return Center(child: Text("Tablet Layout"));
  }
}
