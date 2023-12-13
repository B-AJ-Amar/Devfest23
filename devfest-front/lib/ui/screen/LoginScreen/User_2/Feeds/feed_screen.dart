import 'package:devfest/api/api_feed.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/add_feed.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/feed_item.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/tabhandel.dart';
import 'package:devfest/ui/screen_info.dart';
import 'package:devfest/ui/widgets/bottom_nav_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  void x() async{
    await Account.getFeed(Provider.of<TabHandell>(context,listen: false).tabs![Provider.of<TabHandell>(context,listen: false).itemSelected].id);
        Provider.of<Account>(context,listen: false).setLenghFeed();
  }
  @override
  void initState() {
     x();
     super.initState();
  }

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
          backgroundColor: Colors.transparent,
          bottomNavigationBar: const BottomNav2(),
          floatingActionButton: GestureDetector(
            onTap: (){
              showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AddFeed(); 
                          }
                      );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: ScreenInfo.height*0.01,horizontal: ScreenInfo.width*0.08),
              decoration: BoxDecoration(
                color: Color(0xFFE1E8ED),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.add)),
          ),
          body: Column(
            children: [
              Text("Feeds",style: ScreenInfo.headline1(color: Colors.white),),
              Container(
                child: SizedBox(
                  height: ScreenInfo.height*0.065,
                  child: Consumer<TabHandell>(
                    builder: (BuildContext context, TabHandell value, Widget? child) { 
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.tabs!.length,
                      itemBuilder: (_,index){
                        if(index==value.itemSelected) {
                          return Tabb(text:value.tabs![index].name , bgClr: Colors.white.withOpacity(0.3), textClr: ScreenInfo.clrBg,onTap: ()async{
                          await value.setItemSelected(index);
                          Provider.of<Account>(context,listen: false).setLenghFeed();
                        },);
                        } 
                        return Tabb(text:value.tabs![index].name , bgClr: Colors.transparent, textClr: Colors.white,onTap: ()async{
                          await value.setItemSelected(index);
                          Provider.of<Account>(context,listen: false).setLenghFeed();
                        },); 
                      },
                    );

                     },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical :ScreenInfo.height*0.02,horizontal: ScreenInfo.width*0.1),
                child: const Divider(),
              ),
              Consumer<Account>(
                builder: (BuildContext context, Account value, Widget? child) { 
                  return 
                SizedBox(
                  height: ScreenInfo.height*0.6,
                  child: ListView.builder(
                    itemCount: value.feedlen,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenInfo.width*0.03,vertical: ScreenInfo.height*0.02),
                        child: FeedItem(username: Account.feeds![index].username , date: Account.feeds![index].date , dis: Account.feeds![index].discreption),
                      );
                    },
                  ),
                );
                },
              ),
  
            ],
          ),
        ),
      ),
    );
  }
}

class Tabb extends StatelessWidget {
  Color bgClr;  
  Color textClr;
  String text;
  Function()? onTap;  
  Tabb({required this.onTap,required this.text,required this.bgClr ,required this.textClr,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: bgClr,
          borderRadius: BorderRadius.circular(40)
        ),
        padding: EdgeInsets.symmetric(horizontal: ScreenInfo.width*0.1),
        child: Center(child: Text(text,style: ScreenInfo.headline2(color: textClr),)),
      ),
    );
  }
}