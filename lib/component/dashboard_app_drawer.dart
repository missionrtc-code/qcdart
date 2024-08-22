import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qcdart/auth/app_auth.dart';
import 'package:qcdart/auth/app_router.dart';

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
              context.goNamed(RoutePath.dashboard.name);
            },
          ),
          ExpansionTile(
            title: Text('Manage'),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text('Plant Management'),
                onTap: () {
                  context.goNamed(RoutePath.dashboardPlantManagement.name);
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text('User Management'),
                onTap: () {
                  // Navigator.pushNamed(context, '/manage/user');
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text('Checklist Management'),
                onTap: () {
                  // Navigator.pushNamed(context, '/manage/checklist');
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text('Audit Planning'),
                onTap: () {
                  // Navigator.pushNamed(context, '/manage/audit_planning');
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text('Audit Execution'),
                onTap: () {
                  // Navigator.pushNamed(context, '/manage/audit_execution');
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () async {
              removeToken();
              context.goNamed(RoutePath.signIn.name);
            },
          ),
        ],
      ),
    );
  }
}
