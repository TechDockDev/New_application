import 'package:flutter/material.dart';
import 'package:new_application/dashboard/profile_dashboard.dart';

class AllergyInfoPage extends StatelessWidget {
  const AllergyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const ProfileDashboard(),
              ),
            );
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
        title: const Text('Allergy Information'),
      ),
    );
  }
}
