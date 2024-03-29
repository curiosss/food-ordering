import 'package:flutter/material.dart';
import 'package:rokus/core/utils/dimens.dart';

import 'k_textfield.dart';

class KPasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isSubmitted;
  final String? labelText;
  final String? Function(String?) validator;
  const KPasswordField({
    super.key,
    required this.textEditingController,
    required this.isSubmitted,
    this.labelText,
    required this.validator,
  });

  @override
  State<KPasswordField> createState() => _KPasswordFieldState();
}

class _KPasswordFieldState extends State<KPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return KTextField(
      controller: widget.textEditingController,
      isSubmitted: widget.isSubmitted,
      obscureText: obscureText,
      prefixIcon: Icons.lock,
      labelText: widget.labelText ?? "Password",
      validator: widget.validator,
      suffixIcon: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.sBorder),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
