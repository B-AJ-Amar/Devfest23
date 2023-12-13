import 'package:devfest/model/file.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Filee>(
      builder: (BuildContext context, Filee file, Widget? child) { 
        return 
      Container(
        width: ScreenInfo.width*0.8,
        padding: EdgeInsets.symmetric(horizontal:ScreenInfo.width*0.06,vertical:ScreenInfo.height*0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 2.9,
                colors: [
                  ScreenInfo.clrBg2.withOpacity(0.8),
                  ScreenInfo.clrBg,
                  ScreenInfo.clrBg2.withOpacity(0.8),
                ]),
        ),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(file.titel,style: ScreenInfo.headline2(),),
            Padding(
                padding: EdgeInsets.symmetric(vertical :ScreenInfo.height*0.01,horizontal: ScreenInfo.width*0.06),
                child: Divider(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: file.isDone ?
                  GestureDetector(
                    onTap: (){
                      file.setIsDone=true;
                    },
                    child: Row(
                      children: [
                        Text("Upload",style: ScreenInfo.headline3(color: Colors.white.withOpacity(0.4)),),
                        SizedBox(width: ScreenInfo.width*0.01,),
                         Icon(Icons.link_rounded,color: Colors.white.withOpacity(0.4),)
                      ],
                    ),
                  )
                  :
                  GestureDetector(
                    onTap: (){
                      file.setIsDone=false;
                    },
                    child: Row(
                      children: [
                        Text("Done",style: ScreenInfo.headline3(color: Colors.greenAccent),),
                        SizedBox(width: ScreenInfo.width*0.01,),
                        const Icon(Icons.check_rounded,color: Colors.greenAccent,)
                      ],
                    ),
                  )

                ),
              ],
            )
          ],
        ),
      
      );
      },
    );
  }
}