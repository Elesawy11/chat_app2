import 'package:chat_app2/views/login_view.dart';
import 'package:chat_app2/views/register_view.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  return runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
    );
  }
}
