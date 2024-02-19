import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:sparing_partners/Models/ChatUsers.dart';
import 'package:sparing_partners/Views/Chatpage.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class PlayerProfile extends StatefulWidget {
  const PlayerProfile({super.key, required this.uid});
  final dynamic uid;

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  // ChatUser? _chatUser;
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.uid)
            .snapshots(),
        builder: ((context, snapshot) {
          debugPrint(widget.uid);
          if (snapshot.connectionState == ConnectionState.active) {
            debugPrint("Connection Success");
            if (snapshot.hasData) {
              var userData = snapshot.data!.data() as Map<String, dynamic>;
              var fullName = userData['fullName'];
              var location = userData['location'];
              var experience = userData['experienceLevels'];
              bool bigenner =
                  experience != null && experience.contains('Beginner');
              bool intermediate =
                  experience != null && experience.contains('Intermediate');
              bool professional =
                  experience != null && experience.contains('Professional');
              bool advance =
                  experience != null && experience.contains('Advance');
              var sex = userData['Sex'];
              bool male = sex != null && sex.contains('Male');
              bool female = sex != null && sex.contains('Female');
              bool other = sex != null && sex.contains('Others');
              var age = userData['agegroup'];
              bool under18 = age != null && age.contains('18 & Under');
              bool above19 = age != null && age.contains('19 - 29');
              bool above30 = age != null && age.contains('30 - 39');
              bool above40 = age != null && age.contains('40 & Up');
              var weight = userData['weightclass'];
              bool below54 = weight != null &&
                  weight.contains('100 - 120LBS / 45.4 - 54.4KGS');
              bool below73 = weight != null &&
                  weight.contains('140 - 160LBS / 64 - 73KGS');
              bool below82 = weight != null &&
                  weight.contains('160 - 180LBS / 73 - 82KGS');

              // ChatUser _chatuser = ChatUser.fromJson(widget.uid);
              // _chatUser = ChatUser.fromJson(userData);

              return Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          color: appcolors.orangeColor,
                          width: double.infinity,
                          height: 125,
                        ),
                        Positioned(
                          left: 100,
                          right: 100,
                          top: 25,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    AssetImage('lib/Asset/img/muhammadali.png'),
                              ),
                              CTextBold(
                                data: fullName,
                                color: appcolors.textColorblack,
                              ),
                              Ctext(
                                  data: location,
                                  color: appcolors.textColorblack),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage(
                                                        Chatuser: widget.uid,
                                                      )));
                                        },
                                        icon: const Icon(
                                          Icons.chat_rounded,
                                          color: appcolors.orangeColor,
                                          size: 30,
                                        )),
                                  ),
                                  const SizedBox(width: 50),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.location_on,
                                          color: appcolors.orangeColor,
                                          size: 30,
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Experience
                        const CTextBold(data: 'EXPERIENCE LEVEL'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                bigenner
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Beginner',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                intermediate
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Intermediate',
                                    color: appcolors.textColorblack)
                              ],
                            ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                advance
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Advanced',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                professional
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Professional',
                                    color: appcolors.textColorblack)
                              ],
                            ))
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Divider(
                            height: 20,
                            color: appcolors.textColorblack,
                          ),
                        ),

                        //Age
                        const CTextBold(data: 'AGE'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                under18
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: '18 & Under',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                above19
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: '19 - 30',
                                    color: appcolors.textColorblack)
                              ],
                            ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                above30
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: '30 - 39',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                above40
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: '40 & UP',
                                    color: appcolors.textColorblack)
                              ],
                            ))
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Divider(
                            height: 20,
                            color: appcolors.textColorblack,
                          ),
                        ),

                        // Sex
                        const CTextBold(data: 'SEX'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                male
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Male',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                female
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Female',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                other
                                    ? const Icon(Icons.thumb_up_outlined,
                                        color: appcolors.orangeColor)
                                    : const Icon(Icons.thumb_down_outlined,
                                        color: appcolors.textColorblack),
                                const SizedBox(width: 5),
                                const Ctext(
                                    data: 'Others',
                                    color: appcolors.textColorblack)
                              ],
                            )),
                            const Divider(
                              height: 1,
                              color: appcolors.textColorblack,
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Divider(
                            height: 20,
                            color: appcolors.textColorblack,
                          ),
                        ),
                        // Weight Class
                        const CTextBold(data: 'WEIGHT CLASS'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            below54
                                ? const Icon(Icons.thumb_up_outlined,
                                    color: appcolors.orangeColor)
                                : const Icon(Icons.thumb_down_outlined,
                                    color: appcolors.textColorblack),
                            const Ctext(
                                data: '100 - 120LBS / 45.4 - 54.4KGS',
                                color: appcolors.textColorblack)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            below73
                                ? const Icon(Icons.thumb_up_outlined,
                                    color: appcolors.orangeColor)
                                : const Icon(Icons.thumb_down_outlined,
                                    color: appcolors.textColorblack),
                            const SizedBox(width: 5),
                            const Ctext(
                                data: '140 - 160LBS / 64 - 73KGS',
                                color: appcolors.textColorblack)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            below82
                                ? const Icon(Icons.thumb_up_outlined,
                                    color: appcolors.orangeColor)
                                : const Icon(Icons.thumb_down_outlined,
                                    color: appcolors.textColorblack),
                            const SizedBox(width: 5),
                            const Ctext(
                                data: '160 - 180LBS / 73 - 82KGS',
                                color: appcolors.textColorblack)
                          ],
                        ),
                        const Padding(
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
              );
            } else {
              return const Center(child: Text("Document not found"));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            debugPrint("Connection State: Waiting");
            return const Center(
                child: CircularProgressIndicator()); // Show loading indicator
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint("Error: ${snapshot.error}");
            debugPrint("Connection State: Done");
            if (snapshot.hasError) {
              debugPrint("Error: ${snapshot.error}");
              return Center(child: Text("Error: ${snapshot.error}"));
            }
          }
          return const Text(""); // Default empty container
        }),
      ),
    ));
  }
}
