import 'package:chat_app2/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:chat_app2/simple_bloc_observer.dart';
import 'package:chat_app2/views/chat_view.dart';
import 'package:chat_app2/views/login_view.dart';
import 'package:chat_app2/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/register_cubit/register_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginView.id: (context) =>  LoginView(),
          RegisterView.id: (context) => RegisterView(),
          ChatView.id: (context) =>  ChatView(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
      ),
    );
  }
}
