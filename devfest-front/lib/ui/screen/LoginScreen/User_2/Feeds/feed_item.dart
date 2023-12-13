import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  final String username;
  final String date;
  final String dis;

  
  const FeedItem({super.key, required this.username, required this.date, required this.dis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.01,horizontal: ScreenInfo.width*0.02),
      decoration: BoxDecoration(
        color: const Color(0xFF657786),
        borderRadius: BorderRadius.circular(10)
      ),
      width: ScreenInfo.width*0.84,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [
                CircleAvatar(maxRadius: ScreenInfo.width*0.05,),
                SizedBox(width: ScreenInfo.width*0.03,),
                Text(username,style: ScreenInfo.headline2(color: Colors.white),),
              ],
            ),
              Row(
                children: [
                  Text("in : ",style: ScreenInfo.headline3(color: Colors.white.withOpacity(0.5)),),
                  Text(date,style: ScreenInfo.headline4(),),
                ],
              ),
          ],),
          Padding(
                padding: EdgeInsets.symmetric(vertical :ScreenInfo.height*0.02,horizontal: ScreenInfo.width*0.06),
                child: const Divider(),
              ),
          Text(dis,style: ScreenInfo.headline3(),)
        ],
      ),
    );
  }
}