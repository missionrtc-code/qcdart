import 'package:flutter/material.dart';
import 'package:qcdart/component/register/address_details.dart';
import 'package:qcdart/component/register/basic_details.dart';
import 'package:qcdart/component/register/confirmation.dart';
import 'package:qcdart/component/register/organization_details.dart';
import 'package:qcdart/component/register/password_details.dart';
import 'package:qcdart/responsive_widget.dart';
import 'package:qcdart/state/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    RegisterState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (ResponsiveWidget.isMediumScreen(context) ||
                      ResponsiveWidget.isSmallScreen(context))
                  ? const SizedBox()
                  : Expanded(
                      child: Container(
                        height: height,
                        color: Theme.of(context).primaryColor,
                        child: Center(
                          child: Text(
                            'QC Dart',
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
              Expanded(
                child: Container(
                  height: height,
                  margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Welcome to QCDart!',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _switchWidget(),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                if (RegisterState().selectedTabIndex == 0) {
                                  Navigator.of(context).pushNamed('/');
                                } else {
                                  RegisterState().back();
                                  setState(() {});
                                }
                              },
                              child: RegisterState().selectedTabIndex == 0 ? const Text('Login') : const Text('Back'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  RegisterState().next();
                                  setState(() {});
                                }
                              },
                              child: const Text('Next'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _switchWidget() {
  int index = RegisterState().selectedTabIndex;
  switch (index) {
    case 0:
      return const BasicDetails();
    case 1:
      return const PasswordDetails();
    case 2:
      return const OrganizationDetails();
    case 3:
      return AddressDetails();
    default:
      return const Confirmation(name: 'Shubham');
  }
}
