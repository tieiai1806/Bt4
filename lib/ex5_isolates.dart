import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Ex5Isolates extends StatefulWidget {
  const Ex5Isolates({super.key});

  @override
  State<Ex5Isolates> createState() => _Ex5IsolatesState();
}

class _Ex5IsolatesState extends State<Ex5Isolates> {
  String _result = "Chưa thực hiện tính toán";
  bool _isLoading = false;

  static BigInt calculateFactorial(int n) {
    BigInt res = BigInt.from(1);
    for (int i = 1; i <= n; i++) {
      res *= BigInt.from(i);
    }
    return res;
  }

  void _runTask() async {
    setState(() {
      _isLoading = true;
      _result = "Đang tính toán trong background isolate...";
    });

    final res = await compute(calculateFactorial, 30000);

    setState(() {
      _isLoading = false;
      _result = "Đã tính xong 30,000!\n(Kết quả quá lớn để hiển thị toàn bộ, thread UI vẫn mượt mà!)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate Calculation')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading ? const CircularProgressIndicator() : const Icon(Icons.functions, size: 60, color: Colors.blue),
              const SizedBox(height: 20),
              Text(_result, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : _runTask,
                child: const Text("Calculate 30,000!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}