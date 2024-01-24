import 'package:flutter/material.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class PlayerProfile extends StatefulWidget {
  const PlayerProfile({super.key});

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appcolors.orangeColor,
            title: const CTextBold(
              data: 'Player Profile',
              color: appcolors.textColorwhite,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: appcolors.orangeColor,
                      height: 125,
                    ),
                    const Positioned(
                      left: 100,
                      right: 100,
                      top: 50,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('lib/Asset/img/muhammadali.png'),
                          ),
                          CTextBold(
                            data: "Muhammad Ali",
                            color: appcolors.textColorblack,
                          ),
                          Ctext(
                              data: 'Light Sparring',
                              color: appcolors.textColorblack),
                          Ctext(
                              data: 'New York',
                              color: appcolors.textColorblack),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Experience
                    CTextBold(data: 'EXPERIENCE LEVEL'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Beginner',
                                color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Intermediate',
                                color: appcolors.textColorblack)
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_down_outlined,
                                color: appcolors.textColorblack),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Advanced',
                                color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_down_outlined,
                                color: appcolors.textColorblack),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Professional',
                                color: appcolors.textColorblack)
                          ],
                        ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        height: 20,
                        color: appcolors.textColorblack,
                      ),
                    ),

                    //Age
                    CTextBold(data: 'AGE'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: '18 & Under',
                                color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: '19 - 30',
                                color: appcolors.textColorblack)
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: '30 - 39',
                                color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_down_outlined,
                                color: appcolors.textColorblack),
                            SizedBox(width: 5),
                            Ctext(
                                data: '40 & UP',
                                color: appcolors.textColorblack)
                          ],
                        ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        height: 20,
                        color: appcolors.textColorblack,
                      ),
                    ),

                    // Sex
                    CTextBold(data: 'SEX'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(data: 'Male', color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_up_outlined,
                                color: appcolors.orangeColor),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Female', color: appcolors.textColorblack)
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(Icons.thumb_down_outlined,
                                color: appcolors.textColorblack),
                            SizedBox(width: 5),
                            Ctext(
                                data: 'Others', color: appcolors.textColorblack)
                          ],
                        )),
                        Divider(
                          height: 1,
                          color: appcolors.textColorblack,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        height: 20,
                        color: appcolors.textColorblack,
                      ),
                    ),
                    // Weight Class
                    CTextBold(data: 'WEIGHT CLASS'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.thumb_up_outlined,
                            color: appcolors.orangeColor),
                        SizedBox(width: 5),
                        Ctext(
                            data: '100 - 120LBS / 45.4 - 54.4KGS',
                            color: appcolors.textColorblack)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.thumb_up_outlined,
                            color: appcolors.orangeColor),
                        SizedBox(width: 5),
                        Ctext(
                            data: '140 - 160LBS / 64 - 73KGS',
                            color: appcolors.textColorblack)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.thumb_up_outlined,
                            color: appcolors.orangeColor),
                        SizedBox(width: 5),
                        Ctext(
                            data: '160 - 180LBS / 73 - 82KGS',
                            color: appcolors.textColorblack)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        height: 20,
                        color: appcolors.textColorblack,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
