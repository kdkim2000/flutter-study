import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(CachedImageDemo());

class CachedImageDemo extends StatelessWidget {
  final String imageUrl = 'https://picsum.photos/id/237/300/200';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('cached_network_image 예제')),
        body: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) =>
                CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, size: 48),
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}