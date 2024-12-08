import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/pages/login_page1.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "N",
                      style: TextStyle(fontSize: 40, color: Colors.blue[900]),
                    ),
                  ),
                  accountName: Text("Name"),
                  accountEmail: Text("example@example.com"),
                  decoration: BoxDecoration(
                    color: Constants.mainColor,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Select Faculty and Major"),
                  onTap: () {
                    // Add your onTap logic here
                  },
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
            onTap: () {
              Navigator.of(context).pop(LoginPage1());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Add your logout logic here
            },
          )
        ],
      ),
    );
  }
}
