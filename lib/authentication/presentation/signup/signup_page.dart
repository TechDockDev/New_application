import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_application/authentication/presentation/login/login_page.dart';
import 'package:new_application/authentication/shared/auth_service_provider.dart';
import 'package:new_application/widgets/auth_social_media.dart';
import 'package:new_application/widgets/auth_submit_buttons.dart';
import 'package:new_application/widgets/auth_text_form_field.dart';
import 'package:new_application/widgets/auth_text_form_field_password.dart';
import 'package:provider/provider.dart';

class SignUpPage extends HookWidget {
  final signupFormKey = GlobalKey<FormState>();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final isPasswordHidden = useState<bool>(true);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              height: height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Form(
                key: signupFormKey,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 10,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        "or register with e-mail",
                        style: TextStyle(
                          color: Color.fromARGB(255, 143, 143, 145),
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
                    AuthTextFormField(
                      emailController: usernameController,
                      hinttext: 'Username',
                      icon: Icons.person,
                      callback: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
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
                    AuthTextFormFieldPassword(
                      passwordController: repeatPasswordController,
                      isPasswordHidden: isPasswordHidden,
                      text: 'Repeat Password',
                      callback: (value) {
                        if (value!.isEmpty ||
                            value != passwordController.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
                    ),
                    AuthSubmitButton(
                      text: 'Sign Up',
                      signupFormKey: signupFormKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      width: width,
                      callback: () {
                        if (signupFormKey.currentState!.validate()) {
                          context.read<AuthProvider>().createAccount(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                context,
                              );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
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
                                      builder: (context) => LogInPage()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Log In",
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
                    ),
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
