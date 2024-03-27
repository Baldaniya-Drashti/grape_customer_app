import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/filter_bottom_sheet.dart';

class VenderFilterCommonContainer extends StatelessWidget {
  final String filterTitle;
  final bool showDownArrow;
  final List<String> list;
  const VenderFilterCommonContainer({
    Key? key,
    required this.filterTitle,
    this.showDownArrow = true,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        var selectedList = state.selectedFilterList
            .where((element) => element.key.contains(filterTitle))
            .map((e) => e.value as List<String>)
            .toList();
        //  return Container();
        return InkWell(
          borderRadius: BorderRadius.circular(getSize(4)),
          onTap: !showDownArrow
              ? () {
                  context.read<ProductDetailBloc>().add(
                        ProductDetailEvent.addFilterInList(
                          MapEntry(filterTitle, ['1']),
                        ),
                      );
                }
              : () async {
                  MapEntry<String, dynamic>? filterList =
                      await FilterBottomSheet(
                    filterTitle: filterTitle,
                    list: list,
                    //selectedList: [],
                    selectedList:
                        selectedList.isNotEmpty ? selectedList[0] : [],
                  ).getFilterBottomSheet(context);

                  if (filterList != null) {
                    context
                        .read<ProductDetailBloc>()
                        .add(ProductDetailEvent.addFilterInList(filterList));
                  }
                },
          child: Container(
            padding: EdgeInsets.all(getSize(6)),
            margin: EdgeInsets.symmetric(horizontal: getSize(4)),
            decoration: BoxDecoration(
              color: selectedList.isNotEmpty
                  ? selectedList[0].isNotEmpty
                      ? AppColors.primaryOrange
                      : AppColors.white
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
                  textColor: selectedList.isNotEmpty
                      ? selectedList[0].isNotEmpty
                          ? AppColors.white
                          : AppColors.black.withOpacity(0.6)
                      : AppColors.black.withOpacity(0.6),
                ),
                SizedBox(
                  width: getSize(showDownArrow ? 2 : 0),
                ),
                Visibility(
                  visible: showDownArrow,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: getSize(16),
                    color: selectedList.isNotEmpty
                        ? selectedList[0].isNotEmpty
                            ? AppColors.white
                            : AppColors.black.withOpacity(0.6)
                        : AppColors.black.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
