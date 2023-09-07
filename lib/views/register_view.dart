import 'package:chat_app2/cubits/register_cubit/register_cubit.dart';
import 'package:chat_app2/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_text_form_field.dart';

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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
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
                        icon: Icons.mail,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'password',
                        icon: Icons.lock,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(
                                    email: email!, password: password!);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff887BB0),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(fontSize: 24, fontFamily: 'Kanit'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an acount..   ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                color: Color(0xff887BB0),
                                fontSize: 18),
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
      ),
    );
  }
}
