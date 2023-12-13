import 'package:devfest/logic/bottom_nav_handel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavHandel>(
      builder: (BuildContext context, BottomNavHandel value, Widget? child) { 

      return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 20 , right: 20 , bottom: 10),
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
                  icon: (value.selectedPart==1)? Icons.access_time_filled_rounded : Icons.access_time_rounded ,
                onTap:(){
                  value.setSelectedPart=1;
                }),
                NavButton(
                  icon: Icons.attach_money_rounded ,
                onTap:(){
                  value.setSelectedPart=2;
                }),
                NavButton(
                  icon: (value.selectedPart==3)? Icons.file_present_rounded : Icons.file_present_outlined ,
                onTap:(){
                  value.setSelectedPart=3;
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