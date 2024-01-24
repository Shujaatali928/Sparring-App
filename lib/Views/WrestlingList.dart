import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class WrestlingPlayerList extends StatefulWidget {
  const WrestlingPlayerList({super.key});

  @override
  State<WrestlingPlayerList> createState() => _WrestlingPlayerListState();
}

class _WrestlingPlayerListState extends State<WrestlingPlayerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.orangeColor,
        title: const CTextBold(
            data: "Wrestling Players", color: appcolors.textColorwhite),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Image(
                    image: AssetImage("lib/Asset/img/therockwrestling.jpg"),
                    height: 200),
                title: const CTextBold(data: "The Rock"),
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
