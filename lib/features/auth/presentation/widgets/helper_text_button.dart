import 'package:flutter/material.dart';

class HelperTextButton extends StatelessWidget {
  final String title;
  final String btnText;
  final Function()? onPressed;
  const HelperTextButton({
    super.key,
    required this.title,
    required this.btnText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "$title?  ",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
