import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_application/authentication/presentation/login/login_page.dart';
import 'package:new_application/authentication/shared/auth_service_provider.dart';
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
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(100, 183, 193, 223),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(100, 183, 193, 223),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              "assets/images/facebook.png",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(100, 183, 193, 223),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              "assets/images/apple.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "or register with e-mail",
                          style: TextStyle(
                            color: Color.fromARGB(255, 143, 143, 145),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email),
                          hintText: "E-mail",
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
                        validator: (value) {
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: usernameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.person),
                          hintText: "Username",
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: isPasswordHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              isPasswordHidden.value = !isPasswordHidden.value;
                            },
                          ),
                          hintText: "Password",
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
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password must be atleast 8 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: repeatPasswordController,
                        obscureText: isPasswordHidden.value,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              isPasswordHidden.value = !isPasswordHidden.value;
                            },
                          ),
                          hintText: "Repeat password",
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              value != passwordController.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (signupFormKey.currentState!.validate()) {
                            context.read<AuthProvider>().createAccount(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  context,
                                );
                          }
                        },
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
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color(
                            0xff0118B5,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => LogInPage()),
                                ),
                              );
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
