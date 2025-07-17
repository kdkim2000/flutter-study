import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(SvgDemo());

class SvgDemo extends StatelessWidget {
  final String svgUrl =
      'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg';

  const SvgDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('flutter_svg 예제')),
        body: Center(
          child: SvgPicture.network(
            svgUrl,
            width: 150,
            height: 150,
            placeholderBuilder: (context) => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
