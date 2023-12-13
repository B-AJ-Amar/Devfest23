import 'package:devfest/model/account.dart';
import 'package:devfest/model/feed.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:devfest/ui/widgets/custom_button.dart';
import 'package:devfest/ui/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFeed extends StatelessWidget {
  const AddFeed({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCont = TextEditingController();
    TextEditingController disCont = TextEditingController();
    return SafeArea(
      child: AlertDialog(
        content: SizedBox(
          height: ScreenInfo.height*0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
                Input(style: ScreenInfo.headline2(color: Colors.black),titel: 'Title',color: Colors.white, width: ScreenInfo.width*0.7, height: ScreenInfo.height*0.08, onChanged:(d){}, controller: titleCont,inputStyle: ScreenInfo.headline2(color: Colors.black),),
                SizedBox(height: ScreenInfo.height*0.01),
                Input(style: ScreenInfo.headline2(color: Colors.black),titel: 'Discreption',color: Colors.white, width: ScreenInfo.width*0.7, height: ScreenInfo.height*0.08, onChanged:(d){}, controller: disCont,inputStyle: ScreenInfo.headline2(color: Colors.black),),
              ],
            ),
            MyButton(color: Color(0xFF14171A), radius: 10, onTap: (){
              Feed x = Feed(username: Account.username , date: "2023-12-13", discreption: disCont.text,);
              Account.feeds!.add(x);
              Provider.of<Account>(context,listen: false).feedlen++;
              Navigator.of(context).pop();

            }, width: ScreenInfo.width*0.3, child: Text("Add",style: ScreenInfo.headline2(),))
            ],
          ),
        ),
      )
      );
  }
}