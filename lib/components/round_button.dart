import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
  });

  final Color backgroundColor;
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
      ),
      child: Text(text),
    );
  }
}
