import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/filter_bottom_sheet.dart';

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
              padding: EdgeInsets.symmetric(horizontal: getSize(18)),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: AppLocalizations.of(context).searchProduct,
                      textInputAction: TextInputAction.search,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: getSize(18)),
                        child: SvgPicture.asset(SvgImageConstant.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(8),
                  ),
                  GestureDetector(
                    onTap: () {
                      FilterBottomSheet().getFilterBottomSheet(context);
                    },
                    child: Container(
                      height: getSize(43),
                      width: getSize(43),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(
                          getSize(10),
                        ),
                      ),
                      child: SvgPicture.asset(SvgImageConstant.filter),
                    ),
                  ),
                ],
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
