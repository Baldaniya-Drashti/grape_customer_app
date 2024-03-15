import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/filter_bottom_sheet.dart';

class FilterCommonContainer extends StatelessWidget {
  final String filterTitle;
  final bool showDownArrow;
  final List<String> list;

  const FilterCommonContainer({
    Key? key,
    required this.filterTitle,
    this.showDownArrow = true,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // var list = getListBaseOnTitle(state, filterTitle);
        log('brandFilter : ${state.brandFilter.map((e) => e).toList()}');
        log('innerSubCategoryFilter : ${state.innerSubCategoryFilter.map((e) => e).toList()}');
        log('subCategoryFilter : ${state.subCategoryFilter.map((e) => e).toList()}');
        log('colorFilter : ${state.colorFilter.map((e) => e).toList()}');
        log('sizeFilter : ${state.sizeFilter.map((e) => e).toList()}');

        return InkWell(
          borderRadius: BorderRadius.circular(getSize(4)),
          onTap: !showDownArrow
              ? null
              : () async {
                  List<String>? filterList = await FilterBottomSheet(
                    filterTitle: filterTitle,
                    list: list,
                    selectedList: [],
                  ).getFilterBottomSheet(context);

                  if (filterList != null) {
                    getAddEventBaseOnTitle(
                        state, filterTitle, context, filterList);
                  }
                },
          child: Container(
            padding: EdgeInsets.all(getSize(6)),
            margin: EdgeInsets.symmetric(horizontal: getSize(4)),
            decoration: BoxDecoration(
              color: state.filterList
                      .where((element) => element.keys.contains(filterTitle))
                      .isNotEmpty
                  ? AppColors.primaryOrange
                  : AppColors.white,
              border: Border.all(color: AppColors.black.withOpacity(0.20)),
              borderRadius: BorderRadius.circular(getSize(4)),
            ),
            child: Row(
              children: [
                BaseText(
                  text: filterTitle,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.black.withOpacity(0.6),
                ),
                SizedBox(
                  width: getSize(showDownArrow ? 2 : 0),
                ),
                Visibility(
                  visible: showDownArrow,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: getSize(16),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getAddEventBaseOnTitle(HomeState homeState, String filterTitle,
      BuildContext context, List<String> filterList) async {
    switch (filterTitle) {
      case 'sub_category':
        return context
            .read<HomeBloc>()
            .add(HomeEvent.addSubCategoryFilterInList(filterList));

      //  return homeState.subCategoryFilter;
      case 'inner_sub_category':
        return context
            .read<HomeBloc>()
            .add(HomeEvent.addInnerSubCategoryFilterInList(filterList));

      case 'color':
        return context
            .read<HomeBloc>()
            .add(HomeEvent.addColorFilterInList(filterList));
      case 'size':
        return context
            .read<HomeBloc>()
            .add(HomeEvent.addSizeFilterInList(filterList));

      case 'brand_name':
        return context
            .read<HomeBloc>()
            .add(HomeEvent.addBrandFilterInList(filterList));

      default:
    }
  }

  getListBaseOnTitle(
    HomeState homeState,
    String filterTitle,
  ) async {
    switch (filterTitle) {
      case 'sub_category':
        return homeState.subCategoryFilter;
      case 'inner_sub_category':
        return homeState.innerSubCategoryFilter;

      case 'color':
        return homeState.colorFilter;
      case 'size':
        return homeState.sizeFilter;
      case 'brand_name':
        return homeState.brandFilter;
      default:
        return [];
    }
  }
}
