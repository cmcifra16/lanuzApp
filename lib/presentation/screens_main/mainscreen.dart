// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../screens/edit-profile.dart';
import '../custom/bubble_bottom_bar.dart';
import '../widgets/custom/drawer.dart';
//import 'main/announcement_screen.dart';
///import 'main/home_screen.dart';
//import 'main/map_screen.dart';
import 'announcement.dart';
import 'home_screen.dart';
import 'map_screen.dart';
import 'map2.dart';
import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/mainscreen';
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 2;

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  final List screen = [
    MyWebView(
      url: 'https://map-map-576f7.web.app/',
    ),
    const MapScreen(),
    const HomeScreen(),
    const AnnouncementScreen(),
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        elevation: 0, // remove the shadow
        iconTheme: IconThemeData(
          color: Colors.black, // set the icon color to black
        ),
      ),
      drawer: Drawer(
        child: profile(),
      ),
      body: screen[currentIndex],
      bottomNavigationBar: CustomBubbleBar(
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}
