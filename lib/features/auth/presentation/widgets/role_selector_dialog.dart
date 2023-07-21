import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/auth/presentation/pages/login.dart';

class RoleSelectorDialog extends StatelessWidget {
  final Role role;
  final AuthController authController;
  final bool shouldNavigateToAuth;
  const RoleSelectorDialog({
    super.key,
    required this.role,
    required this.authController,
    required this.shouldNavigateToAuth,
  });

  goToLogin(Role role, BuildContext context) {
    if (shouldNavigateToAuth) {
      Get.off(LoginScreen(role: role));
    } else {
      Navigator.pop(context, role);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.sBorder),
      ),
      child: Container(
        padding: const EdgeInsets.all(Dimens.hMargin),
        constraints: BoxConstraints(maxWidth: Dimens.minTabletWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: authController.roles.map((e) {
            return ListTile(
              onTap: () {
                goToLogin(e, context);
              },
              leading: Radio(
                value: e.id,
                groupValue: role.id,
                onChanged: (value) {
                  goToLogin(e, context);
                },
              ),
              title: Text(
                e.name,
                style: TextStyles.style17w400,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
