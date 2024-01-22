import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart';
import 'package:grape_customer_app/domain/account/account.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadFailure: (failure) => Center(
            child: BaseText(text: 'Something went wrong!!'),
          ),
          loadSuccess: (account) => Container(
            padding: EdgeInsets.all(getSize(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryOrange,
            ),
            child: Row(
              children: [
                Container(
                  height: getSize(53),
                  width: getSize(53),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: account.profile == null
                        ? Color(0xFFAEFFFF)
                        : AppColors.white,
                    shape: BoxShape.rectangle,
                    image: account.profile != null
                        ? DecorationImage(
                            image: CachedNetworkImageProvider(
                                account.profile ?? ""),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: account.profile == null
                      ? BaseText(
                          text: getInitials(account),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.authBlack,
                        )
                      : null,
                ),
                SizedBox(
                  width: getSize(12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: 'Hello! ${account.firstName} ${account.lastName}',
                        textColor: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: getSize(6),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(SvgImageConstant.email),
                          SizedBox(
                            width: getSize(4),
                          ),
                          BaseText(
                            text: account.email ?? "",
                            textColor: AppColors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getSize(4),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(SvgImageConstant.call),
                          SizedBox(
                            width: getSize(4),
                          ),
                          BaseText(
                            text: '${account.countryCode} ${account.phone}',
                            textColor: AppColors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          orElse: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  String getInitials(Account account) =>
      '${account.firstName!} ${account.lastName!}'
          .trim()
          .split(' ')
          .map((l) => l[0])
          .take(2)
          .join()
          .toUpperCase();
}
