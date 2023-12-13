import 'package:devfest/model/account.dart';
import 'package:devfest/model/file.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/filesScreen/file_item.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

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
          bottomNavigationBar: const BottomNav(),
      
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Center(
                child:Text("Files" , style: ScreenInfo.headline1(),),),

                (Account.files == null || Account.files?.length == 0)
                  
                  ?
                  
                  Text("Thers no Connection",style: ScreenInfo.headline2(),) 
                  
                  :
                  
                  SizedBox(
                    height: ScreenInfo.height*0.8,
                    child: ListView.builder(
                    itemCount: Account.files!.length,
                    itemBuilder: (context,index){
                      Filee item = Account.files![index];
                      return ChangeNotifierProvider<Filee>.value(
                        value: item,
                        child: Padding(
                         padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.02,horizontal: ScreenInfo.width*0.04),
                          child: const FileItem(),
                        ),
                      );
                    }
                  )),

            ],
          ),
        ),
      ),
    );
  }
}