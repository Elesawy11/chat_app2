import 'package:chat_app2/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String id;
  final Timestamp createdAt;
  final String name;

  MessageModel(
      {required this.createdAt,
      required this.message,
      required this.id,
      required this.name});
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      name: jsonData[kName],
      message: jsonData[kMessage],
      id: jsonData[kId],
      createdAt: jsonData[kCreatedAt],
    );
  }
}
