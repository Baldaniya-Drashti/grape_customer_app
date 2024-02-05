import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import "package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart";

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: true,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          title: Row(
            children: [
              SvgPicture.asset(
                SvgImageConstant.location,
              ),
              SizedBox(
                width: getSize(8),
              ),
              Expanded(
                child: BaseText(
                  text: state.currentLocation,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: preferredSize,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(18), vertical: getSize(10)),
              child: CustomTextField(
                hintText: AppLocalizations.of(context).searchProduct,
                textInputAction: TextInputAction.search,
                readOnly: true,
                onTap: () {
                  context.router.push(PageRouteInfo(SearchView.name));
                },
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: getSize(18)),
                  child: SvgPicture.asset(SvgImageConstant.search),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getSize(100));
}
