import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback callback;
  const ProfileListTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        onTap: callback,
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFEDF3FE),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(127, 183, 193, 223),
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            leadingIcon,
            size: 28,
            color: const Color(0xFF7E9DFE),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF252941),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFEDF3FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 28,
            color: Color(0xFF0118B5),
          ),
        ),
      ),
    );
  }
}
