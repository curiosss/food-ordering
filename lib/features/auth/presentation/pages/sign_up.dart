import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/form/validators.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/widgets/form/k_password_field.dart';
import 'package:rokus/core/widgets/form/k_phone_field.dart';
import 'package:rokus/core/widgets/form/k_textfield.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  final Role role;
  const SignUpScreen({
    super.key,
    required this.role,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Role role;
  AuthController authController = Get.find<AuthController>();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController surnameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController passwordRptCtrl = TextEditingController();

  bool isSubmitted = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    role = widget.role;
    super.initState();
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    nameCtrl.dispose();
    surnameCtrl.dispose();
    passwordCtrl.dispose();
    passwordRptCtrl.dispose();
    super.dispose();
  }

  post() async {
    if (!isSubmitted) {
      setState(() {
        isSubmitted = true;
      });
    }
    if (formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Dimens.minTabletWidth),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimens.gMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // const Text(
                  //   "Sign up",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyles.style28w500,
                  // ),
                  // const SizedBox(height: Dimens.gMargin),
                  KTelPhoneField(
                    textEditingController: phoneCtrl,
                    isSubmitted: isSubmitted,
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KTextField(
                    controller: nameCtrl,
                    isSubmitted: isSubmitted,
                    prefixIcon: Icons.account_circle_outlined,
                    labelText: "Name",
                    validator: validateMin3,
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KTextField(
                    controller: surnameCtrl,
                    isSubmitted: isSubmitted,
                    prefixIcon: Icons.account_circle_outlined,
                    labelText: "Surname",
                    validator: validateMin3,
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KPasswordField(
                    textEditingController: passwordCtrl,
                    isSubmitted: isSubmitted,
                    validator: validateMin8,
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KPasswordField(
                    textEditingController: passwordRptCtrl,
                    isSubmitted: isSubmitted,
                    labelText: "Repeat password",
                    validator: (p0) {
                      String? res = validateMin8(p0);
                      if (res != null) {
                        return res;
                      } else if (passwordCtrl.text != passwordRptCtrl.text) {
                        return "Passwords didn't match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: post,
                      child: const Text("Sign up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
