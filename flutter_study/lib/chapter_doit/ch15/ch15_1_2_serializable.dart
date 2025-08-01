import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

@JsonSerializable()
class Location {
  String latitude;
  String longitude;
  Location(this.latitude, this.longitude);
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Todo {
  @JsonKey(name: "id")
  int todoId;
  String title;
  bool completed;
  Location location;

  Todo(this.todoId, this.title, this.completed, this.location);
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);

}

class MyAppState extends State<MyApp>{
  String jsonStr = '{"id":1, "title":"HELLO", "completed":false, "location":{"latitude":"37.5", "longitude":"127.1"}}';
  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);
    setState(() {
      result = "decode : ${todo?.toJson()}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "encode : ${jsonEncode(todo)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result),
              ElevatedButton(
                  onPressed: onPressDecode,
                  child: Text('Decode')
              ),
              ElevatedButton(
                  onPressed: onPressEncode,
                  child: Text('Encode')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['latitude'] as String,
      json['longitude'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      json['id'] as int,
      json['title'] as String,
      json['completed'] as bool,
      Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.todoId,
      'title': instance.title,
      'completed': instance.completed,
      'location': instance.location.toJson(),
    };
