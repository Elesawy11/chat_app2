import 'package:chat_app2/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:chat_app2/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:chat_app2/views/chat_view.dart';

import 'package:chat_app2/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'register_view.dart';

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
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatView.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffFAE8E0), Color(0xffD8A7B1)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        Image.asset('assets/images/scholar.png'),
                        const SizedBox(
                          height: 60,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome To',
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xff887BB0)),
                            ),
                            Text(
                              ' Scholar Chat',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Kanit',
                                  color: Color(0xff887BB0)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        CustomTextFormField(
                          hintText: 'email',
                          prefixIcon: Icons.mail,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                         
                         
                          obscureText: true,
                          hintText: 'password',
                          prefixIcon: Icons.lock,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        CustomButton(
                          text: 'Login',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).loginUser(
                                  email: email!, password: password!);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'don\'t have an acount?  ',
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RegisterView.id);
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    fontFamily: 'Kanit',
                                    color: Color(0xff887BB0),
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
