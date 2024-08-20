import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/screen/dashboard_edit_manage.dart';
import 'package:qcdart/screen/manage/audit_execution.dart';
import 'package:qcdart/screen/manage/audit_planning.dart';
import 'package:qcdart/screen/manage/check_list_management.dart';
import 'package:qcdart/screen/manage/plant_management.dart';
import 'package:qcdart/screen/manage/plant_management_edit.dart';
import 'package:qcdart/screen/manage/user_management.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';
import 'package:qcdart/state/manage_plant_state.dart';
import 'package:qcdart/state/manage_plants_state.dart';
import 'package:qcdart/state/register_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterState()),
      ChangeNotifierProvider(create: (context) => ManagePlantsState()),
      ChangeNotifierProvider(create: (context) => CheckListClauseListState()),
      ChangeNotifierProvider(create: (context) => ManagePlantState())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QC Audit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      home: const PlantManagementScreen(),
      initialRoute: '/',
      routes: {
        '/manage': (context) => const PlantManagementScreen(),
        '/manage/edit': (context) => const PlantManagementEditScreen(),
        '/manage/user': (context) => const UserManagementScreen(),
        '/manage/checklist': (context) => const CheckListManagementScreen(),
        '/manage/checklist/edit': (context) => const DashboardEditManageScreen(),
        '/manage/audit_planning': (context) => const AuditPlanningScreen(),
        '/manage/audit_execution': (context) => const AuditExecutionScreen(),
      },
    );
  }
}
