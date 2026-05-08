import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ex3SharedPrefs extends StatefulWidget {
  const Ex3SharedPrefs({super.key});

  @override
  State<Ex3SharedPrefs> createState() => _Ex3SharedPrefsState();
}

class _Ex3SharedPrefsState extends State<Ex3SharedPrefs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _displayName = "Chưa có dữ liệu";

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('time', DateTime.now().toString().split('.')[0]);
    _showSnackBar("Đã lưu dữ liệu!");
  }

  Future<void> _showData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      String? name = prefs.getString('name');
      String? age = prefs.getString('age');
      String? email = prefs.getString('email');
      String? time = prefs.getString('time');
      
      if (name != null && name.isNotEmpty) {
        _displayName = "Tên: $name\nTuổi: $age\nEmail: $email\nLưu lúc: $time";
      } else {
        _displayName = "Không có dữ liệu!";
      }
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() => _displayName = "Dữ liệu đã được xóa sạch");
    _showSnackBar("Đã xóa!");
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), duration: const Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Nhập tên")),
            TextField(controller: _ageController, decoration: const InputDecoration(labelText: "Nhập tuổi"), keyboardType: TextInputType.number),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Nhập email")),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _saveData, child: const Text("Save")),
                ElevatedButton(onPressed: _showData, child: const Text("Show")),
                ElevatedButton(onPressed: _clearData, style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade50), child: const Text("Clear")),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
              child: Text(_displayName, style: const TextStyle(fontSize: 16, height: 1.5)),
            ),
          ],
        ),
      ),
    );
  }
}