import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const HomeScreen());
}

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
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildBanner(),
          const SizedBox(height: 10),
          _buildCategoryList(),
          const SizedBox(height: 10),
          Expanded(child: _buildRestaurantList()),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildBanner() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Banner Clicked!')),
        );
      },
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/banner.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.restaurant, 'label': 'ร้านอาหาร'},
      {'icon': Icons.local_cafe, 'label': 'กาแฟ / ของหวาน'},
      {'icon': Icons.star, 'label': "Users' Choice"},
      {'icon': Icons.camera, 'label': 'ที่เที่ยว'},
      {'icon': Icons.delivery_dining, 'label': 'สั่งเดลิเวอรี่'},
      {'icon': Icons.fastfood, 'label': 'ฟาสต์ฟู้ด'},
      {'icon': Icons.local_bar, 'label': 'บาร์ / ผับ'},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(categories[index]);
        },
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
              backgroundColor: selectedCategory == category['label']
                  ? Colors.orange
                  : Colors.orange.shade100,
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
      'images/saemaeul.png',
    ];

    return ListView.builder(
      itemCount: restaurantImages.length,
      itemBuilder: (context, index) {
        return _buildRestaurantCard(restaurantImages[index], index);
      },
    );
  }

  Widget _buildRestaurantCard(String image, int index) {
    List<String> foodCategories = [
      'Thai Food',
      'Italian Food',
      'Japanese Food',
      'Chinese Food',
      'Fast Food',
      'Vegetarian',
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        title: Text('Restaurant ${index + 1}'),
        subtitle: Text(
            '${(_random.nextDouble() * 5).toStringAsFixed(1)} ★ | ${foodCategories[_random.nextInt(foodCategories.length)]}'),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected Restaurant ${index + 1}')),
          );
        },
      ),
    );
  }
}
