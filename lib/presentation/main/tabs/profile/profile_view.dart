import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/auth/auth_status/auth_status_bloc.dart';
import 'package:grape_customer_app/application/main/profile/get_account/account_cubit.dart';
import 'package:grape_customer_app/domain/account/account.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/flushbar_creator.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/widget/logout_dialog.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/widget/user_profile_widget.dart';

@RoutePage(name: 'ProfileView')
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(20),
      ),
      child: Column(
        children: [
          UserProfileWidget(),
          SizedBox(
            height: getSize(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            child: Divider(
              thickness: 1,
              color: AppColors.black.withOpacity(0.1),
            ),
          ),
          selectionMenu(context),
          SizedBox(
            height: getSize(5),
          ),
          liveChatSupport(context),
          SizedBox(
            height: getSize(12),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context).developedby,
                ),
                TextSpan(
                  text: AppLocalizations.of(context).iRoidSolutions,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                )
              ],
              style: TextStyle(
                fontFamily: 'SfPro',
                fontSize: getFontSize(10),
                color: AppColors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: getSize(6),
          ),
        ],
      ),
    );
  }

  Widget selectionMenu(BuildContext context) {
    return Expanded(
      child: BlocListener<AuthStatusBloc, AuthStatusState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            authenticated: (_) async {
              await Future.delayed(
                Duration(seconds: 3),
                () => context.router
                    .replace(const PageRouteInfo(MainTabView.name)),
              );
            },
            unauthenticated: (r) async {
              showSuccess(message: r.successMessage).show(context).then(
                    (value) => context.router
                        .replaceAll([const PageRouteInfo(LoginPage.name)]),
                  );
            },
            introScreenVisibilty: (IntroScreenVisibilty value) async {
              await Future.delayed(
                Duration(seconds: 3),
                () => context.router
                    .replace(const PageRouteInfo(Onboarding.name)),
              );
            },
          );
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: getSize(20)),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            selectionListTile(
              iconUrl: SvgImageConstant.profile,
              title: AppLocalizations.of(context).editProfile,
              onTap: () async {
                var res = await context.router
                    .push(PageRouteInfo(EditProfileScreen.name));

                if (res != null) {
                  context.read<AccountCubit>().updateAccount(res as Account);
                }
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.order,
              title: AppLocalizations.of(context).myOrders,
              onTap: () {
                context.router.push(PageRouteInfo(MyOrders.name));
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.location,
              title: AppLocalizations.of(context).shippingAddresses,
              onTap: () async {
                await context.router
                    .push(PageRouteInfo(ShippingAddresses.name));
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.payment,
              title: AppLocalizations.of(context).paymentMethods,
              onTap: () async {
                await context.router.push(PageRouteInfo(PaymentMethod.name));
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.languages,
              title: AppLocalizations.of(context).languages,
              onTap: () {
                showError(message: 'Under Developemnt').show(context);
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.customerSupport,
              title: AppLocalizations.of(context).customerSupport,
              onTap: () async {
                await context.router.push(PageRouteInfo(CustomerSupport.name));
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.privacyPolicy,
              title: AppLocalizations.of(context).privacyPolicy,
              onTap: () {
                showError(message: 'Under Developemnt').show(context);
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.tc,
              title: AppLocalizations.of(context).termsConditions,
              onTap: () {
                showError(message: 'Under Developemnt').show(context);
              },
            ),
            selectionListTile(
              iconUrl: SvgImageConstant.logOut,
              title: AppLocalizations.of(context).logout,
              onTap: () async {
                var res = await LogOutDialog().logoutDialog(context);
                if (res != null && res == true) {
                  context
                      .read<AuthStatusBloc>()
                      .add(AuthStatusEvent.signedOut());
                }
              },
              isBackArrow: false,
            ),
            SizedBox(
              height: getSize(10),
            )
          ],
        ),
      ),
    );
  }

  Widget selectionListTile({
    required String iconUrl,
    required String title,
    required void Function() onTap,
    bool isBackArrow = true,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      leading: SvgPicture.asset(iconUrl),
      title: BaseText(
        text: title,
        textColor: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      trailing: isBackArrow
          ? SvgPicture.asset(SvgImageConstant.backArrow)
          : SizedBox(),
      onTap: onTap,
    );
  }

  Widget liveChatSupport(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getSize(20)),
      padding: EdgeInsets.symmetric(vertical: getSize(9)),
      decoration: BoxDecoration(
        color: Color(0xFFFFEEE1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primaryOrange.withOpacity(0.4),
          width: getSize(1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            PngImageConstants.liveChat,
            height: 30,
          ),
          SizedBox(
            width: getSize(8),
          ),
          BaseText(
            text: AppLocalizations.of(context).liveChatSupport,
            textColor: AppColors.primaryOrange,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          )
        ],
      ),
    );
  }
}
