import 'package:devfest/logic/bottom_nav_handel.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/homeScreen/home_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/feed_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/tabhandel.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/HomeScreen2/home_screen2.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Report/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen2 extends StatelessWidget {
  const MainScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
    HomeScreen2(),
    FeedScreen(),
    ReportScreen(),
  ];
    return screens[Provider.of<BottomNavHandel>(context).selectedPart];
  }
}