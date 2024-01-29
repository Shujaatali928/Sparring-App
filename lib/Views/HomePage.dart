import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sparing_partners/Views/Bxinglist.dart';
import 'package:sparing_partners/Views/Jiulist.dart';
import 'package:sparing_partners/Views/Login.dart';
import 'package:sparing_partners/Views/MMAlist.dart';
import 'package:sparing_partners/Views/Muaylist.dart';
import 'package:sparing_partners/Views/WrestlingList.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';
// import 'package:sparing_partners/components/firebasefetchdata.dart';
import 'package:sparing_partners/components/textfield.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final TextEditingController _searchbartextcontroller =
      TextEditingController();
  final auth = FirebaseAuth.instance;
  DocumentReference userName = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  String fullName = '';
  @override
  Widget build(BuildContext context) {
    userName.get().then((DocumentSnapshot ds) {
      fullName = ds['fullName'];
      print(fullName);
    });
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appcolors.orangeColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage(
                    "lib/Asset/img/BoxingGloves.png",
                  ),
                  width: double.infinity,
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: appcolors.textColorwhite,
                            )),
                        Ctext(
                            data: fullName.toString(),
                            color: appcolors.textColorwhite),
                        IconButton(
                            onPressed: () {
                              auth.signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              }).onError((error, stackTrace) {
                                Fluttertoast.showToast(msg: error.toString());
                              });
                            },
                            icon: const Icon(
                              Icons.logout_outlined,
                              color: appcolors.textColorwhite,
                            )),
                      ],
                    ),
                    const SizedBox(height: 70),
                    const Center(
                      child: Ctext(
                          data: "Find A Sparring Partner Now",
                          color: appcolors.textColorwhite),
                    ),
                    CWtextfield(
                        controller: _searchbartextcontroller,
                        labelText: 'Search',
                        onChanged: (value) {
                          debugPrint('Search: $value');
                        },
                        hide: false),
                  ],
                )
              ],
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CTextBold(
                        data: "Categories", color: appcolors.textColorwhite),
                  ),

                  //Boxing
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BoxingPlayerList()));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage('lib/Asset/img/boxingback.png'),
                            // height: 50,
                          ),
                          Positioned(
                            top: 125,
                            left: 50,
                            right: 50,
                            child: Center(
                              child: CtextHeading(
                                data: 'BOXING',
                                color: appcolors.textColorwhite,
                                fontsize: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // MMA and Wrestling
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MMAPlayerList()));
                          },
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage('lib/Asset/img/mmaback.png'),
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 130,
                                child: Center(
                                  child: CtextHeading(
                                    data: 'M M A',
                                    color: appcolors.textColorwhite,
                                    fontsize: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),

                        //Wrestling
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WrestlingPlayerList()));
                          },
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'lib/Asset/img/wrestlingback.png'),
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                              Positioned(
                                top: 130,
                                child: Center(
                                  child: CtextHeading(
                                    data: 'WRESTLING',
                                    color: appcolors.textColorwhite,
                                    fontsize: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  // Jiu and Muay
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const JiuPlayersList()));
                          },
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage('lib/Asset/img/jiuback.png'),
                                fit: BoxFit.fitHeight,
                                height: 180,
                              ),
                              Positioned(
                                top: 130,
                                child: Center(
                                  child: CtextHeading(
                                    data: 'JIU JITSU',
                                    color: appcolors.textColorwhite,
                                    fontsize: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MuayPlayersList()));
                          },
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage('lib/Asset/img/muayback.png'),
                                height: 180,
                                fit: BoxFit.fitHeight,
                              ),
                              Positioned(
                                top: 130,
                                child: Center(
                                  child: CtextHeading(
                                    data: 'MUAY THAI',
                                    color: appcolors.textColorwhite,
                                    fontsize: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
