
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/helper/dynamic_link_helper.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/buy_now_button_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/pop_up_menu_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_configuration_widget.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_main_info.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/product_review_list.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/select_model_widget.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage(name: 'ProductDetailsView')
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Product Details',
          actions: [
            GestureDetector(
              onTap: () async {
                var shortlink = await DynamicLinksService.createDynamicLink(
                  imageURL:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                  title: 'Nothing Phone 1',
                  description:
                      'Glyph Interface Meet the Glyph Interface. A new way to communicate. Unique light patterns indicate whos calling. Signals app notifications, charging status and more. Everyday interactions, made joyful. Design Design that goes beyond the surface. Dual-side Gorilla? Glass gives toughness. Advanced vibration motors make touch responses life-like. The symmetrical bezels and aluminium frame adds elegance, lightness and durabilit 50MP Dual camera Time to unlearn. Better quality isnt more cameras. This extraordinary dual camera has two advanced 50 MP sensors. For brilliant realism. Shoots exceptionally stable videos. Has studio lighting built-in. And Night Mode to take images to the next level. Display 1 billion colours. Every hue, powerfully true-to-life. 6.55? OLED display. HDR10+. Richer colour and deeper contrasts, tuned to each scene. Adaptive 120Hz refresh rate for irresistibly responsive interactions, while being reassuringly power-efficient.',
                );

                if (shortlink.isNotEmpty) {
                  await Share.share(shortlink);
                }
              },
              child: SvgPicture.asset(
                SvgImageConstant.share,
              ),
            ),
            SizedBox(
              width: getSize(8),
            ),
            PopMenuWidget(),
            SizedBox(
              width: getSize(8),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                  height: getSize(216),
                  placeholder: (context, url) => Container(
                    height: getSize(216),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(
                height: getSize(10),
              ),
              SizedBox(
                height: getSize(50),
                child: SelectModelWidget(),
              ),
              SizedBox(
                height: getSize(20),
              ),
              ProductMainInfo(),
              SizedBox(
                height: getSize(20),
              ),
              ProductConfigurationWidget(),
              SizedBox(
                height: getSize(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: BaseText(
                  text: 'Product Specification:',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: getSize(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: BaseText(
                  text:
                      'Glyph Interface Meet the Glyph Interface. A new way to communicate. Unique light patterns indicate whos calling. Signals app notifications, charging status and more. Everyday interactions, made joyful. Design Design that goes beyond the surface. Dual-side Gorilla? Glass gives toughness. Advanced vibration motors make touch responses life-like. The symmetrical bezels and aluminium frame adds elegance, lightness and durabilit 50MP Dual camera Time to unlearn. Better quality isnt more cameras. This extraordinary dual camera has two advanced 50 MP sensors. For brilliant realism. Shoots exceptionally stable videos. Has studio lighting built-in. And Night Mode to take images to the next level. Display 1 billion colours. Every hue, powerfully true-to-life. 6.55? OLED display. HDR10+. Richer colour and deeper contrasts, tuned to each scene. Adaptive 120Hz refresh rate for irresistibly responsive interactions, while being reassuringly power-efficient.',
                  fontSize: 12,
                  showFullDescription: true,
                  textColor: AppColors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(
                height: getSize(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(18)),
                child: Row(
                  children: [
                    BaseText(
                      text: 'Review Product',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.router.push(
                          PageRouteInfo(ReviewProductList.name),
                        );
                      },
                      child: BaseText(
                        text: 'See More',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: getSize(18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getSize(5),
              ),
              ProductReviewListWidget()
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: getSize(12),
              right: getSize(18),
              top: getSize(8),
              bottom: isFullScreenDevice(context) ? 0 : getSize(18),
            ),
            child: BuyNowButtonWidget(),
            //
            //
            // OutOfStockBottomWidget(),
          ),
        ),
      ),
    );
  }
}
