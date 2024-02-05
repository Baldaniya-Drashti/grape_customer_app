import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class FilterBottomSheet extends StatelessWidget {
  final String filterTitle;
  const FilterBottomSheet({super.key, required this.filterTitle});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  getFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(20)),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: getSize(20),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: BaseText(
                            textAlign: TextAlign.center,
                            text: filterTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router.pop();
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close_rounded),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getSize(20),
                ),
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  height: 0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    padding: EdgeInsets.symmetric(vertical: getSize(20)),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: getSize(15)),
                        child: Row(
                          children: [
                            SvgPicture.asset(SvgImageConstant.emptyCheckbox),
                            SizedBox(
                              width: getSize(6),
                            ),
                            BaseText(
                              text: 'iPhone 11 Pro',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getSize(12),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        width: getSize(160),
                        onPressed: () {
                          context.router.pop(false);
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
                          context.router.pop(true);
                          // controller.getLogout();
                        },
                        buttonText: 'Apply',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
