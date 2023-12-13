import 'package:devfest/model/account.dart';
import 'package:devfest/ui/widgets/pro_img_item.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
        // gradient: RadialGradient(
        //       center: Alignment.bottomCenter,
        //       radius: 0.9,
        //       colors: [
        //         Color(0xFFAAB8C2),
        //         Color(0xFFE1E8ED).withOpacity(0.8),
        //         // ScreenInfo.clrBg2.withOpacity(0.8),
        //         // ScreenInfo.clrBg,
        //       ]),
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: const BottomNav(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text("Progresse" , style: ScreenInfo.headline1(color: Color(0xFFd14171A)),),


                  (Account.progresseImgs == null || Account.progresseImgs?.length == 0)
                  
                  ?
                  
                  Text("Thers no Connection",style: ScreenInfo.headline2(),) 
                  
                  :
                  
                  SizedBox(
                    height: ScreenInfo.height*0.8211,
                    child: ListView.builder(
                    itemCount: Account.progresseImgs!.length,
                    itemBuilder: (context,index){
                      var item = Account.progresseImgs![index];
                      return Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenInfo.width*0.04),
                        child: ProImgItem(url: item.url,date: item.date,discreption: item.discreption),
                      );
                    }
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}