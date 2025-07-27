import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart'; // Mobile
import 'package:sembast_web/sembast_web.dart'; // Web
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class User {
  int id;
  String name;
  String address;

  User(this.id, this.name, this.address);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'address': address,
      };

  static User fromMap(Map<String, dynamic> map) =>
      User(map['id'], map['name'], map['address']);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sembast UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  const NativePluginWidget({super.key});
  @override
  State<StatefulWidget> createState() => _NativePluginWidgetState();
}

class _NativePluginWidgetState extends State<NativePluginWidget> {
  late Database _db;
  final _store = intMapStoreFactory.store('user');
  int lastId = 0;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  Future<void> _initDB() async {
    if (kIsWeb) {
      _db = await databaseFactoryWeb.openDatabase('web_users.db');
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = join(dir.path, 'mobile_users.db');
      _db = await databaseFactoryIo.openDatabase(dbPath);
    }
    await _loadUsers();
  }

  Future<void> _loadUsers() async {
    final records = await _store.find(_db);
    users = records.map((rec) => User.fromMap(rec.value)).toList();
    if (users.isNotEmpty) {
      lastId = users.map((u) => u.id).reduce((a, b) => a > b ? a : b);
    }
    setState(() {});
  }

  Future<void> insert() async {
    lastId++;
    var user = User(lastId, 'name$lastId', 'seoul$lastId');
    await _store.record(user.id).put(_db, user.toMap());
    await _loadUsers();
  }

  Future<void> update() async {
    if (lastId == 0) return;
    var user = User(lastId, 'updatedName$lastId', 'updatedAddress$lastId');
    await _store.record(user.id).update(_db, user.toMap());
    await _loadUsers();
  }

  Future<void> delete() async {
    if (lastId == 0) return;
    await _store.record(lastId).delete(_db);
    lastId--;
    await _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sembast with UI')),
      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: insert, child: Text('Insert')),
              ElevatedButton(onPressed: update, child: Text('Update')),
              ElevatedButton(onPressed: delete, child: Text('Delete')),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.indigo[50],
              child: users.isEmpty
                  ? Center(child: Text('No users found'))
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          leading: CircleAvatar(child: Text('${user.id}')),
                          title: Text(user.name),
                          subtitle: Text(user.address),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
