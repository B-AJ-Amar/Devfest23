import 'package:devfest/api/api_feed.dart';
import 'package:devfest/logic/bottom_nav_handel.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/tabhandel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav2 extends StatelessWidget {
  const BottomNav2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavHandel>(
      builder: (BuildContext context, BottomNavHandel value, Widget? child) { 
                  ApiFeedController apifeed= ApiFeedController();
      return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 65 , right: 65 , bottom: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)
            ),
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButton(
                  icon: (value.selectedPart==0)? Icons.home : Icons.home_outlined ,
                onTap:(){
                  value.setSelectedPart=0;
                }),
                NavButton(
                  icon: (value.selectedPart==1)? Icons.feed_rounded : Icons.feed_outlined ,
                onTap:()async{
                  Provider.of<TabHandell>(context,listen: false).tabs = await apifeed.fetchTypes();
                  value.setSelectedPart=1;
                }),
                NavButton(
                  icon: (value.selectedPart==2)? Icons.help_rounded: Icons.help_outline_sharp ,
                onTap:(){
                  value.setSelectedPart=2;
                }),
              ],
      
            ),
          )
          );
      }

    );
    }
  }


class NavButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onTap;

  const NavButton({
    super.key,
    required this.icon ,
    this.onTap,
    this.color =  Colors.white ,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}