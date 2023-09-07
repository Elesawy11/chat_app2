import 'package:chat_app2/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:chat_app2/views/chat_view.dart';

import 'package:chat_app2/widgets/login_view_form.dart';
import 'package:chat_app2/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  static String id = ' Login View';
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatView.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return LoginViewForm(
          isLoading: isLoading,
        );
      },
    );
  }
}
