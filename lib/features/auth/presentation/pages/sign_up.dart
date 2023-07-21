import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/app_colors.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/core/widgets/k_textfield.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  final int? roleId;
  const SignUpScreen({
    super.key,
    this.roleId,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.find<AuthController>();
  TextEditingController phoneCtrl = TextEditingController();

  bool isSubmitted = false;

  @override
  void dispose() {
    print('disposing sign up');
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sign up",
              textAlign: TextAlign.center,
              style: TextStyles.style28w500,
            ),
            const SizedBox(height: 50),
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.sBorder),
                border: Border.all(
                  width: 1,
                  color: AppColors.darkGrey,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(Dimens.sBorder),
                onTap: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => RoleSelectorDialog(
                  //           authController: authController,
                  //           shouldNavigateToAuth: false,
                  //         ));
                },
                child: const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimens.hMargin),
                        child: Text(
                          "User",
                          style: TextStyles.style17w400,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.darkGrey,
                    ),
                  ],
                ),
              ),
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
            KTextField(
              controller: phoneCtrl,
              isSubmitted: isSubmitted,
              prefixIcon: Icons.lock,
              labelText: "Password",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Forgot password?  ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimens.gMargin),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.black,
                //   foregroundColor: Colors.white,
                // ),
                child: const Text("Sign up"),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     const Text(
            //       "Already have account?  ",
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //         color: Colors.black,
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       child: const Text(
            //         "Login",
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
