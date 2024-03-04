import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/search/widgets/filter_list_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/home_carousal.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/recommanded_product_widget.dart';

@RoutePage(name: 'SearchView')
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: CustomTextField(
          hintText: AppLocalizations.of(context).searchProduct,
          textInputAction: TextInputAction.search,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: getSize(18)),
            child: SvgPicture.asset(SvgImageConstant.search),
          ),
        ),
        title: '',
        leadingWidth: getSize(25),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            AppFocus.unfocus(context);
          },
          child: BlocProvider(
            create: (context) => getIt<HomeBloc>(),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    HomeDiscountCarousalWidget(),
                    SizedBox(
                      height: getSize(6),
                    ),
                    getCarousalWidget(context, state),
                    SizedBox(
                      height: getSize(25),
                    ),
                    FilterListWidget(),
                    SizedBox(
                      height: getSize(18),
                    ),
                    RecommandedProductWidget(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Row getCarousalWidget(BuildContext context, HomeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: context.read<HomeBloc>().imgList.asMap().entries.map((entry) {
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
    );
  }
}
