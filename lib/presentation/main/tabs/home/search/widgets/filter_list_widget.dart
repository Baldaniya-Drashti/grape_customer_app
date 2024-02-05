import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/search/widgets/common_filter_dropdown.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: getSize(18)),
      child: Row(
        children: [
          FilterCommonContainer(
            filterTitle: 'Model',
          ),
          SizedBox(
            width: getSize(8),
          ),
          FilterCommonContainer(
            filterTitle: 'Color',
          ),
          SizedBox(
            width: getSize(8),
          ),
          FilterCommonContainer(
            filterTitle: 'Size',
          ),
          SizedBox(
            width: getSize(8),
          ),
          FilterCommonContainer(
            filterTitle: 'Price',
          ),
          SizedBox(
            width: getSize(8),
          ),
          FilterCommonContainer(
            filterTitle: 'Free Shipping',
            showDownArrow: false,
          ),
          SizedBox(
            width: getSize(8),
          ),
          FilterCommonContainer(
            filterTitle: 'Cash on delivery',
            showDownArrow: false,
          ),
        ],
      ),
    );
  }
}
