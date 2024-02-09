import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(getSize(18)),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return getCheckoutContainer();
            },
          ),
        ),
        SizedBox(
          height: getSize(8),
        ),
        getSubTotal(title: 'Subtotal', description: '\$548'),
        SizedBox(
          height: getSize(14),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(18)),
          child: CommonButton(
            onPressed: () {
              context.router.push(
                PageRouteInfo(CheckoutView.name,
                    args: CheckoutViewArgs(isFromCart: true)),
              );
            },
            buttonText: 'Checkout',
          ),
        ),
        SizedBox(
          height: getSize(8),
        ),
      ],
    );
  }

  getCheckoutContainer() {
    return Container(
      padding: EdgeInsets.all(getSize(10)),
      margin: EdgeInsets.symmetric(vertical: getSize(9)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(getSize(10)),
        border: Border.all(
          color: AppColors.primaryOrange.withOpacity(0.20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                height: getSize(90),
                width: getSize(90),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(getSize(10)),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                  placeholder: (context, url) => Container(
                    height: getSize(80),
                    width: getSize(60),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: SmoothBorderRadius.all(
                        SmoothRadius(
                          cornerRadius: getSize(4),
                          cornerSmoothing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getSize(8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: 'Nothing Phone 1',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  getProductDetails(
                    title: 'Colors',
                    description: 'Black',
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  getProductDetails(
                    title: 'Size',
                    description: '128 GB',
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  getProductDetails(
                    title: 'Quantity',
                    description: '1',
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: BaseText(
                text: '\$299',
                fontSize: 18,
                textColor: AppColors.mildBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned.fill(
            top: getSize(-10),
            right: getSize(-10),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_rounded,
                  color: AppColors.black.withOpacity(0.60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText getSubTotal({required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: AppColors.black.withOpacity(0.6),
          fontFamily: 'SfPro',
          fontSize: getFontSize(14),
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: getFontSize(18),
              color: AppColors.black,
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }

  RichText getProductDetails(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(10),
          color: AppColors.black.withOpacity(0.80),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
              color: AppColors.black,
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: description,
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }
}
