import 'package:flutter/material.dart';
import 'package:new_application/dashboard/profile_dashboard.dart';
import 'package:new_application/dashboard/settings/a_login_info_page.dart';
import 'package:new_application/dashboard/settings/b_language_page.dart';
import 'package:new_application/dashboard/settings/c_notification_page.dart';
import 'package:new_application/dashboard/settings/d_location_page.dart';
import 'package:new_application/dashboard/settings/e_contact_us_page.dart';
import 'package:new_application/widgets/custom_fab.dart';
import 'package:new_application/widgets/custom_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ProfileDashboard(),
              ),
            );
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          CustomListTile(
            title: 'Login Information',
            leadingIcon: Icons.email,
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginInfoPage(),
                ),
              );
            },
          ),
          CustomListTile(
            title: 'Language',
            leadingIcon: Icons.translate,
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LanguagePage(),
                ),
              );
            },
          ),
          CustomListTile(
            title: 'Notification',
            leadingIcon: Icons.notifications,
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
          CustomListTile(
            title: 'Location',
            leadingIcon: Icons.location_on,
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LocationPage(),
                ),
              );
            },
          ),
          CustomListTile(
            title: 'Contact Us',
            leadingIcon: Icons.contact_support,
            callback: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ContactUsPage(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: const CustomFab(),
    );
  }
}
