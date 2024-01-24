import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.buttonname, required this.ontap});
  final String buttonname;
  final VoidCallback? ontap;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: appcolors.orangeColor,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.buttonname,
              style: const TextStyle(
                  color: appcolors.textColorwhite,
                  fontSize: 24,
                  fontFamily: 'Kanit'),
            ),
          )),
    );
  }
}
