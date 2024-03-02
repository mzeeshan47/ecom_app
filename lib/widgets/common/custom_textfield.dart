import 'package:ecom_app/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.validator,
  });

  final String? title;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.color1,
                fontSize: 16)),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          decoration: InputDecoration(
              hintStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.black45),
              hintText: hint,
              isDense: true,
              fillColor: AppColor.color2,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ))),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
