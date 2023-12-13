import 'package:devfest/model/payement.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayItem extends StatelessWidget {
  const PayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenInfo.width*0.8,
      height: ScreenInfo.height*0.08,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 2.9,
              colors: [
                ScreenInfo.clrBg2.withOpacity(0.8),
                ScreenInfo.clrBg,
                ScreenInfo.clrBg2.withOpacity(0.8),
              ]),
      ),

      child: Consumer<Payement>(
        builder: (BuildContext context, Payement payement, Widget? child) { 
          return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payement.date,style: ScreenInfo.headline3(),),
                Text("Price : ${payement.price}",style: ScreenInfo.headline4(color: Colors.greenAccent),),
              ],
            ),
            (payement.isDone)? Icon(Icons.check,color: Colors.greenAccent,) : Icon(Icons.error_rounded,color:Colors.white ,)
          ],
        );
         },
      ),

    );
  }
}