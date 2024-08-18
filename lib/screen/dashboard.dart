import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Placeholder(),
        ),
      ),
    );
  }
}

