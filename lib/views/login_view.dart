import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  SizedBox(height: 120,),
            Image.asset('assets/images/scholar.png'),
          const  SizedBox(height: 60,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  ' Scholar Chat',
                  style: TextStyle(fontSize: 24, fontFamily: 'Kanit'),
                ),
              ],
            ),
          const  SizedBox(height: 60,),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                hintText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          const  SizedBox(height: 20,),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          const  SizedBox(height: 60,),

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
                    'Login',
                    style: TextStyle(fontSize: 24, fontFamily: 'Kanit'),
                  ),
                ),
              ),
            ),
          const  SizedBox(height: 8,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don\'t have an acount?  '),
                Text(
                  'Register',
                  style: TextStyle(fontFamily: 'Kanit'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
