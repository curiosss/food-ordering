import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/core/widgets/k_button.dart';
import 'package:rokus/core/widgets/k_password_field.dart';
import 'package:rokus/core/widgets/k_textfield.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/auth/presentation/pages/sign_up.dart';
import 'package:rokus/features/auth/presentation/widgets/dropdown_btn.dart';
import 'package:rokus/features/auth/presentation/widgets/helper_text_button.dart';
import 'package:rokus/features/auth/presentation/widgets/role_selector_dialog.dart';

class LoginScreen extends StatefulWidget {
  final Role? role;
  const LoginScreen({
    super.key,
    this.role,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find<AuthController>();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController accaountKeyCtrl = TextEditingController();

  late Role role;

  var formKey = GlobalKey<FormState>();
  bool isSubmitted = false;

  @override
  void initState() {
    if (widget.role != null) {
      role = widget.role!;
    } else {
      if (authController.selectedRole != null) {
        role = authController.selectedRole!.value;
      } else {
        role = authController.roles.first;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    accaountKeyCtrl.dispose();

    super.dispose();
  }

  post() async {
    if (formKey.currentState?.validate() ?? false) {
      await authController.login(
        role: role,
        phone: phoneCtrl.text,
        password: passwordCtrl.text,
        key: accaountKeyCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Dimens.minTabletWidth),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimens.gMargin),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyles.style28w500,
                  ),
                  const SizedBox(height: 50),
                  DropdownBtn(
                    roleName: role.name,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => RoleSelectorDialog(
                                authController: authController,
                                shouldNavigateToAuth: false,
                                role: role,
                              )).then((value) {
                        if (value != null && value.runtimeType == Role) {
                          setState(() {
                            role = value;
                          });
                        }
                      });
                    },
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KTextField(
                    controller: phoneCtrl,
                    isSubmitted: isSubmitted,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone_outlined,
                    prefixText: "+993",
                    hintText: "6XXXXXXX",
                    maxLength: 8,
                    labelText: "Phone number",
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KPasswordField(
                    textEditingController: passwordCtrl,
                    isSubmitted: isSubmitted,
                  ),
                  const HelperTextButton(
                    title: "Forgot password",
                    btnText: "Reset",
                  ),
                  if (role.slug == 'resAdmin')
                    KTextField(
                      controller: accaountKeyCtrl,
                      isSubmitted: isSubmitted,
                      prefixIcon: Icons.lock,
                      labelText: "Admin key",
                    )
                  else if (role.slug == 'resOperator')
                    KTextField(
                      controller: accaountKeyCtrl,
                      isSubmitted: isSubmitted,
                      prefixIcon: Icons.lock,
                      labelText: "Operator key",
                    ),
                  const SizedBox(height: Dimens.bMargin),
                  KButton(
                    onTap: post,
                    title: "Login",
                  ),
                  HelperTextButton(
                    title: "Don't have account",
                    btnText: "Sign up",
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
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
