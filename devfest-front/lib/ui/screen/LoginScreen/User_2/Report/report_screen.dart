import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar2.dart';
import 'package:devfest/ui/widgets/custom_button.dart';
import 'package:devfest/ui/widgets/input.dart';
import 'package:flutter/material.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCont = TextEditingController();
    TextEditingController disCont = TextEditingController();
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
          bottomNavigationBar: const BottomNav2(),
          body: Center(
            child: Column(
              
              children: [
               Text("Report",style: ScreenInfo.headline1(color: Colors.white),),
               SizedBox(height: ScreenInfo.height*0.3,),
               Center(
                 child: Column(
                   children: [
                     Input(controller: titleCont , titel:"The probleme", width: ScreenInfo.width*0.8, height: ScreenInfo.height*0.08, onChanged: (w){}, color: Colors.white, style: ScreenInfo.headline3(color: Colors.black)),
                 SizedBox(height: ScreenInfo.height*0.01,),
                 SizedBox(
                       height: ScreenInfo.height*0.1,
                       width: ScreenInfo.width*0.8,
                       child: TextField(
                         controller:disCont,
                         style: ScreenInfo.headline2(color: Colors.white),
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: Colors.white,
                           hintText: "Tell us more about it",
                           hintStyle:ScreenInfo.headline3(color: Colors.black),
                           border: OutlineInputBorder(
                             borderSide: BorderSide.none,
                             borderRadius: BorderRadius.circular(10)
                         ),
                       ),
                      )
                     ),
                 SizedBox(height: ScreenInfo.height*0.02,),
                  MyButton(child: Text("Submit",style: ScreenInfo.headline2(color: Colors.black),), color: Color(0xFFE1E8ED), radius: 10, onTap: (){}, width: ScreenInfo.width*0.3)
                   ],
                 ),
               ),
              ],
            ),
          )
        ),
      ),
    );
  }
}