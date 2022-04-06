import 'package:flutter/material.dart';
import 'package:new_application/presentation/sign_up.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff7E9DFE),
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff3E9EF6),
                Color(0xff2EE4E3),
              ],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                height: 520,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 161, 159, 159),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: TextFormField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: const InputDecoration(
                                hintText: "UserName",
                                suffixIcon: Icon(
                                  Icons.person,
                                ),
                                border: InputBorder.none,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 161, 159, 159),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: TextFormField(
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Password",
                                suffixIcon: Icon(
                                  Icons.visibility_off,
                                ),
                                border: InputBorder.none,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color(
                            0xff0118B5,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "or login with",
                            style: TextStyle(
                              color: Color.fromARGB(255, 143, 143, 145),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 212, 212),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 212, 212),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/facebook.png",
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 212, 212),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/apple.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't have a account?",
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
                                  builder: ((context) => const SignUpPage()),
                                ),
                              );
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
                      )
                    ],
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
