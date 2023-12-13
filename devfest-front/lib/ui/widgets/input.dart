import 'package:devfest/ui/screen_info.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String titel;
  final double width;
  final double height;
  final Color color;
  final String? Function(String?) onChanged;
  final Function()? onTap;
  final TextStyle? inputStyle;
  
  final TextStyle style;
  
  const Input({super.key, required this.controller, required this.titel, required this.width, required this.height,required this.onChanged, this.onTap, required this.color, required this.style, this.inputStyle});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String? error;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: widget.height ,
      width: widget.width,
      child: TextField(
        controller:widget.controller,
        style: widget.inputStyle ?? ScreenInfo.headline2(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.color,
          hintText: widget.titel,
          hintStyle: widget.style,
          errorText: error,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
      onTap: widget.onTap,
      onChanged:(text){
          String? error2 = widget.onChanged(text);
          if (error!=error2) {
            setState(() {});
          }
          error = widget.onChanged(text);
      },
     )
    );
  }
}