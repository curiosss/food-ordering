import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/auth/presentation/pages/login.dart';

class RoleSelectorDialog extends StatelessWidget {
  final AuthController authController;
  const RoleSelectorDialog({super.key, required this.authController});

  goToLogin(int roleId) {
    authController.selectedRoleId.value = roleId;
    Get.off(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.sBorder),
      ),
      child: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(Dimens.hMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: authController.roles.map((e) {
              return ListTile(
                onTap: () {
                  goToLogin(e.id);
                },
                leading: Radio(
                  value: e.id,
                  groupValue: authController.selectedRoleId.value,
                  onChanged: (value) {
                    goToLogin(e.id);
                  },
                ),
                title: Text(
                  e.name,
                  style: TextStyles.style17w400,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
