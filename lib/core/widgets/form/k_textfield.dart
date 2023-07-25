import 'package:flutter/material.dart';
import 'package:rokus/core/utils/dimens.dart';

class KTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? prefixText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool isSubmitted;
  final bool? isEnabled;
  // final MaskTextInputFormatter? formatter;
  final bool upperCase;
  final Function(String)? onChange;
  final TextStyle? labelStyle;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final bool? isDense;
  final bool? autofocus;
  final bool obscureText;

  const KTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.prefixText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    this.isEnabled,
    required this.isSubmitted,
    // this.formatter,
    this.upperCase = false,
    this.onChange,
    this.labelStyle,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.isDense,
    this.autofocus,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      autovalidateMode:
          isSubmitted ? AutovalidateMode.always : AutovalidateMode.disabled,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      textCapitalization: textCapitalization,
      maxLength: maxLength,
      maxLines: maxLines,
      enabled: isEnabled,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: onChange,

      // onChanged: prefixIcon != null
      //     ? (val) {
      //         if (onChange != null) {
      //           onChange!(val);
      //         }
      //         if (active && controller.text.isEmpty) {
      //           setState(() {
      //             active = false;
      //           });
      //         } else if (!active && controller.text.isNotEmpty) {
      //           setState(() {
      //             active = true;
      //           });
      //         }
      //       }
      //     : onChange,
      validator: validator ??
          (value) {
            if (value != null && value.isNotEmpty) {
              return null;
            }
            // return AppLocalizations.of(context).requiredToFill;
            return "Required to fill";
          },
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        isDense: isDense,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimens.sMargin,
          vertical: Dimens.hMargin,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
        // suffixIconConstraints:
        //     const BoxConstraints(maxHeight: 20, maxWidth: 30),
        prefixText: prefixText,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.sBorder),
        ),
        errorMaxLines: 2,
        prefixStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 16,
        ),
      ),
    );
  }
}
