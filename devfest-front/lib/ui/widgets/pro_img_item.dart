import 'package:devfest/ui/screen_info.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';

class ProImgItem extends StatelessWidget {
  final String url;
  final String discreption;
  final String date;

  const ProImgItem({super.key, required this.url, required this.discreption, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ScreenInfo.width*0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFd14171A)
            // gradient: RadialGradient(
            //       center: Alignment.topLeft,
            //       radius: 2.9,
            //       colors: [
            //         ScreenInfo.clrBg2.withOpacity(0.8),
            //         ScreenInfo.clrBg,
            //         // ScreenInfo.clrBg,
            //         ScreenInfo.clrBg2.withOpacity(0.8),
            //         ScreenInfo.clrBg2.withOpacity(0.8),
            //       ]),
          ),
          padding: EdgeInsets.symmetric(horizontal: ScreenInfo.width*0.01,vertical: ScreenInfo.height*0.01),
          child: Column(
            children: [
              Text(date ,style: ScreenInfo.headline2(color: Colors.white),),
              Padding(
                padding: EdgeInsets.symmetric(vertical :ScreenInfo.height*0.01,horizontal: ScreenInfo.width*0.06),
                child: Divider(),
              ),
              Text(discreption ,style: ScreenInfo.headline3(color: Colors.white),),
              SizedBox(height: ScreenInfo.height*0.02,),
              SizedBox(
                height: ScreenInfo.height*0.4,
                width: ScreenInfo.width*0.75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.network(url,fit: BoxFit.fill,),
                ),
              ),
              SizedBox(height: ScreenInfo.height*0.01,),
            ],
          ),
        ),
              SizedBox(height: ScreenInfo.height*0.005,),
         Dash(
        direction: Axis.vertical,
        dashThickness: 4,
        dashBorderRadius: 4,
        length: ScreenInfo.height*0.1,
        dashLength: ScreenInfo.height*0.018,
        dashColor: Color(0xFFd14171A)
      ),
      ],
    );
  }
}