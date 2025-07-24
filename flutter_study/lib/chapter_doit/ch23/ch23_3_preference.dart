import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }
}
class NativePluginWidgetState extends State<NativePluginWidget>{

  late SharedPreferences prefs;
  double sliderValue = 0.0;
  bool switchValue = false;

  _save() async {
    await prefs.setDouble('slider', sliderValue);
    await prefs.setBool('switch', switchValue);
  }
  getInitData() async {
    prefs = await SharedPreferences.getInstance();
    sliderValue = prefs.getDouble("slider") ?? 0.0;
    switchValue = prefs.getBool("switch") ?? false;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences'),),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                  value: sliderValue,
                  min: 0,
                  max: 10,
                  onChanged: (double value){
                    setState(() {
                      sliderValue = value;
                    });
                  }
              ),
              Switch(
                  value: switchValue,
                  onChanged: (bool value){
                    setState(() {
                      switchValue = value;
                    });
                  }
              ),
              ElevatedButton(
                  onPressed: _save,
                  child: Text('save')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















