import 'package:devfest/model/account.dart';
import 'package:devfest/model/payement.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/MoneyScreen/qr_screen.dart';
import 'package:devfest/ui/widgets/custom_button.dart';
import 'package:devfest/ui/widgets/pay_item.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

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
          body: Center(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                child:Text("Payements" , style: ScreenInfo.headline1(),),),

                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:ScreenInfo.height*0.04 ),
                    child: MyButton(
                      color: Color(0xFFd3b8fd),
                      radius: 15,
                      width: ScreenInfo.width*0.4,
                      onTap: () { 
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const QrScreen(); 
                          }
                        );
                       },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Pay from here",style: ScreenInfo.headline3(color: Color(0xFFd14171A)),),
                        SizedBox(width: ScreenInfo.width*0.01,),
                        const Icon(Icons.send_rounded,color: Color(0xFFd14171A),)
                      ],
                    )
                    ),
                    ),
                ),

                (Account.payements == null || Account.payements?.length == 0)
                  
                  ?
                  
                  Text("Thers no Connection",style: ScreenInfo.headline2(),) 
                  
                  :
                  
                  SizedBox(
                    height: ScreenInfo.height*0.65,
                    child: ListView.builder(
                    itemCount: Account.payements!.length,
                    itemBuilder: (context,index){
                      Payement item = Account.payements![index];
                      return ChangeNotifierProvider<Payement>.value(
                        value: item,
                        child: Padding(
                         padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.02,horizontal: ScreenInfo.width*0.04),
                          child: const PayItem(),
                        ),
                      );
                    }
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}