import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/home_carousal.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/recommanded_product_widget.dart';

@RoutePage(name: 'HomeView')
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppFocus.unfocus(context);
          },
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              HomeDiscountCarousalWidget(),
              SizedBox(
                height: getSize(6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: context
                    .read<HomeBloc>()
                    .imgList
                    .asMap()
                    .entries
                    .map((entry) {
                  return Container(
                    width: getSize(state.carousalIndex == entry.key ? 18 : 5),
                    height: getSize(5),
                    margin: EdgeInsets.symmetric(
                      horizontal: getSize(5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: state.carousalIndex == entry.key
                          ? BorderRadius.circular(getSize(30))
                          : null,
                      shape: state.carousalIndex == entry.key
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      color: state.carousalIndex == entry.key
                          ? Color(0xFF464646)
                          : AppColors.grey,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: getSize(25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: Row(
                  children: [
                    BaseText(
                      text: AppLocalizations.of(context).recommendedForYou,
                      textColor: AppColors.authBlack,
                    ),
                    Spacer(),
                    BaseText(
                      text: AppLocalizations.of(context).seeMore,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: getSize(18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getSize(18),
              ),
              RecommandedProductWidget(),
            ],
          ),
        );
      },
    );
  }
}
