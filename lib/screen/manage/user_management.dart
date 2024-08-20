import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        drawer: MyDashboardDrawer(),
      ),
    );
  }
}