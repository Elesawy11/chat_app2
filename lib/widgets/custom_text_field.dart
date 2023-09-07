import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.text,
    this.icon, this.onSubmitted,
  });

  final String? text;
  final IconData? icon;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.black,
              )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
