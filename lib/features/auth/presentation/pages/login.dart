import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/form/validators.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/widgets/form/k_phone_field.dart';
import 'package:rokus/core/widgets/k_button.dart';
import 'package:rokus/core/widgets/form/k_password_field.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/auth/presentation/pages/sign_up.dart';
import 'package:rokus/features/auth/presentation/widgets/helper_text_button.dart';

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
        phone: phoneCtrl.text,
        password: passwordCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("login context: ${context.hashCode}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                  //   "Login",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyles.style28w500,
                  // ),
                  const SizedBox(height: 50),
                  // DropdownBtn(
                  //   roleName: role.name,
                  //   onTap: () {
                  //     showDialog(
                  //         context: context,
                  //         builder: (context) => RoleSelectorDialog(
                  //               authController: authController,
                  //               shouldNavigateToAuth: false,
                  //               role: role,
                  //             )).then((value) {
                  //       if (value != null && value.runtimeType == Role) {
                  //         setState(() {
                  //           role = value;
                  //         });
                  //       }
                  //     });
                  //   },
                  // ),
                  // const SizedBox(height: Dimens.gMargin),
                  KTelPhoneField(
                    textEditingController: phoneCtrl,
                    isSubmitted: isSubmitted,
                  ),
                  const SizedBox(height: Dimens.gMargin),
                  KPasswordField(
                    textEditingController: passwordCtrl,
                    isSubmitted: isSubmitted,
                    validator: validateMin8,
                  ),
                  const HelperTextButton(
                    title: "Forgot password",
                    btnText: "Reset",
                  ),
                  // if (role.slug == 'resAdmin')
                  //   KTextField(
                  //     controller: accaountKeyCtrl,
                  //     isSubmitted: isSubmitted,
                  //     prefixIcon: Icons.lock,
                  //     labelText: "Admin key",
                  //   )
                  // else if (role.slug == 'resOperator')
                  //   KTextField(
                  //     controller: accaountKeyCtrl,
                  //     isSubmitted: isSubmitted,
                  //     prefixIcon: Icons.lock,
                  //     labelText: "Operator key",
                  //   ),
                  const SizedBox(height: Dimens.bMargin),
                  KButton(
                    onTap: post,
                    title: "Login",
                  ),
                  HelperTextButton(
                    title: "Don't have account",
                    btnText: "Sign up",
                    onPressed: () {
                      Get.to(() => SignUpScreen(
                            role: role,
                          ));
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
