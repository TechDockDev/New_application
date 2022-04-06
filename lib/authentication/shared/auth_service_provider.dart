import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_application/authentication/presentation/login/login_page.dart';
import 'package:new_application/dashboard/profile_dashboard.dart';

class AuthProvider {
  final FirebaseAuth auth;

  AuthProvider(this.auth);

  Stream<User?> get authState => auth.idTokenChanges();

  createAccount(email, password, context) async {
    UserCredential? user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LogInPage()),
          (route) => false);
    }
  }

  logIn(email, password, context) async {
    UserCredential? user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ProfileDashboard()),
          (route) => false);
    }
  }

  signOut(context) async {
    try {
      await auth.signOut().then((value) => Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => LogInPage())));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
