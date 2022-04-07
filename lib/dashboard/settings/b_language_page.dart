import 'package:flutter/material.dart';
import 'package:new_application/presentation/c_settings_page.dart';
import 'package:new_application/widgets/custom_fab.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
        title: const Text('Language'),
      ),
      floatingActionButton: const CustomFab(),
    );
  }
}
