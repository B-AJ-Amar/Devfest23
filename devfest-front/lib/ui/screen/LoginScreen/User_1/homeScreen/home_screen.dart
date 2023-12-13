import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/homeScreen/notification.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
          bottomNavigationBar: const BottomNav(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notification" , style: ScreenInfo.headline1(),),
              
              SizedBox(height: ScreenInfo.height*0.03,),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF657786),
                    maxRadius: ScreenInfo.height*0.04,
                    minRadius: ScreenInfo.height*0.04,
                    child: Icon(Icons.person_2_rounded,size: ScreenInfo.height*0.04,),
                  ),
                  Text("${Account.username}",style: ScreenInfo.headline2(),),
                ],
              ),
              SizedBox(height: ScreenInfo.height*0.03,),
          
              Column(
                children: [
                  SizedBox(
                    height: ScreenInfo.height*0.6,
                    child: ListView.builder(
                      itemCount: Account.notif!.length,
                      itemBuilder: (context,index){
                        return ChangeNotifierProvider.value(
                          value: Account.notif![index],
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.01,horizontal: ScreenInfo.width*0.02),
                            child: const MyNotification(),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}