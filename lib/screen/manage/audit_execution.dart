import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';

class AuditExecutionScreen extends StatefulWidget {
  const AuditExecutionScreen({super.key});

  @override
  State<AuditExecutionScreen> createState() => _AuditExecutionScreenState();
}

class _AuditExecutionScreenState extends State<AuditExecutionScreen> {
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