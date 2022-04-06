import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_application/authentication/shared/auth_service_provider.dart';
import 'package:new_application/presentation/a_personal_data_page.dart';
import 'package:new_application/presentation/b_allergy_info_page.dart';
import 'package:new_application/presentation/c_settings_page.dart';
import 'package:new_application/presentation/d_allergy_card_page.dart';
import 'package:new_application/presentation/e_privacy_terms_page.dart';
import 'package:new_application/widgets/profile_page_list_tile.dart';
import 'package:new_application/widgets/profile_page_search_bar.dart';
import 'package:provider/provider.dart';

class ProfileDashboard extends HookWidget {
  const ProfileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final searchQuery = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xff7E9DFE),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: ProfilePageSearchbar(),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 120,
              decoration: const BoxDecoration(
                //todo verify gradiet
                gradient: LinearGradient(
                  colors: [
                    Color(0xff2EE4E3),
                    Color(0xff3E9EF6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          color: Colors.black54,
                          child: const Icon(
                            Icons.person,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Username'),
                  ),
                ],
              ),
            ),
            ProfileListTile(
              title: 'Personal Data',
              leadingIcon: Icons.person,
              callback: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PersonalDataPage(),
                  ),
                );
              },
            ),
            ProfileListTile(
              title: 'Allergy Information',
              leadingIcon: Icons.info,
              callback: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllergyInfoPage(),
                  ),
                );
              },
            ),
            ProfileListTile(
              title: 'Settings',
              leadingIcon: Icons.settings,
              callback: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            ProfileListTile(
              title: 'Allergy Card',
              leadingIcon: Icons.description,
              callback: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllergyCardPage(),
                  ),
                );
              },
            ),
            ProfileListTile(
              title: 'Privacy & Terms',
              leadingIcon: Icons.article,
              callback: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PrivacyTermsPage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ProfileListTile(
              title: 'Log Out',
              leadingIcon: Icons.logout,
              callback: () {
                context.read<AuthProvider>().signOut(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF5963),
                Color(0xFFE72C37),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.warning_rounded),
              Text('SOS'),
            ],
          ),
        ),
      ),
    );
  }
}
