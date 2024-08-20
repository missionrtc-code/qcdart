import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';

class AuditPlanningScreen extends StatefulWidget {
  const AuditPlanningScreen({super.key});

  @override
  State<AuditPlanningScreen> createState() => _AuditPlanningScreenState();
}

class _AuditPlanningScreenState extends State<AuditPlanningScreen> {
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