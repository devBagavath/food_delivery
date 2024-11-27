import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../app_constant/core/color.dart';
import '../widget/text_field.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  String _selectedCategory = 'New Arrival';

  final Map<String, List<Map<String, String>>> _categoriesData = {
    'New Arrival': [
      {'title': 'Burger', 'price': '₹150','image':'assets/images/burger.png'},
      {'title': 'Ice Cream', 'price': '₹150','image':'assets/images/ice_cream.png'},
      {'title': 'Pizza', 'price': '₹90','image':'assets/images/pizza.png'},
      {'title': 'Chicken Pizza', 'price': '₹901','image':'assets/images/pizza.png'},
      {'title': 'Juice Combo', 'price': '₹90','image':'assets/images/juice.png'},
      {'title': 'Meals', 'price': '₹120','image':'assets/images/meals.png'},
    ],
    'Pizza': [
      {'title': 'Special Pizza', 'price': '₹700','image':'assets/images/pizza.png'},
      {'title': 'Chicken Pizza', 'price': '₹150','image':'assets/images/pizza.png'},
      {'title': 'Veg Pizza', 'price': '₹100','image':'assets/images/pizza.png'},
      {'title': 'Chicken Pizza Combo', 'price': '₹200','image':'assets/images/pizza.png'},
      {'title': 'Mutton Pizza', 'price': '₹200','image':'assets/images/pizza.png'},
    ],
    'Burger': [
      {'title': 'Sweet Burger', 'price': '₹50','image':'assets/images/burger.png'},
      {'title': 'Salt Burger', 'price': '₹30','image':'assets/images/burger.png'},
      {'title': 'Burger Combo', 'price': '₹100','image':'assets/images/burger.png'},
      {'title': 'Chicken Burger', 'price': '₹100','image':'assets/images/burger.png'},
      {'title': 'Veg Burger', 'price': '₹100','image':'assets/images/burger.png'},
    ],
    'Juice': [
      {'title': 'Orange Juice', 'price': '₹100','image':'assets/images/juice.png'},
      {'title': 'Apple Juice', 'price': '₹100','image':'assets/images/juice.png'},
      {'title': 'Mango Juice', 'price': '₹100','image':'assets/images/juice.png'},
      {'title': 'Juice Combo', 'price': '₹200','image':'assets/images/juice.png'},
      {'title': 'Lemon Juice', 'price': '₹200','image':'assets/images/juice.png'},
      {'title': 'Banana Juice', 'price': '₹200','image':'assets/images/juice.png'},
    ],
    'Meals': [
      {'title': 'Veg meals', 'price': '₹200','image':'assets/images/meals.png'},
      {'title': 'Non veg meals', 'price': '₹100','image':'assets/images/meals.png'},
      {'title': 'Fried Rice', 'price': '₹200','image':'assets/images/meals.png'},
      {'title': 'Egg Rice', 'price': '₹200','image':'assets/images/meals.png'},
      {'title': 'Egg noodles', 'price': '₹200','image':'assets/images/meals.png'},
      {'title': 'Chicken Noodled', 'price': '₹200','image':'assets/images/meals.png'},

    ],
    'Ice Cream': [
    {'title': 'Vennila', 'price': '₹200','image':'assets/images/ice_cream.png'},
    {'title': 'Choclate', 'price': '₹100','image':'assets/images/ice_cream.png'},
    {'title': 'Mango', 'price': '₹200','image':'assets/images/ice_cream.png'},
    {'title': 'Cub', 'price': '₹200','image':'assets/images/ice_cream.png'},
    {'title': 'Family pack', 'price': '₹200','image':'assets/images/ice_cream.png'},
    {'title': 'Kuchi ice', 'price': '₹200','image':'assets/images/ice_cream.png'},
    ],
  };

  final List<String> _bannerImages = [
    'assets/images/burger_banner.jpg',
    'assets/images/ice_cream_banner.jpg',
    'assets/images/pizza_banner.jpg',
    'assets/images/meals_banner.jpg',
    'assets/images/juice_banner.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _onCategoryTap(String category) {
    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _selectedCategory = category;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: customTextField('Search',width: width)),
              const SizedBox(height: 16),

              // Image Slider
              FlutterCarousel(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: _bannerImages.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categoriesData.keys.map((category) {
                    return GestureDetector(
                      onTap: () => _onCategoryTap(category),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(category),
                          backgroundColor: _selectedCategory == category
                              ? Colors.orange
                              : Colors.grey[200],
                          labelStyle: TextStyle(
                            color: _selectedCategory == category
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 300,
                ),
                child: _isLoading
                    ? _buildShimmerList()
                    : ListView.builder(
                  itemCount: _categoriesData[_selectedCategory]!.length,
                  itemBuilder: (context, index) {
                    final product = _categoriesData[_selectedCategory]![index];
                    return _buildProductCard(
                      product['title']!,
                      product['price']!,product['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProductCard(String title, String price, String imagePath) {
    return Card(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Product Image
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Image.asset(imagePath),
            ),
            const SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Offer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            // Add Button
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title added to cart!')),
                );
              },
              icon: const Icon(Icons.add_circle, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildShimmerCard();
      },
    );
  }

  Widget _buildShimmerCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Shimmer Product Image
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              // Shimmer Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 14,
                      width: 100,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 14,
                      width: 100,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


