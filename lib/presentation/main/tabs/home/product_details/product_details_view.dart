import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:grape_customer_app/presentation/main/tabs/home/product_details/widget/select_model_widget.dart';
import 'package:intl/intl.dart';

@RoutePage(name: 'ProductDetailsView')
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Details',
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              SvgImageConstant.share,
            ),
          ),
          SizedBox(
            width: getSize(8),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              SvgImageConstant.more,
            ),
          ),
          SizedBox(
            width: getSize(8),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: getSize(18)),
          physics: BouncingScrollPhysics(),
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
              height: getSize(216),
              placeholder: (context, url) => Container(
                height: getSize(216),
                color: Colors.grey.shade300,
              ),
            ),
            SizedBox(
              height: getSize(50),
              child: SelectModelWidget(),
            ),
            Row(
              children: [
                BaseText(
                  text: 'Nothing Phone 1',
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  width: getSize(4),
                ),
                Container(
                  height: getSize(16),
                  width: getSize(36),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF094),
                    borderRadius: BorderRadius.circular(
                      getSize(4),
                    ),
                  ),
                  child: BaseText(
                    text: '-20%',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xFFFF770E),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(14),
                    vertical: getSize(4),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF666666),
                    borderRadius: BorderRadius.circular(getSize(6)),
                  ),
                  child: BaseText(
                    text: 'Out of Stock',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CommonRatingBar(
                  onRatingUpdate: (p0) {},
                  iconnSize: getSize(12),
                  initialRating: 4.5,
                  horizontalPadding: getSize(4),
                  absorbing: true,
                ),
                SizedBox(
                  width: getSize(4),
                ),
                BaseText(
                  text: '200 Sold',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
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
            ),
            Row(
              children: [
                SvgPicture.asset(
                  SvgImageConstant.location,
                  height: getSize(14),
                  width: getSize(14),
                  colorFilter: ColorFilter.mode(
                    AppColors.black.withOpacity(0.7),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  width: getSize(2),
                ),
                BaseText(
                  text: 'Hyderabad',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.black.withOpacity(0.7),
                ),
              ],
            ),
            SizedBox(
              height: getSize(20),
            ),
            getProductDetails(title: 'Brand', description: 'Nothing'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(title: 'Model Name', description: 'A063'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(title: 'Wireless Carrier', description: 'MVNO'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(
                title: 'Operating System', description: 'Android 12.0'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(title: 'Cellular Technology', description: '5G'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(
                title: 'Storage Capacity', description: '128GB/ 256GB'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(
                title: 'Connectivity Technology', description: 'Wi-Fi'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(title: 'Screen Size', description: '3.1 Inches'),
            SizedBox(
              height: getSize(6),
            ),
            getProductDetails(
                title: 'Wireless network technology', description: ' GSM'),
            SizedBox(
              height: getSize(20),
            ),
            BaseText(
              text: 'Product Specification:',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.black.withOpacity(0.8),
            ),
            SizedBox(
              height: getSize(10),
            ),
            BaseText(
              text:
                  'Glyph Interface Meet the Glyph Interface. A new way to communicate. Unique light patterns indicate whos calling. Signals app notifications, charging status and more. Everyday interactions, made joyful. Design Design that goes beyond the surface. Dual-side Gorilla? Glass gives toughness. Advanced vibration motors make touch responses life-like. The symmetrical bezels and aluminium frame adds elegance, lightness and durabilit 50MP Dual camera Time to unlearn. Better quality isnt more cameras. This extraordinary dual camera has two advanced 50 MP sensors. For brilliant realism. Shoots exceptionally stable videos. Has studio lighting built-in. And Night Mode to take images to the next level. Display 1 billion colours. Every hue, powerfully true-to-life. 6.55? OLED display. HDR10+. Richer colour and deeper contrasts, tuned to each scene. Adaptive 120Hz refresh rate for irresistibly responsive interactions, while being reassuringly power-efficient.',
              fontSize: 12,
              showFullDescription: true,
              textColor: AppColors.black.withOpacity(0.6),
            ),
            SizedBox(
              height: getSize(20),
            ),
            Row(
              children: [
                BaseText(
                  text: 'Review Product',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                BaseText(
                  text: 'See More',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: getSize(18),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(getSize(12)),
                margin: EdgeInsets.symmetric(vertical: getSize(5)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getSize(10)),
                  border: Border.all(
                    color: AppColors.black.withOpacity(0.2),
                    width: getSize(1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: getSize(20),
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS56ldGyKRHaDGinQ1tg9qMxKiw5-ZW_CyCXZ6p3R0Yg0bZNbd9KErKJhyywksv4DDhQcU&usqp=CAU',
                          ),
                        ),
                        SizedBox(width: getSize(8)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: 'James Lawson',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: getSize(3),
                            ),
                            BaseText(
                              text: DateFormat('dd MMM , yyyy').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      DateTime.now().millisecondsSinceEpoch)),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            )
                          ],
                        ),
                        Spacer(),
                        CommonRatingBar(
                          horizontalPadding: getSize(1.2),
                          iconnSize: getSize(12),
                          initialRating: 4.0,
                          absorbing: true,
                          onRatingUpdate: (value) {},
                        ),
                      ],
                    ),
                    SizedBox(height: getSize(12)),
                    BaseText(
                      text:
                          'Nothing 1 are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
                      textColor: AppColors.black.withOpacity(0.6),
                      fontSize: 12,
                      lineHeight: 1.5,
                      showFullDescription: true,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getProductDetails({required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(12),
          color: AppColors.black.withOpacity(0.80),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: description,
            style: TextStyle(
              color: AppColors.black.withOpacity(0.60),
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }
}
