import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '';
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('images/wongnai.png', height: 30),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ค้นหาร้านอาหาร...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildBanner(),
          const SizedBox(height: 10),
          _buildCategoryIcons(),
          const SizedBox(height: 10),
          Expanded(child: _buildRestaurantList()),
        ],
      ),
    );
  }

  Widget _buildBanner() {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Banner Clicked!')),
      );
    },
    child: LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxWidth * 0.5; // ปรับให้เป็น 50% ของความกว้างหน้าจอ
        return Container(
          width: double.infinity,
          height: height.clamp(180.0, 300.0), // จำกัดขนาดให้อยู่ในช่วงที่เหมาะสม
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/banner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}

  Widget _buildCategoryIcons() {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.restaurant, 'label': 'ร้านอาหาร'},
      {'icon': Icons.local_cafe, 'label': 'กาแฟ / ของหวาน'},
      {'icon': Icons.star, 'label': "Users' Choice"},
      {'icon': Icons.camera, 'label': 'ที่เที่ยว'},
      {'icon': Icons.delivery_dining, 'label': 'สั่งเดลิเวอรี่'},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) => _buildCategoryItem(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category['label'];
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: selectedCategory == category['label'] ? Colors.orange : Colors.orange.shade100,
              child: Icon(category['icon'], color: Colors.orange, size: 30),
            ),
            const SizedBox(height: 5),
            Text(category['label'], style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantList() {
  List<String> restaurantImages = [
    'images/katei.png',
    'images/youandi.png',
    'images/sizzler.png',
    'images/mc.jpg',
    'images/kfc.png',
  ];

  return ListView.builder(
    itemCount: restaurantImages.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected Restaurant ${index + 1}')),
          );
        },
        child: ListTile(
          leading: Image.asset(restaurantImages[index], width: 50, height: 50, fit: BoxFit.cover),
          title: Text('Restaurant ${index + 1}'),
          subtitle: Text('${(Random().nextDouble() * 5).toStringAsFixed(1)} ★ | Thai Food'),
        ),
      );
    },
  );
}

}
