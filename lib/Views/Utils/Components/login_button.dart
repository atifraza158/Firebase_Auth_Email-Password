import 'package:flutter/material.dart';

import '../Styles/theme.dart';


class CommonButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CommonButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppTheme.themeColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
