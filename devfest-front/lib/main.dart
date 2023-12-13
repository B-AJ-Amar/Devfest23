import 'package:devfest/logic/bottom_nav_handel.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/tabhandel.dart';
import 'package:devfest/ui/screen/LoginScreen/login_screen.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> BottomNavHandel()),
      ChangeNotifierProvider(create: (context)=> Account()),
      ChangeNotifierProvider(create: (context)=> TabHandell()),
    ],
    child: const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenInfo.height=MediaQuery.of(context).size.height;
    ScreenInfo.width=MediaQuery.of(context).size.width;


    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen());
  }
}