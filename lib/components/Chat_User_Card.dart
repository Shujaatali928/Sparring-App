import 'package:flutter/material.dart';
import 'package:sparing_partners/Models/ChatUsers.dart';
import 'package:sparing_partners/Views/CHatpage.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key, required this.user});
  final ChatUser user;
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatPage(
                      Chatuser: widget.user,
                    ),
                  ));
            },
            child: ListTile(
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('lib/Asset/img/muhammadali.png')),
              title: Ctext(
                data: widget.user.name,
                color: appcolors.textColorblack,
              ),
              subtitle: Ctext(data: widget.user.about, color: Colors.grey),
              trailing: const Ctext(
                data: "07:00 pm",
                color: Colors.grey,
              ),
            )));
  }
}
