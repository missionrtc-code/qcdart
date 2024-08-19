import 'package:flutter/material.dart';
import 'package:qcdart/auth/isToken.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      excuted();
    });
    super.initState();
  }

  void excuted() async {
    await Future.delayed(const Duration(seconds: 3));
    final token = await isTokenExpired();
    if (token) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/dashboard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
