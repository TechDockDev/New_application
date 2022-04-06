import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_application/authentication/presentation/signup/signup_page.dart';
import 'package:new_application/authentication/shared/auth_service_provider.dart';
import 'package:new_application/widgets/auth_social_media.dart';
import 'package:new_application/widgets/auth_submit_buttons.dart';
import 'package:new_application/widgets/auth_text_form_field.dart';
import 'package:provider/provider.dart';

class LogInPage extends HookWidget {
  final loginFormKey = GlobalKey<FormState>();

  LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isPasswordHidden = useState<bool>(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7E9DFE),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff3E9EF6),
                    Color(0xff2EE4E3),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Form(
                key: loginFormKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    AuthTextFormField(
                      emailController: emailController,
                      hinttext: 'E-mail',
                      icon: Icons.email,
                      callback: (value) {
                        if (value!.isEmpty) {
                          return "E-Mail cannot be empty";
                        }
                        if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-zA-Z0-9+_.-]+.[a-z]")
                            .hasMatch(value)) {
                          return "Please enter a valid E-Mail";
                        }
                        return null;
                      },
                    ),
                    AuthTextFormFieldPassword(
                      passwordController: passwordController,
                      isPasswordHidden: isPasswordHidden,
                      text: 'Password',
                      callback: (value) {
                        if (value!.length < 8) {
                          return "Password must be atleast 8 characters";
                        }
                        return null;
                      },
                    ),
                    AuthSubmitButton(
                      text: 'Log in',
                      signupFormKey: loginFormKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      width: width,
                      callback: () {
                        if (loginFormKey.currentState!.validate()) {
                          context.read<AuthProvider>().logIn(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                context,
                              );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xFF0118B5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB7C1DF),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        AuthSocialMedia(image: 'assets/images/google.png'),
                        AuthSocialMedia(image: 'assets/images/facebook.png'),
                        AuthSocialMedia(image: 'assets/images/apple.png'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(
                                  0xff0118B5,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
