import 'package:chat_app2/cubits/register_cubit/register_cubit.dart';
import 'package:chat_app2/views/chat_view.dart';
import 'package:chat_app2/widgets/register_view_form.dart';
import 'package:chat_app2/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String id = 'Register View';

  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            Navigator.pushNamed(context, ChatView.id);
            isLoading = false;
          } else if (state is RegisterFailure) {
            showSnackBar(context, state.errMessage);
            isLoading = false;
          }
        },
        child: RegisterViewForm(
          isLoading: isLoading,
        ));
  }
}
