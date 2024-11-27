import 'package:flutter/material.dart';

import '../app_constant/string/asset_path_constant.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(profileDefaultImage),
                  backgroundColor: Colors.grey.shade300,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "+91 XXXXXXXXXX",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "user@gmail.com",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.black),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),

          // List of options
          Expanded(
            child: ListView(
              children: [
                ProfileOption(
                  icon: Icons.account_balance_wallet,
                  title: "Wallet",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: Icons.location_on,
                  title: "Shop Address",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: Icons.lock,
                  title: "Change Password",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: Icons.support_agent,
                  title: "Support",
                  onTap: () {},
                ),
                ProfileOption(
                  icon: Icons.notifications,
                  title: "Notification Settings",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileOption({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}