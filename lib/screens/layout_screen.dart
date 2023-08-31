import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/chat.dart';
import 'package:zoom_clone/screens/contacts.dart';
import 'package:zoom_clone/screens/home.dart';
import 'package:zoom_clone/screens/settings.dart';
import 'package:zoom_clone/utilis/colors.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _page = 0;
  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     const Home(),
    const Chat(),
    const Contacts(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: footerColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Meet & Chat'),
      ),
      body: pages[_page],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 70,
            decoration: const BoxDecoration(color: footerColor),
            child: BottomNavigationBar(
              backgroundColor: footerColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: onPageChange,
              currentIndex: _page,
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 14,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Contacts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
