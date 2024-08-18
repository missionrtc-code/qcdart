import 'package:flutter/material.dart';
import 'package:qcdart/screen/dashboard.dart';
import 'package:qcdart/screen/dashboard_edit_manage.dart';
import 'package:qcdart/screen/dashboard_manage.dart';
import 'package:qcdart/screen/forget.dart';
import 'package:qcdart/screen/login.dart';
import 'package:qcdart/screen/register.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/register',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forget': (context) => const ForgetScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/dashboard/manage': (context) => const DashboardManageScreen(),
        '/dashboard/manage/edit': (context) => const DashboardEditManageScreen(),
      },
    );
  }
}
