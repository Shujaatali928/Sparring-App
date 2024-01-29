import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class CcheckBox extends StatefulWidget {
  const CcheckBox({super.key, required this.label, required this.onChanged});
  final String label;
  final ValueChanged<bool> onChanged;

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
              widget.onChanged(value);
            });
          },
        ),
        Ctext(data: widget.label, color: appcolors.textColorblack),
      ],
    );
  }
}
