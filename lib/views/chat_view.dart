import 'package:chat_app2/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class ChatView extends StatelessWidget {
  static String id = 'Chat View';
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: const Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        Text(
                          'kfskdljlskdjklsdklsdfjklfs',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('25')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
            child: CustomTextField(
              text: 'send message',
              icon: Icons.send,
            ),
          )
        ],
      ),
    );
  }
}
