import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class MuayPlayersList extends StatefulWidget {
  const MuayPlayersList({super.key});

  @override
  State<MuayPlayersList> createState() => _MuayPlayersListState();
}

class _MuayPlayersListState extends State<MuayPlayersList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors.orangeColor,
        title: const CTextBold(
            data: "MUAY THAI Players", color: appcolors.textColorwhite),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Image(
                    image: AssetImage("lib/Asset/img/Saenchaimuay.jpg"),
                    height: 200),
                title: const CTextBold(data: "Saen Chai"),
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
