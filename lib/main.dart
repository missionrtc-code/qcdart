import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/auth/app_router.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      // routerConfig: router,
    );
  }
}
