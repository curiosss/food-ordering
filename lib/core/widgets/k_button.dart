import 'package:flutter/material.dart';

class KButton extends StatefulWidget {
  final String title;
  final Function onTap;
  const KButton({
    super.key,
    this.title = '',
    required this.onTap,
  });

  @override
  State<KButton> createState() => _KButtonState();
}

class _KButtonState extends State<KButton> {
  bool isLoading = false;

  onTap() async {
    isLoading = true;
    if (mounted) setState(() {});
    await widget.onTap();
    isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? const SizedBox(
                height: 23,
                width: 23,
                child: CircularProgressIndicator.adaptive(
                    // backgroundColor: Colors.white,
                    // valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGrey),
                    ),
                // child: CupertinoActivityIndicator(
                //   color: AppColors.darkGrey,
                // ),
              )
            : Text(widget.title),
      ),
    );
  }
}
