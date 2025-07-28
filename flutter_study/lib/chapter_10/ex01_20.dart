import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  var items = List.generate(100, (index) => index); // 0 ~ 99

  MyHomePage() {
    // print(items.map((e) => Text('숫자 $e')).toList() );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('TabBar 데모'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.house),
                  ),
                  Tab(
                    text: '메뉴2',
                  ),
                  Tab(
                    icon: Icon(Icons.home),
                    text: '메뉴3',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(color: Colors.red),
                Container(color: Colors.green),
                Container(color: Colors.blue),
              ],
            ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '메뉴1',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: '메뉴2'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: '메뉴3'),
            ],
            onTap: (value) {
              print(value);
            },
          ),
        ));
  }
}
