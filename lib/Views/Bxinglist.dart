import 'package:flutter/material.dart';
import 'package:sparing_partners/Views/PlayerProfile.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class BoxingPlayerList extends StatefulWidget {
  const BoxingPlayerList({super.key});

  @override
  State<BoxingPlayerList> createState() => _BoxingPlayerListState();
}

class _BoxingPlayerListState extends State<BoxingPlayerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.orangeColor,
        title: const CTextBold(
            data: "Boxing Players", color: appcolors.textColorwhite),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayerProfile()));
              },
              child: ListTile(
                leading: const Image(
                    image: AssetImage("lib/Asset/img/muhammadali.png"),
                    height: 200),
                title: const CTextBold(data: "Muhammad Ali"),
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
