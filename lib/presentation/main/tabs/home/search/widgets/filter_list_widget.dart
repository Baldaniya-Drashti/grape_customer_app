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
        var filterList = state.searchProductDTO.filter_data
            ?.toJson()
            .entries
            .toList()
            .where((element) => (element.value as List).isNotEmpty)
            .toList();
        filterList?.addAll(
          [
            MapEntry('free_shipping', ['']),
            // MapEntry('min_price', [state.searchProductDTO.]),
            // MapEntry('max_price', ['']),
          ],
        );
        //   log('${state.searchProductDTO.filter_data?.toJson().entries.toList().asMap()}');
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: getSize(14)),
          child: Row(
            children: List.generate(
              filterList?.length ?? 0,
              (index) => FilterCommonContainer(
                filterTitle: filterList?[index].key ?? "",
                list: filterList?[index].value,
                showDownArrow: filterList?[index].key != 'free_shipping',
              ),
            ),
          ),
        );
      },
    );
  }
}
