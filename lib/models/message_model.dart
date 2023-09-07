import 'package:chat_app2/constant.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel({required this.message, required this.id});
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(message: jsonData[kMessage], id: jsonData[kId]);
  }
}
