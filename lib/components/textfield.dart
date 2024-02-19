import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';

class CTextField extends StatefulWidget {
  const CTextField(
      {super.key,
      required this.labelText,
      required this.onChanged,
      required this.hide,
      required this.controller});
  final String labelText;
  final ValueChanged<String>? onChanged;
  final bool hide;
  final TextEditingController controller;

  @override
  State<CTextField> createState() => _textfieldState();
}

class _textfieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: double.infinity,
          height: 43,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              textCapitalization: TextCapitalization.sentences,
              obscureText: widget.hide,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.labelText,
                  hintStyle: const TextStyle(
                    fontFamily: 'kanit',
                    fontSize: 18,
                  )),
            ),
          )),
    );
  }
}

class CWtextfield extends StatefulWidget {
  const CWtextfield(
      {super.key,
      required this.labelText,
      required this.onChanged,
      required this.hide,
      required this.controller});
  final String labelText;
  final ValueChanged<String>? onChanged;
  final bool hide;
  final TextEditingController controller;

  @override
  State<CWtextfield> createState() => _CWtextfieldState();
}

class _CWtextfieldState extends State<CWtextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: double.infinity,
          height: 43,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              textCapitalization: TextCapitalization.sentences,
              obscureText: widget.hide,
              decoration: InputDecoration(
                  fillColor: appcolors.textColorwhite,
                  border: InputBorder.none,
                  hintText: widget.labelText,
                  hintStyle: const TextStyle(
                    color: appcolors.textColorwhite,
                    fontFamily: 'kanit',
                    fontSize: 18,
                  )),
            ),
          )),
    );
  }
}

class Mtextfield extends StatefulWidget {
  const Mtextfield(
      {super.key,
      required this.labelText,
      required this.onChanged,
      required this.hide,
      required this.controller});
  final String labelText;
  final ValueChanged<String>? onChanged;
  final bool hide;
  final TextEditingController controller;

  @override
  State<Mtextfield> createState() => _MtextfieldState();
}

class _MtextfieldState extends State<Mtextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: double.infinity,
          // height: 43,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              controller: widget.controller,
              onChanged: widget.onChanged,
              obscureText: widget.hide,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.labelText,
                  hintStyle: const TextStyle(
                    fontFamily: 'kanit',
                    fontSize: 18,
                  )),
            ),
          )),
    );
  }
}
