import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data'; // File 대신

void main() => runApp(PhotoApp());

class PhotoApp extends StatefulWidget {
  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      // Web에서는 File 대신 바이트 배열로 읽음!
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('사진 선택 & 미리보기')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageBytes != null
                  ? Image.memory(_imageBytes!, width: 200, height: 200, fit: BoxFit.cover)
                  : Text('사진이 없습니다'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('갤러리에서 사진 선택'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
