import 'package:flutter/material.dart';

class Ex1ListView extends StatelessWidget {
  const Ex1ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts List')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, color: Colors.blue),
            ),
            title: Text('Contact ${index + 1}'),
            subtitle: Text('Phone: 0987 654 32$index'),
            onTap: () {},
          );
        },
      ),
    );
  }
}