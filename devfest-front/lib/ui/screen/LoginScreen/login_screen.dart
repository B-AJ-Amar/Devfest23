import 'package:devfest/api/api_login.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen/LoginScreen/User_1/main_screen.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/main_screen2.dart';
import 'package:devfest/ui/widgets/input.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:devfest/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final ApiLoginController apiLogin = ApiLoginController();
  String? err;

  @override
  Widget build(BuildContext context) {
    final accountProv = Provider.of<Account>(context,listen:false);

    return Container(
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

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Urban Nest",style: ScreenInfo.headline1(),),
              SizedBox(height: ScreenInfo.height*0.05),
              Input(style: ScreenInfo.headline2(color: Colors.white),color: Colors.black,controller: usernameCont, titel: "Username", width: ScreenInfo.width*0.8, height: ScreenInfo.height*0.09, onChanged: (x){}),
              SizedBox(height: ScreenInfo.height*0.02,),
              Input(style: ScreenInfo.headline2(color: Colors.white),color: Colors.black,controller: passwordCont,  titel: "Password", width: ScreenInfo.width*0.8, height: ScreenInfo.height*0.09, onChanged: (x){}),
              SizedBox(height: ScreenInfo.height*0.03,),

              MyButton(width: ScreenInfo.width*0.4,color: ScreenInfo.clrBg2, radius: 20,onTap: ()async{
                await apiLogin.fetchLogin(usernameCont.text, passwordCont.text).then((value) => Account.auth_token=value);
                  print("================${Account.auth_token}====");
                if(Account.auth_token!=null){
                  Account.username = usernameCont.text;
                  await Account.get_isDelivered();
                  print("====================0");
                  await Account.getNotif();
                  print("=============${Account.is_delivered}=======4");

                  if(Account.is_delivered==false){
                    await Account.getProgImg();
                    print("====================1");
                    await Account.getFiles();
                    print("====================2");
                    await Account.getPayements();
                    print("====================3");
                  Navigator.push( context, MaterialPageRoute(builder: (context) => const MainScreen()
                  // ignore: use_build_context_synchronously
               ),
              );
                  }else{
                  Navigator.push( context, MaterialPageRoute(builder: (context) => const MainScreen2()
                  // ignore: use_build_context_synchronously
               ),
              );
                  }
                }else{
                  err = "username or password are invalid !";
                  setState(() {});
                }
                
              },child: Text("Login", style: ScreenInfo.headline2(),),),
              SizedBox(height: ScreenInfo.height*0.03,),
              Text(err ?? "",style: ScreenInfo.headline4(),),
            ],
          ),
        )
      ),
    );
  }
}