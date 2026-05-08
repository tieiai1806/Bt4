import 'package:flutter/material.dart';

class Ex2GridView extends StatelessWidget {
  const Ex2GridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery Grid')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Fixed Column Grid", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: List.generate(6, (index) => _buildGridItem(index)),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Responsive Grid", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GridView.extent(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: List.generate(6, (index) => _buildGridItem(index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Icon(Icons.image, size: 40, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 4),
        Text("Item ${index + 1}"),
      ],
    );
  }
}