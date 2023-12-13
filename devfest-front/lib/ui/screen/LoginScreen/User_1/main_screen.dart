import 'package:devfest/logic/bottom_nav_handel.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/MoneyScreen/money_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/filesScreen/files_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/homeScreen/home_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/imagesScreen/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = [
    HomeScreen(),
    ImageScreen(),
    MoneyScreen(),
    FilesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    
    return screens[Provider.of<BottomNavHandel>(context,listen: true).selectedPart];
  }
}