import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.text,
    this.icon,
    this.onSubmitted,
    this.controller,
    this.onPressedIcon,
    this.onChanged,
  });

  final String? text;
  final IconData? icon;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final void Function()? onPressedIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: IconButton(
              onPressed: onPressedIcon,
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
