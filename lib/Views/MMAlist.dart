import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sparing_partners/Views/PlayerProfile.dart';
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
            body: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          var category =
                              snapshot.data?.docs[index]["categories"];
                          bool isMMAplayer = category.contains("MMA");
                          if (isMMAplayer) {
                            var uid = snapshot.data?.docs[index].id;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlayerProfile(uid: uid)));
                              },
                              child: ListTile(
                                leading: const Image(
                                    image: AssetImage(
                                        "lib/Asset/img/mightymousemma.jpg"),
                                    height: 200),
                                title: CTextBold(
                                    data:
                                        "${snapshot.data?.docs[index]["fullName"]}"),
                                subtitle: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: appcolors.orangeColor)),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Ctext(
                                                data: 'Light Sparring',
                                                color:
                                                    appcolors.textColorblack),
                                            Ctext(
                                                data:
                                                    ("${snapshot.data?.docs[index]["location"]}"),
                                                color:
                                                    appcolors.textColorblack),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.phone_outlined,
                                        color: appcolors.orangeColor,
                                      ),
                                      const SizedBox(width: 10)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return null;
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            )));
  }
}
