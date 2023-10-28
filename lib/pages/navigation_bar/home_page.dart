import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart%20';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health/components/my_list_tile.dart';
import 'package:health/pages/navigation_bar/chat_page.dart';
import 'package:health/pages/navigation_bar/location_page.dart';
import 'package:health/pages/navigation_bar/main_page.dart';
import 'package:health/pages/navigation_bar/tips_page.dart';

import '../../auth_controller.dart';
import 'profile_page.dart';

enum Options { english, hindi, marathi }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  final currentUser = FirebaseAuth.instance;
  // ignore: unused_field
  var _popupMenuItemIndex = 0;
// navigation bar
  List pages = [
    const ChatPage(),
    const MainPage(),
    const LocationPage(),
    const TipsPage(),
    const ProfilePage()
  ];

  int currentIndex = 1;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

// language translation popupmenu
  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.english.index) {
      Get.back();
      Get.updateLocale(const Locale('en', 'US'));
    } else if (value == Options.hindi.index) {
      Get.back();
      Get.updateLocale(const Locale('hi', 'IN'));
    } else {
      Get.back();
      Get.updateLocale(const Locale('ma', 'IN'));
    }
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var font10 = h * 0.011;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: pages[currentIndex],
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 120, 72, 201)),
        backgroundColor: Colors.deepPurple[100],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Image(image: AssetImage("assets/images/klogo.png")),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(top: font10),
          child: Text(
            'logo'.tr,
            style: TextStyle(
              color: const Color.fromARGB(255, 120, 72, 201),
              fontSize: h * 0.035,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: h * 0.025, top: font10),
            child: PopupMenuButton(
              onSelected: (value) {
                _onMenuItemSelected(value as int);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(font10),
              ),
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                    'English', Icons.onetwothree, Options.english.index),
                _buildPopupMenuItem('Hindi', Icons.upload, Options.hindi.index),
                _buildPopupMenuItem(
                    'Marathi', Icons.upload, Options.marathi.index),
              ],
              child: Icon(
                Icons.g_translate,
                size: h * 0.025,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: font10, vertical: h * 0.02),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(h * 0.05),
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: h * 0.015, vertical: h * 0.02),
            child: GNav(
              gap: h * 0.008,
              iconSize: h * 0.03,
              onTabChange: onTap,
              selectedIndex: currentIndex,
              backgroundColor: Colors.deepPurple.shade200,
              tabBackgroundColor: Colors.deepPurple.shade400,
              color: Colors.black,
              activeColor: Colors.white,
              padding: EdgeInsets.all(h * 0.01),
              tabs: const [
                GButton(
                  icon: Icons.chat_bubble_outline,
                  text: "Community",
                ),
                GButton(
                  icon: Icons.notifications_active_outlined,
                  text: "SOS",
                ),
                GButton(
                  icon: Icons.call_outlined,
                  text: "Emergency",
                ),
                GButton(
                  icon: Icons.tips_and_updates_outlined,
                  text: "Tips",
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: "Account",
                )
              ],
            ),
          ),
        ),
      ),
      drawer: SizedBox(
          width: w * 0.5,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(h * 0.04),
                  bottomRight: Radius.circular(h * 0.04)),
            ),
            backgroundColor: Colors.deepPurple.shade200,
            shadowColor: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerHeader(child: Image.asset("assets/images/girl.png")),
                    MyListTile(
                        icon: Icons.home_outlined,
                        text: 'H O M E',
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentIndex = 1;
                          });
                        }),
                    MyListTile(
                      icon: Icons.account_circle_outlined,
                      text: 'P R O F I L E',
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          currentIndex = 4;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.05),
                  child: MyListTile(
                    icon: Icons.logout_outlined,
                    text: 'L O G O U T',
                    onTap: () {
                      AuthController.instance.logOut();
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
