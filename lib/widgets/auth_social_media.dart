import 'package:flutter/material.dart';

class AuthSocialMedia extends StatelessWidget {
  final String image;
  const AuthSocialMedia({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          image,
        ),
      ),
    );
  }
}
