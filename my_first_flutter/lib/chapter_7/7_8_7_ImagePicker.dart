import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

void main() => runApp(const ImagePickerDemo());

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      // File 대신 바이트 배열로 이미지를 읽음 (Web & 모바일 모두 지원)
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('image_picker 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageBytes != null
                  ? Image.memory(_imageBytes!, width: 200, height: 200, fit: BoxFit.cover)
                  : const Text('이미지가 없습니다'),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _pickImage, child: const Text('갤러리에서 사진 선택')),
            ],
          ),
        ),
      ),
    );
  }
}
