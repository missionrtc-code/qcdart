import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';

class CheckListManagementScreen extends StatefulWidget {
  const CheckListManagementScreen({super.key});

  @override
  State<CheckListManagementScreen> createState() => _CheckListManagementScreenState();
}

class _CheckListManagementScreenState extends State<CheckListManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        drawer: MyDashboardDrawer(),
      ),
    );
  }
}