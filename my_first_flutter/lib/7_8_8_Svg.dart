import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const SvgDemo());

class SvgDemo extends StatelessWidget {
  // 정상적으로 로딩 가능한 SVG 이미지 URL로 교체!
  final String svgUrl =
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/SVG_Logo.svg';

  const SvgDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_svg 예제')),
        body: Center(
          child: SvgPicture.network(
            svgUrl,
            width: 150,
            height: 150,
            placeholderBuilder: (context) => const SizedBox(
              width: 48,
              height: 48,
              child: Center(child: CircularProgressIndicator()),
            ),
            // 에러 처리 (최신 flutter_svg에서 지원)
            semanticsLabel: 'SVG Example',
          ),
        ),
      ),
    );
  }
}
