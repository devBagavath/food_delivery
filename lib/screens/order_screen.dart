import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  final List<Map<String, String>> _onProgressOrders = [
    {'name': 'Pizza', 'price': '₹100', 'discount': '20%', 'qty': '1','image':'assets/images/pizza.png'},
    {'name': 'Juice', 'price': '₹80', 'discount': '10%', 'qty': '1','image':'assets/images/juice.png'},
    {'name': 'Meals', 'price': '₹600', 'discount': '15%', 'qty': '3','image':'assets/images/meals.png'},
  ];

  final List<Map<String, String>> _completedOrders = [
    {'name': 'Veg Burger', 'price': '₹500', 'discount': '25%', 'qty': '','image':'assets/images/burger.png'},
    {'name': 'Pizza', 'price': '₹100', 'discount': '12%', 'qty': '1','image':'assets/images/pizza.png'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(_onTabChanged);

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _isLoading = true;
      });

      // Simulate loading for a few seconds
      Timer(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false; // Stop loading after 2 seconds
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "On Progress"),
                  Tab(text: "Completed"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _isLoading
                      ? _buildShimmerList()
                      : _buildOrderList(_onProgressOrders),
                  _isLoading
                      ? _buildShimmerList()
                      : _buildOrderList(_completedOrders),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Shimmer List
  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildShimmerCard();
      },
    );
  }

  // Shimmer Card
  Widget _buildShimmerCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                color: Colors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 16, width: double.infinity, color: Colors.grey),
                    const SizedBox(height: 8),
                    Container(height: 14, width: 100, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Order List
  Widget _buildOrderList(List<Map<String, String>> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  // Order Card
  Widget _buildOrderCard(Map<String, String> order) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(order['image']!),
                ),
                const SizedBox(width: 16),
                // Order Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name']!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${order['discount']} off',
                            style: const TextStyle(color: Colors.green),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            order['price']!,
                            style: const TextStyle(color: Colors.orange),
                          ),
                          const SizedBox(width: 8),
                          Text('Qty: ${order['qty']}'),

                        ],
                      ),
                  Row(
                    children: [
                      Text(
                        '${order['discount']} off',
                        style: const TextStyle(color: Colors.green),
                      ),
                      ],
                  ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cancelled ${order['name']}')),
                    );
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Viewing status of ${order['name']}')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange),
                  child: const Text('Order Status'),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
