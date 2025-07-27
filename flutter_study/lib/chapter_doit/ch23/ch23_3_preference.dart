import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  State<StatefulWidget> createState() => NativePluginWidgetState();
}

class NativePluginWidgetState extends State<NativePluginWidget> {
  SharedPreferences? prefs;
  double sliderValue = 0.0;
  bool switchValue = false;
  bool isLoading = true;

  Future<void> _save() async {
    if (prefs == null) return;
    await prefs!.setDouble('slider', sliderValue);
    await prefs!.setBool('switch', switchValue);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("저장되었습니다.")),
    );
  }

  Future<void> getInitData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      sliderValue = prefs?.getDouble("slider") ?? 0.0;
      switchValue = prefs?.getBool("switch") ?? false;
      isLoading = false;
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
      appBar: AppBar(title: Text('Shared Preferences')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.yellow,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Slider(
                      value: sliderValue,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sliderValue.toStringAsFixed(1),
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                    Switch(
                      value: switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _save,
                      child: Text('save'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
