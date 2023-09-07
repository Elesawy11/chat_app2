import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff887BB0),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontFamily: 'Kanit'),
          ),
        ),
      ),
    );
  }
}
