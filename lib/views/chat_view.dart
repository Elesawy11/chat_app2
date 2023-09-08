import 'package:chat_app2/constant.dart';
import 'package:chat_app2/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text_field.dart';

class ChatView extends StatelessWidget {
  static String id = 'Chat View';
  ChatView({super.key, this.message});

  final MessageModel? message;

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessageCollection);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60, child: Image.asset(kLogo)),
            const Text('Chat')
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        Text(
                          ' message!.message',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                            'DateFormat.jm().format(message!.createdAt.toDate()).toString()')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
            child: CustomTextField(
              onSubmitted: (value) {
                messages.add(
                    {kMessage: value, kId: email, kCreatedAt: DateTime.now()});
              },
              text: 'send message',
              icon: Icons.send,
            ),
          )
        ],
      ),
    );
  }
}
