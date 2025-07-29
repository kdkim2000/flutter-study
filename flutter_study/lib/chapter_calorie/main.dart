import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart'; //
import 'calorie_calculator_page.dart'; ////
import 'calorie_result_page.dart'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(
        scheme: FlexScheme.brandBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.brandBlue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      // home: const Scaffold( // 👈 기본 home 설정
      //   body: Center(child: Text('Flex Color Scheme App')),
      // ),
      initialRoute: CalorieCalculatorPage.routeName,
      routes: {
        CalorieCalculatorPage.routeName: (context) => CalorieCalculatorPage(),
        CalorieResultPage.routeName: (context) {
          final totalCalories =
              ModalRoute.of(context)?.settings.arguments as int?;
          return CalorieResultPage(totalCalories: totalCalories ?? 0);
        },
      },
    );
  }
}
