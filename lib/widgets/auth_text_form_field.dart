import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    Key? key,
    required this.emailController,
    required this.hinttext,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  final TextEditingController emailController;
  final String hinttext;
  final IconData icon;
  final String? Function(String?)? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          hintText: hinttext,
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.6),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: callback,
      ),
    );
  }
}
