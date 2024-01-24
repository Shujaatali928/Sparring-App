import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class CcheckBox extends StatefulWidget {
  const CcheckBox({super.key, required this.label});
  final String label;

  @override
  State<CcheckBox> createState() => _CcheckBoxState();
}

class _CcheckBoxState extends State<CcheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: appcolors.orangeColor,
          checkColor: appcolors.orangeColor,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Ctext(data: widget.label, color: appcolors.textColorblack),
      ],
    );
  }
}
