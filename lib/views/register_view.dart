import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'Register View';

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
                      style: TextStyle(fontSize: 24, color: Color(0xff887BB0)),
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
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    hintText: 'email',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff887BB0)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff887BB0)),
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff887BB0)),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff887BB0)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff887BB0)),
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff887BB0)),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {},
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
    );
  }
}
