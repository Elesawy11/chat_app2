// ignore_for_file: must_be_immutable

import 'package:chat_app2/constant.dart';
import 'package:chat_app2/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:chat_app2/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/custom_text_field.dart';

class ChatView extends StatefulWidget {
  static String id = 'Chat View';
  ChatView({
    super.key,
    this.message,
  });

  final MessageModel? message;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<MessageModel> messageList = [];

  final TextEditingController controller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (messageList[index].id == email) {
                        return Row(children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xffF4B9B8),
                            child: Text(messageList[index].name),
                          ),
                          ChatBubble(
                            message: messageList[index],
                          ),
                        ]);
                      } else {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ChatBubbleForFriend(
                                message: messageList[index],
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xffF4B9B8),
                                child: Text(messageList[index].name),
                              ),
                            ]);
                      }
                    });
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
            child: CustomTextField(
              controller: controller,
              onSubmitted: (message) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: message, email: email);

                controller.clear();
                scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              text: 'send message',
              icon: Icons.send,
              onPressedIcon: () {
                if (controller.text.isNotEmpty) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: controller.text, email: email);
                }
                controller.clear();
              },
            ),
          )
        ],
      ),
    );
  }
}
