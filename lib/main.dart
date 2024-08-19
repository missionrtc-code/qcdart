import 'package:flutter/material.dart';
import 'package:qcdart/screen/dashboard.dart';
import 'package:qcdart/screen/dashboard_edit_manage.dart';
import 'package:qcdart/screen/dashboard_manage.dart';
import 'package:qcdart/screen/forget.dart';
import 'package:qcdart/screen/login.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/screen/logo.dart';
import 'package:qcdart/screen/register.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';
import 'package:qcdart/state/register_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterState()),
      ChangeNotifierProvider(create: (context) => CheckListClauseListState()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QC Audit',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/dashboard/manage/edit',
      routes: {
        '/': (context) => const LogoScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forget': (context) => const ForgetScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/dashboard/manage': (context) => const DashboardManageScreen(),
        '/dashboard/manage/edit': (context) => const DashboardEditManageScreen(),
      },
    );
  }
}
