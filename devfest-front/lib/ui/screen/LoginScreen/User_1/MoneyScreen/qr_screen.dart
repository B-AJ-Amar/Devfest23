import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        content: Container(
          decoration: const BoxDecoration(
            // color: Color(0xFF657786)
            color: Colors.black
          ),
          child: Image.asset("assets\\image\\qr.png",fit: BoxFit.fill,),
        ),
      ),
    );
  }
}