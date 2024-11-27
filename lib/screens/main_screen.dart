import 'package:flutter/material.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import '../app_constant/core/color.dart';
import '../app_constant/string/asset_path_constant.dart';
import '../commonui/widget/circular_progress_dialog.dart';
import '../commonui/widget/drawer_menu.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  double animateX = 0.0;
  double animateY = 0.0;
  double scale = 1;
  bool toggle = false;
  bool onPressed = false;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    OrderScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AnimationController animationController ;
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    return SafeArea(
      child: Stack(
        children: [
          DrawerMenu(),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform: Matrix4.translationValues(animateX, animateY, 0)..scale(scale),
            child: ClipRRect(
              borderRadius: (toggle)?BorderRadius.circular(20) : BorderRadius.circular(0) ,
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      icon:
                      AnimatedIcon(
                          icon: onPressed?AnimatedIcons.close_menu:AnimatedIcons.menu_arrow,
                          color: grey,
                          progress: animationController),
                      onPressed: () {
                        onPressed = !onPressed;
                        print(toggle);
                        toggle = !toggle;
                        if (toggle) {
                          animateX = 200;
                          animateY = 80;
                          scale = 0.8;
                          animationController.forward();
                        } else {
                          animateX = 0.0;
                          animateY = 0.0;
                          scale = 1;
                          animationController.reverse();
                        }
                        setState(() {});
                      }

                  ),
                  actions: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            CircularProgressIndicatorPage(true);
                          },
                          child: Icon(
                            Icons.notifications_none,
                            size: 32.0,color: grey,
                          ),
                        )
                    ),],
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Image.asset(
                      splashBackgroundPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                body:  Scaffold(
                  body: _pages[_selectedIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.receipt_long),
                        label: 'My Orders',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Account',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
