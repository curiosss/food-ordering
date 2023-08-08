import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/snackbar/confirm_dialog.dart';
import 'package:rokus/core/utils/app_colors.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/auth/presentation/pages/login.dart';
import 'package:rokus/features/auth/presentation/widgets/dropdown_btn.dart';
import 'package:rokus/features/auth/presentation/widgets/role_selector_dialog.dart';

// ignore: must_be_immutable
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  // AuthController authController = Get.find<AuthController>();

  // logout(BuildContext context) async {

  // }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.horizontal(right: Radius.circular(Dimens.gBorder)),
      ),
      child: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Dimens.sMargin),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 2 * Dimens.sMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      Obx(
                        () {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: Dimens.sMargin,
                              bottom: Dimens.hMargin,
                            ),
                            child: authController.user.value != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.orangeAccent,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                authController
                                                    .getUserNameLetters(),
                                                style: TextStyles.style16w500,
                                              ),
                                            ),
                                            const SizedBox(
                                                width: Dimens.hMargin),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 3.0),
                                                    child: Text(
                                                      '${authController.user.value!.name} ${authController.user.value!.surname}',
                                                      style: TextStyles
                                                          .style16w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    authController.user.value!
                                                        .trimmedPhone,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: Dimens.hMargin),
                                      DropdownBtn(
                                        height: 40,
                                        roleName: "User",
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                RoleSelectorDialog(
                                              authController: authController,
                                              shouldNavigateToAuth: true,
                                              role: authController
                                                  .selectedRole!.value,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.sBorder),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text("Ulgama girin"),
                                    ),
                                  ),
                          );
                        },
                      ),
                      buildDrawerItem(
                        title: "Profile",
                        slug: "profile",
                      ),
                      const Divider(height: 2),
                      buildDrawerItem(
                        title: "Orders",
                        slug: "profile",
                      ),
                      const Divider(height: 2),
                      buildDrawerItem(
                        title: "Rules",
                        slug: "profile",
                      ),
                      const Divider(height: 2),
                      buildDrawerItem(
                        title: "About us",
                        slug: "profile",
                      ),
                    ],
                  ),
                  Obx(() {
                    if (authController.user.value != null) {
                      return Container(
                        height: 40,
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          bottom: Dimens.hMargin,
                        ),
                        child: OutlinedButton(
                          onPressed: () async {
                            // logout(context);
                            if (await confirm(
                              context,
                              title: "Logout",
                              content: "Are you sure you want to logout?",
                            )) {
                              authController.logout();
                            }
                          },
                          child: const Text("Logout"),
                        ),
                      );
                    }
                    return Container();
                  }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  buildDrawerItem({
    required String title,
    required String slug,
  }) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.hMargin),
      title: Text(
        title,
        style: TextStyles.style18w400,
      ),
    );
  }
}
