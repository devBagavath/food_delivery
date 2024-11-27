import 'package:flutter/material.dart';
import '../../app_constant/core/color.dart';
import '../../app_constant/string/asset_path_constant.dart';
import '../../screens/main_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Colors.tealAccent,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primary,Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(accountName: Text("name"), accountEmail: Text('email'),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: primary,
                backgroundImage: AssetImage(profileDefaultImage),
              ),
            ),
            ListTile(
              onTap: (){
                MaterialPageRoute(
                  builder: (BuildContext context) => MainScreen(),
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                ),
                child: const Align(alignment:Alignment.centerLeft,child: Icon(Icons.home,color: primary,size: 20,)),
              ),
              title: const Text("Home",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),),
            ),
            ListTile(
              onTap: (){
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainScreen(),
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                ),
                child: const Align(alignment:Alignment.centerLeft,child: Icon(Icons.settings,color: primary,size: 20,)),
              ),
              title: const Text("Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),),
            ),
            ListTile(
              onTap: () async {

                await Future.delayed(const Duration(seconds: 2));

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MainScreen(),
                  ),
                      (Route route) => false,
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                ),
                child: const Align(alignment:Alignment.centerLeft,child: Icon(Icons.logout,color: primary,size: 20,)),
              ),
              title: const Text("Log Out",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),),
            ),
          ],
        ),
      ),
    );
  }

}