import 'package:flutter/material.dart';

class Ctext extends StatefulWidget {
  const Ctext({super.key, required this.data, required this.color});
  final String data;
  final Color? color;

  @override
  State<Ctext> createState() => _CtextState();
}

class _CtextState extends State<Ctext> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data,
        style: TextStyle(
          color: widget.color,
          fontSize: 20,
          fontFamily: 'kanit',
        ));
  }
}

class CTextBold extends StatefulWidget {
  const CTextBold({super.key, required this.data, this.color});
  final String data;
  final Color? color;

  @override
  State<CTextBold> createState() => _CTextBoldState();
}

class _CTextBoldState extends State<CTextBold> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data,
        style: TextStyle(
            color: widget.color,
            fontSize: 20,
            fontFamily: 'kanit',
            fontWeight: FontWeight.bold));
  }
}

class CtextHeading extends StatefulWidget {
  const CtextHeading(
      {super.key, required this.data, this.color, this.fontsize});
  final String data;
  final double? fontsize;
  final Color? color;
  @override
  State<CtextHeading> createState() => _CtextHeadingState();
}

class _CtextHeadingState extends State<CtextHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data,
        style: TextStyle(
          color: widget.color,
          fontSize: widget.fontsize,
          fontFamily: 'kanit',
        ));
  }
}
