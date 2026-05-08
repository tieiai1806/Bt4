import 'package:flutter/material.dart';

class Ex4Async extends StatefulWidget {
  const Ex4Async({super.key});

  @override
  State<Ex4Async> createState() => _Ex4AsyncState();
}

class _Ex4AsyncState extends State<Ex4Async> {
  String _status = "Nhấn nút để bắt đầu tải dữ liệu";
  bool _isLoading = false;

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _status = "Loading user...";
    });
    
    await Future.delayed(const Duration(seconds: 3));
    
    setState(() {
      _isLoading = false;
      _status = "User loaded successfully!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Asynchronous Programming')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(_status, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _loadUser, 
              icon: const Icon(Icons.download),
              label: const Text("Load User Data"),
            ),
          ],
        ),
      ),
    );
  }
}