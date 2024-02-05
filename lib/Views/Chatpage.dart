// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sparing_partners/Api/apis.dart';
import 'package:sparing_partners/Models/ChatUsers.dart';
import 'package:sparing_partners/Models/Massages.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';
import 'package:sparing_partners/components/massage_card.dart';
import 'package:sparing_partners/components/textfield.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.Chatuser});
  final ChatUser Chatuser;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> _list = [];
  final _massagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
                backgroundImage: AssetImage('lib/Asset/img/muhammadali.png')),
            const SizedBox(width: 20),
            CTextBold(
              data: widget.Chatuser.name,
              color: appcolors.textColorwhite,
            ),
          ],
        ),
        backgroundColor: appcolors.orangeColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: APIs.getAllMessages(widget.Chatuser),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        _list = data
                                ?.map((e) => Message.fromJson(e.data()))
                                .toList() ??
                            [];

                        if (_list.isNotEmpty) {
                          return ListView.builder(
                              itemCount: _list.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return MassageCard(massage: _list[index]);
                              });
                        } else {
                          return const Center(
                            child: Ctext(
                              data: "Say Hi ",
                              color: Colors.grey,
                            ),
                          );
                        }
                    }
                  })),
          _chattextinput(),
        ],
      ),
    ));
  }

  Widget _chattextinput() {
    return Row(children: [
      Expanded(
        child: Mtextfield(
          labelText: "Write Massege",
          onChanged: (value) {},
          hide: false,
          controller: _massagecontroller,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: IconButton(
            onPressed: () {
              if (_massagecontroller.text.isNotEmpty) {
                APIs.sendMassage(
                    widget.Chatuser, _massagecontroller.text, Type.text);
                _massagecontroller.text = '';
              }
            },
            icon: const Icon(
              Icons.send,
              color: appcolors.orangeColor,
              size: 30,
            )),
      ),
      const SizedBox(width: 10),
    ]);
  }
}
