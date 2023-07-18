import 'package:flutter/material.dart';
import 'package:rokus/core/utils/dimens.dart';

class KTextField extends StatefulWidget {
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
  });

  @override
  State<KTextField> createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool active = false;
  @override
  void initState() {
    active = widget.controller.text.isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus ?? false,
      autovalidateMode: widget.isSubmitted
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.done,
      textCapitalization: widget.textCapitalization,
      // inputFormatters: widget.formatter != null ? [widget.formatter!] : null,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      enabled: widget.isEnabled,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.prefixIcon != null
          ? (val) {
              if (widget.onChange != null) {
                widget.onChange!(val);
              }
              if (active && widget.controller.text.isEmpty) {
                setState(() {
                  active = false;
                });
              } else if (!active && widget.controller.text.isNotEmpty) {
                setState(() {
                  active = true;
                });
              }
            }
          : widget.onChange,
      // validator: widget.validator ??
      //     (value) {
      //       if (value != null && value.isNotEmpty) {
      //         return null;
      //       }
      //       return AppLocalizations.of(context).requiredToFill;
      //     },
      decoration: InputDecoration(
        isDense: widget.isDense,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.sMargin, vertical: Dimens.hMargin),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: active
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).hintColor,
              )
            : null,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 20, maxWidth: 30),
        prefixText: widget.prefixText,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        alignLabelWithHint: true,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.sBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.sBorder),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 2,
        prefixStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 16,
          // height: 1.0,
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 16,
      ),
    );
  }
}