import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  logoutDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: getSize(20)),
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getSize(10)),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: getSize(20)),
              BaseText(
                text: 'Logout',
                fontWeight: FontWeight.w600,
                textColor: AppColors.black,
              ),
              SizedBox(height: getSize(30)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: BaseText(
                  text: 'Are you sure want to logout?',
                  textColor: AppColors.black.withOpacity(0.60),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getSize(30)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        width: getSize(160),
                        onPressed: () {
                          context.router.maybePop(false);
                          //   Get.back();
                        },
                        borderColor: AppColors.primaryOrange,
                        buttonTextColor: AppColors.primaryOrange,
                        backgroundColor: AppColors.white,
                        buttonText: 'Cancel',
                      ),
                    ),
                    SizedBox(width: getSize(19)),
                    Expanded(
                      child: CommonButton(
                        width: getSize(160),
                        onPressed: () {
                          // context
                          //     .read<AuthStatusBloc>()
                          //     .add(AuthStatusEvent.signedOut());
                          context.router.maybePop(true);
                          // controller.getLogout();
                        },
                        buttonText: 'Logout',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getSize(20)),
            ],
          ),
        );
      },
    );
  }
}
