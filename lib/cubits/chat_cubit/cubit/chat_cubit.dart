import 'package:bloc/bloc.dart';
import 'package:chat_app2/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../constant.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> messageList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: message,
      kId: email,
      kCreatedAt: DateTime.now(),
    });
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();

      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messages: messageList));
    });
  }
}
