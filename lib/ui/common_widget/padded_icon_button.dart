import 'package:flutter/material.dart';

class PaddedIconButton extends StatelessWidget {
  const PaddedIconButton({
    required this.padding,
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
