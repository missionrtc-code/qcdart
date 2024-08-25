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
            title: const Text('Dashboard'),
            onTap: () {
              context.goNamed(RoutePath.dashboard.name);
            },
          ),
          ExpansionTile(
            title: const Text('Manage'),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.arrow_circle_right_outlined),
                title: const Text('Plant Management'),
                onTap: () {
                  context.goNamed(RoutePath.dashboardPlantManagement.name);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_circle_right_outlined),
                title: const Text('User Management'),
                onTap: () {
                  context.goNamed(RoutePath.dashboardUserManagement.name);
                  // Navigator.pushNamed(context, '/manage/user');
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_circle_right_outlined),
                title: const Text('Checklist Management'),
                onTap: () {
                  context.goNamed(RoutePath.dashboardChecklistManagement.name);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_circle_right_outlined),
                title: const Text('Audit Planning'),
                onTap: () {
                  context.goNamed(RoutePath.dashboardAuditPlanning.name);
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.arrow_circle_right_outlined),
              //   title: const Text('Audit Execution'),
              //   onTap: () {
              //     context.goNamed(RoutePath.dashboardAuditExecution.name);
              //   },
              // ),
            ],
          ),
          ListTile(
            title: const Text('Audit Execution'),
            onTap: () async {
              context.goNamed(RoutePath.dashboardAuditExecution.name);
            },
          ),
          ListTile(
            title: const Text('Logout'),
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
