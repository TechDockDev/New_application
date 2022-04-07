import 'package:flutter/material.dart';

class AuthTextFormFieldPassword extends StatelessWidget {
  const AuthTextFormFieldPassword({
    Key? key,
    required this.passwordController,
    required this.isPasswordHidden,
    required this.text,
    this.callback,
  }) : super(key: key);

  final TextEditingController passwordController;
  final ValueNotifier<bool> isPasswordHidden;
  final String text;
  final String? Function(String?)? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        textInputAction: TextInputAction.next,
        obscureText: isPasswordHidden.value,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              isPasswordHidden.value = !isPasswordHidden.value;
            },
          ),
          hintText: text,
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
