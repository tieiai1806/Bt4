import 'package:flutter/material.dart';
import 'ex1_listview.dart';
import 'ex2_gridview.dart';
import 'ex3_shared_prefs.dart';
import 'ex4_async.dart';
import 'ex5_isolates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Week 4 Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Bài Tập Tuần 4'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuItem(context, 'Bài 1: List View (Contacts)', const Ex1ListView()),
          _menuItem(context, 'Bài 2: Grid View (Gallery)', const Ex2GridView()),
          _menuItem(context, 'Bài 3: Shared Preferences', const Ex3SharedPrefs()),
          _menuItem(context, 'Bài 4: Async Programming', const Ex4Async()),
          _menuItem(context, 'Bài 5: Isolate (Factorial)', const Ex5Isolates()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      ),
    );
  }
}