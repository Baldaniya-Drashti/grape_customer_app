import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class BuyNowDialog extends StatelessWidget {
  const BuyNowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  buyNowDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      useSafeArea: true,
      scrollControlDisabledMaxHeightRatio: 0.68,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => ProductDetailBloc(),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getSize(20),
                  ),
                  productDetailsView(context),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: BaseText(
                      text: 'Colors:',
                      textColor: AppColors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  colorSelectionList(),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: BaseText(
                      text: 'Size:',
                      textColor: AppColors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  sizeSelectionListWidget(),
                  SizedBox(
                    height: getSize(16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: getSize(16),
                  ),
                  quantityContainerWidget(context, state),
                  SizedBox(
                    height: getSize(30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                    child: CommonButton(
                      onPressed: () {
                        context.router.pop();
                        context.router.push(PageRouteInfo(CheckoutView.name));
                      },
                      buttonText: 'Buy Now',
                    ),
                  ),
                  SizedBox(
                    height: getSize(isFullScreenDevice(context) ? 0 : 30),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  quantityContainerWidget(BuildContext context, ProductDetailState state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getSize(18)),
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9).withOpacity(0.20),
        borderRadius: BorderRadius.circular(getSize(10)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getSize(20),
        vertical: getSize(4),
      ),
      child: Row(
        children: [
          BaseText(
            text: 'Quantity',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              context
                  .read<ProductDetailBloc>()
                  .add(ProductDetailEvent.decreaseProductQuantity());
            },
            icon: Container(
              height: getSize(20),
              width: getSize(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(getSize(6)),
                border: Border.all(
                  color: AppColors.black.withOpacity(0.20),
                ),
              ),
              child: Icon(
                Icons.remove,
                size: getSize(12),
              ),
            ),
          ),
          Container(
            height: getSize(27),
            width: getSize(27),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              shape: BoxShape.circle,
            ),
            child: BaseText(
              text: '${state.productQuantity}',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: AppColors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<ProductDetailBloc>()
                  .add(ProductDetailEvent.increaseProductQuantity());
            },
            icon: Container(
              height: getSize(20),
              width: getSize(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(getSize(6)),
                border: Border.all(
                  color: AppColors.black.withOpacity(0.20),
                ),
              ),
              child: Icon(
                Icons.add,
                size: getSize(12),
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox sizeSelectionListWidget() {
    return SizedBox(
      height: getSize(45),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: getSize(18)),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(
            left: index != 0 ? getSize(7) : 0,
            right: index == 9 ? 0 : getSize(7),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: getSize(14),
            vertical: getSize(12),
          ),
          decoration: BoxDecoration(
            color: index == 0
                ? AppColors.primaryOrange.withOpacity(0.20)
                : AppColors.white,
            borderRadius: BorderRadius.circular(getSize(6)),
            border: Border.all(
              color: index == 0
                  ? AppColors.primaryOrange
                  : AppColors.black.withOpacity(0.20),
            ),
          ),
          child: BaseText(
            text: '128 GB',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Flexible colorSelectionList() {
    return Flexible(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: getSize(18)),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: getSize(60),
              width: getSize(60),
              margin: EdgeInsets.only(
                left: index != 0 ? getSize(7) : 0,
                right: index == 9 ? 0 : getSize(7),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: index == 0
                    ? AppColors.primaryOrange.withOpacity(0.20)
                    : AppColors.white,
                borderRadius: BorderRadius.circular(getSize(6)),
                border: Border.all(
                  color: index == 0
                      ? AppColors.primaryOrange
                      : AppColors.black.withOpacity(0.20),
                ),
              ),
              child: Container(
                height: getSize(38),
                width: getSize(38),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.10),
                      offset: Offset(0, 0),
                      blurRadius: 14,
                    ),
                  ],
                  color: index == 0 ? AppColors.black : AppColors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: getSize(6),
            ),
            BaseText(
              text: 'Black',
              fontSize: 10,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }

  productDetailsView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(18)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Container(
                    height: getSize(60),
                    width: getSize(60),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryOrange.withOpacity(0.20),
                      ),
                      borderRadius: BorderRadius.circular(getSize(6)),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: 'Nothing Phone 1',
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.black.withOpacity(0.80),
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Row(
                        children: [
                          BaseText(
                            text: '\$350',
                            textDecoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: getSize(6),
                          ),
                          BaseText(
                            text: '\$350',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            textColor: Color(0xFF527FF2),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                top: getSize(-10),
                right: getSize(-10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
