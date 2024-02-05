import 'package:flutter/material.dart';
import 'package:sparing_partners/Api/apis.dart';
import 'package:sparing_partners/Models/Massages.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class MassageCard extends StatefulWidget {
  const MassageCard({super.key, required this.massage});

  final Message massage;
  @override
  State<MassageCard> createState() => MmassagCcardState();
}

class MmassagCcardState extends State<MassageCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.massage.fromId
        ? Sendmassage()
        : Receivemassage();
  }

  Widget Sendmassage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.done_all_outlined,
                color: Colors.blue,
                size: 30,
              ),
              Ctext(data: widget.massage.read, color: Colors.grey),
            ],
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: appcolors.orangeColor, width: 2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                      bottomLeft: Radius.circular(11))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ctext(
                  data: widget.massage.msg,
                  color: appcolors.textColorblack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Receivemassage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                  color: appcolors.orangeColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ctext(
                  data: widget.massage.msg,
                  color: appcolors.textColorwhite,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Ctext(data: widget.massage.sent, color: Colors.grey),
        ],
      ),
    );
  }
}
