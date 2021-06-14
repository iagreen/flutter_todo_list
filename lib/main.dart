import 'package:flutter/material.dart';
import 'package:flutter_todo_list/config.dart';
import 'package:flutter_todo_list/login_screen.dart';
import 'package:flutter_todo_list/store.dart';
import 'package:flutter_todo_list/todo_screen.dart';
import 'package:supabase/supabase.dart';

void main() async {
  final supabaseClient = SupabaseClient(Config.supabaseUrl, Config.supabaseKey,
      autoRefreshToken: true);
  final store = Store(supabaseClient);
  runApp(MyApp(store));
}

class MyApp extends StatefulWidget {
  final Store store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState(store);
}

class _MyAppState extends State<MyApp> {
  final Store store;
  bool? _auth;

  @override
  initState() {
    super.initState();
    store.restoreSession().then((auth) => setState(() {
          this._auth = auth;
        }));
  }

  _MyAppState(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(child: _getPage(_auth)),
      ),
    );
  }

  _getPage(bool? auth) {
    switch (auth) {
      case null:
        return CircularProgressIndicator();
      case true:
        return ToDoList(store: store, onLogout: () => setState(() => _auth = false),);
      case false:
        return LoginScreen(
          store: store,
          succeeded: () => setState(() => _auth = true),
        );
    }
  }
}
