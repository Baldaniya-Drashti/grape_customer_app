import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/home_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/search/widgets/common_filter_dropdown.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        log('message : ${state.selectedFilterList}');
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: getSize(14)),
          child: Row(
            children: List.generate(
              state.filterList.length,
              (index) => FilterCommonContainer(
                filterTitle: state.filterList[index].key,
                list: state.filterList[index].value,
                showDownArrow: state.filterList[index].key != 'free_shipping',
              ),
            ),
          ),
        );
      },
    );
  }
}
