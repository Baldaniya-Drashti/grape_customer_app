import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/widgets/filter_bottom_sheet.dart';

class FilterCommonContainer extends StatelessWidget {
  final String filterTitle;
  final bool showDownArrow;
  const FilterCommonContainer({
    super.key,
    required this.filterTitle,
    this.showDownArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(getSize(4)),
      onTap: () {
        FilterBottomSheet(
          filterTitle: filterTitle,
        ).getFilterBottomSheet(context);
      },
      child: Container(
        padding: EdgeInsets.all(getSize(6)),
        decoration: BoxDecoration(
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
  }
}
