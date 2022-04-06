import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    Key? key,
    required this.signupFormKey,
    required this.emailController,
    required this.passwordController,
    required this.width,
    required this.text,
    required this.callback,
  }) : super(key: key);

  final GlobalKey<FormState> signupFormKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double width;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: 50,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xff7E9DFE),
                Color(0xffCCDEFF),
              ],
              begin: Alignment.center,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
