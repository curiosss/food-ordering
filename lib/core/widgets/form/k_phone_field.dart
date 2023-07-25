import 'package:flutter/material.dart';
import 'package:rokus/core/form/validators.dart';

import 'k_textfield.dart';

class KTelPhoneField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isSubmitted;
  const KTelPhoneField({
    super.key,
    required this.textEditingController,
    required this.isSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return KTextField(
      controller: textEditingController,
      isSubmitted: isSubmitted,
      keyboardType: TextInputType.number,
      prefixIcon: Icons.phone_outlined,
      prefixText: "+993",
      hintText: "6XXXXXXX",
      maxLength: 8,
      labelText: "Phone number",
      validator: validatePhone,
    );
  }
}
