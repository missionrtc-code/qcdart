import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDashboardDrawer extends StatelessWidget {
  const MyDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Image.asset('assets/logo.png')),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/dashboard', (route) => false);
            },
          ),
          ListTile(
            title: Text('Manage'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/dashboard/manage', (route) => false);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('access_token');
              prefs.remove('expiry_time');

              // TODO: logout
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
