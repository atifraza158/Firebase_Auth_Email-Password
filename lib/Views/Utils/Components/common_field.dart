import 'package:flutter/material.dart';

import '../Styles/theme.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? ketboardType;
  final String? hintText;
  final Widget? icon;
  final String? Function(String?)? validate;
  final bool obsecureText;

  const CommonTextField({
    super.key,
    this.icon,
    required this.controller,
    this.ketboardType,
    this.hintText,
    required this.validate,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 55,
      child: TextFormField(
        obscureText: obsecureText,
        controller: controller,
        keyboardType: ketboardType,
        cursorColor: AppTheme.themeColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'poppins'),
          suffixIcon: icon,
          focusColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.themeColor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: validate,
      ),
    );
  }
}
