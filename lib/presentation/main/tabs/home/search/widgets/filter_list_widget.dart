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
        log('${state.searchProductDTO.filter_data?.toJson().entries.toList().asMap()}');
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: getSize(14)),
          child: Row(
            children: List.generate(
              state.searchProductDTO.filter_data
                      ?.toJson()
                      .entries
                      .toList()
                      .where((element) => (element.value as List).isNotEmpty)
                      .length ??
                  0,
              (index) => FilterCommonContainer(
                filterTitle: state.searchProductDTO.filter_data
                        ?.toJson()
                        .entries
                        .where((element) => (element.value as List).isNotEmpty)
                        .toList()[index]
                        .key ??
                    "",
                list: state.searchProductDTO.filter_data
                    ?.toJson()
                    .entries
                    .where((element) => (element.value as List).isNotEmpty)
                    .toList()[index]
                    .value,
              ),
            ),
          ),
        );
      },
    );
  }
}
