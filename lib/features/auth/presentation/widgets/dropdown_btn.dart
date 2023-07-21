import 'package:flutter/material.dart';
import 'package:rokus/core/utils/app_colors.dart';
import 'package:rokus/core/utils/dimens.dart';
import 'package:rokus/core/utils/text_styles.dart';

class DropdownBtn extends StatelessWidget {
  final Function()? onTap;
  final String roleName;
  final double height;
  const DropdownBtn({
    super.key,
    this.onTap,
    this.roleName = "",
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.hMargin),
                child: Text(
                  roleName,
                  style: TextStyles.style17w400,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.darkGrey,
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
