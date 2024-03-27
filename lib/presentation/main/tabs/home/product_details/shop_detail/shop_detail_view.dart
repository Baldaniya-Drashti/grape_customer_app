import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/shop_detail/widgets/vender_detail_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/shop_detail/widgets/vender_product.dart';

import 'widgets/common_filter_dropdown.dart';

@RoutePage(name: 'ShopDetailView')
class ShopDetailView extends StatelessWidget {
  final String shopId;
  const ShopDetailView({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shop Profile'),
      body: BlocProvider(
        create: (context) => getIt<ProductDetailBloc>()
          ..add(ProductDetailEvent.getShopDetailAPI(shopId, true)),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            return PaginatedListView(
              onRefresh: () {
                context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getShopDetailAPI(
                        shopId,
                        true,
                      ),
                    );
              },
              onLoading: () {
                context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getShopDetailAPI(
                        shopId,
                        false,
                      ),
                    );
              },
              refreshController: context
                  .read<ProductDetailBloc>()
                  .productYouMayLikeRefreshController,
              child: state.isShopDetailLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryOrange,
                      ),
                    )
                  : state.isErrorInAPI
                      ? Center(
                          child: BaseText(
                              text: 'Somethong went wrong. Please try again!!'),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            VenderDetailWidget(),
                            SizedBox(
                              height: getSize(10),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  EdgeInsets.symmetric(horizontal: getSize(14)),
                              child: Row(
                                children: List.generate(
                                  state.filterList.length,
                                  (index) => VenderFilterCommonContainer(
                                    filterTitle: state.filterList[index].key,
                                    list: state.filterList[index].value,
                                    showDownArrow:
                                        state.filterList[index].key ==
                                            'Categories',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getSize(16),
                            ),
                            VenderProductGrid(),
                          ],
                        ),
            );
          },
        ),
      ),
    );
  }
}
