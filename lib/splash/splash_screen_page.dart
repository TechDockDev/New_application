// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_application/authentication/presentation/login/login_page.dart';
import 'package:new_application/dashboard/profile_dashboard.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoLogIn();
  }

  _navigatetoLogIn() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const CheckAuth()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const ProfileDashboard();
    }
    return LogInPage();
  }
}
