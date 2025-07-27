import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File; // dart:io는 모바일 전용

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  const NativePluginWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }
}

class NativePluginWidgetState extends State<NativePluginWidget> {
  XFile? _image;

  Future<void> getGalleryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> getCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Widget buildImageWidget() {
    if (_image == null) {
      return const Text(
        'No Image selected',
        style: TextStyle(color: Colors.white),
      );
    } else {
      return kIsWeb
          ? CircleAvatar(
              backgroundImage: NetworkImage(_image!.path),
              radius: 100,
            )
          : CircleAvatar(
              backgroundImage: FileImage(File(_image!.path)),
              radius: 100,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker')),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: getGalleryImage, child: const Text('gallery')),
              buildImageWidget(),
              ElevatedButton(
                  onPressed: getCameraImage, child: const Text('camera')),
            ],
          ),
        ),
      ),
    );
  }
}
