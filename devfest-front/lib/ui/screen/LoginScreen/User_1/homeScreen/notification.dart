import 'package:devfest/model/notif.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    List type = ["Progresse","Payement","File"];
    List<Color> colors = [const Color(0xFFe6f5fc),const Color(0xFFe6dcf5),const Color(0xFFa7e2e4)];

    return Consumer<Notif>(
      builder: (BuildContext context, Notif notif, Widget? child) {
        return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colors[notif.type%3],
          // gradient: RadialGradient(
          //       center: Alignment.topLeft,
          //       radius: 2.9,
          //       colors: [
          //         ScreenInfo.clrBg2.withOpacity(0.8),
          //         ScreenInfo.clrBg,
          //         ScreenInfo.clrBg2.withOpacity(0.8),
          //       ]),
        ),
        // height: ScreenInfo.height*0.15,
        width: ScreenInfo.width*0.7,
        padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.025,horizontal: ScreenInfo.width*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type[notif.type%3],style: ScreenInfo.headline2(color: Colors.black),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notif.titel,style: ScreenInfo.headline3(color: Colors.black),),
                Text(notif.discreption,style: ScreenInfo.headline4(color: Colors.black),),
              ],
            ),
          ],
        ),
      );
        },
    );
  }
}