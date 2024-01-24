import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class MMAPlayerList extends StatefulWidget {
  const MMAPlayerList({super.key});

  @override
  State<MMAPlayerList> createState() => _MMAPlayerListState();
}

class _MMAPlayerListState extends State<MMAPlayerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.orangeColor,
        title: const CTextBold(
            data: "MMA Players", color: appcolors.textColorwhite),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Image(
                    image: AssetImage("lib/Asset/img/mightymousemma.jpg"),
                    height: 200),
                title: const CTextBold(data: "Mighty Mouse"),
                subtitle: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: appcolors.orangeColor)),
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ctext(
                                data: 'Light Sparring',
                                color: appcolors.textColorblack),
                            Ctext(
                                data: 'New York',
                                color: appcolors.textColorblack),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.phone_outlined,
                        color: appcolors.orangeColor,
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
