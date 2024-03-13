import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/png_image_constants.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/buy_now_dialog.dart';

class BuyNowButtonWidget extends StatelessWidget {
  const BuyNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                if (state.getProductDetails.product?.is_cart == true) {
                  // context.read<ProductDetailBloc>().add(
                  //       ProductDetailEvent.removeProductFromCart(),
                  //     );
                } else {
                  context.read<ProductDetailBloc>().add(
                        ProductDetailEvent.addProductToCart(),
                      );
                }
              },
              child: Container(
                height: getSize(42),
                width: getSize(42),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getSize(10)),
                  border: Border.all(color: AppColors.primaryOrange),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      PngImageConstants.cartSelected,
                      height: getSize(18),
                      width: getSize(18),
                      color: state.getProductDetails.product?.is_cart == true
                          ? AppColors.primaryOrange
                          : AppColors.black,
                    ),
                    Visibility(
                      visible: state.getProductDetails.product?.is_cart == true,
                      child: Positioned.fill(
                        top: getSize(3),
                        left: getSize(-3),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            SvgImageConstant.successImage,
                            height: getSize(9),
                            width: getSize(9),
                            colorFilter: ColorFilter.mode(
                                AppColors.green, BlendMode.srcATop),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: getSize(10),
            ),
            Expanded(
              child: CommonButton(
                onPressed: () {
                  BuyNowDialog().buyNowDialog(
                    context,
                    state.getProductDetails.product!,
                    state.dataList,
                  );
                },
                height: 42,
                buttonText: 'Buy Now',
              ),
            ),
          ],
        );
      },
    );
  }
}
