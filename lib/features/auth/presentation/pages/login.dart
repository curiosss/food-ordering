import 'package:flutter/material.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/core/widgets/k_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneCtrl = TextEditingController();

  bool isSubmitted = false;

  @override
  void dispose() {
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text(
          //   "Login",
          // ),
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.gMargin),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyles.style26w400,
              ),
              const SizedBox(height: 50),
              KTextField(
                controller: phoneCtrl,
                isSubmitted: isSubmitted,
                prefixIcon: Icons.phone_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
