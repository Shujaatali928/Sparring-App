import 'package:flutter/material.dart';
import 'package:sparing_partners/Api/apis.dart';
import 'package:sparing_partners/Models/ChatUsers.dart';
import 'package:sparing_partners/components/Chat_User_Card.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<ChatUser> users = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const CTextBold(
                data: "Masseges",
                color: appcolors.textColorwhite,
              ),
              backgroundColor: appcolors.orangeColor,
            ),
            body: StreamBuilder(
                stream: APIs.firestore.collection("Users").snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      users = data
                              ?.map((e) => ChatUser.fromJson(e.data()))
                              .toList() ??
                          [];

                      if (users.isNotEmpty) {
                        return ListView.builder(
                            itemCount: users.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ChatUserCard(user: users[index]);
                            });
                      } else {
                        return const Center(
                          child: Ctext(
                            data: "No Connection Found",
                            color: Colors.grey,
                          ),
                        );
                      }
                  }
                })));
  }
}
