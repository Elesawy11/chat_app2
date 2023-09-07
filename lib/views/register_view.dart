import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String id = 'Register View';

  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style:
                            TextStyle(fontSize: 24, color: Color(0xff887BB0)),
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
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
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
                          style: TextStyle(fontSize: 24, fontFamily: 'Kanit'),
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
    );
  }
}
