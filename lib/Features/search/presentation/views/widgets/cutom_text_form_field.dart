import 'package:book/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onFieldSubmitted,
  });

  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: 'Search for books',
        suffixIcon: const Icon(
          Icons.search,
          size: 35,
        ),
        suffixIconColor: KSecondaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: KSecondaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
