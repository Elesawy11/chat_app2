import 'package:chat_app2/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String id;
  final Timestamp createdAt;

  MessageModel({
    required this.createdAt,
    required this.message,
    required this.id,
  });
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData[kMessage],
      id: jsonData[kId],
      createdAt: jsonData[kCreatedAt],
    );
  }
}
