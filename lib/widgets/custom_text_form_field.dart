import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.onPressedSuffix,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function()? onPressedSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'required faield';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: onPressedSuffix,
          icon: Icon(
            suffixIcon,
            color: Colors.black,
          ),
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
