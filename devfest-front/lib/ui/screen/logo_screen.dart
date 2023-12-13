import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 0.9,
              colors: [
                ScreenInfo.clrBg2.withOpacity(0.8),
                ScreenInfo.clrBg,
              ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Image.asset("assets\\image\\1702436192275.png"),
              Text("App name" , style: ScreenInfo.headline1(),) ,
            ],
          ),
        ),
      ),
    );
  }
}