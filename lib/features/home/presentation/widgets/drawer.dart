import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rokus/core/utils/app_colors.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/home/presentation/widgets/role_selector_dialog.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.horizontal(right: Radius.circular(Dimens.gBorder)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimens.sMargin),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: Dimens.sMargin),
              Container(
                height: 40,
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
                    showDialog(
                        context: context,
                        builder: (context) => RoleSelectorDialog(
                              authController: authController,
                            ));
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
              const SizedBox(height: Dimens.hMargin),
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
        ),
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
