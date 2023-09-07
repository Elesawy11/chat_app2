import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.icon,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'required faield';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        hintText: hintText,
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
    );
  }
}
