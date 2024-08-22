import 'package:flutter/material.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //   // if (!kDebugMode) {
    //   //   await Future.delayed(const Duration(seconds: 3));
    //   // }
    //   final token = await isTokenExpired();
    //   if (token) {
    //     context.goNamed(RoutePath.signIn.name);
    //   } else {
    //     // Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage('assets/logo.png'),
                  width: 150,
                  height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
