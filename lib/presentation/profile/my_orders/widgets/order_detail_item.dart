import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(20),
        vertical: getSize(17),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.10),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                width: getSize(99),
                // height: getSize(53),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 10,
                          child: BaseText(
                            text: 'SONY B26 Full HD',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                          ),
                        ),
                        Spacer(),
                        BaseText(
                          text: '\$175',
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.mildBlue,
                          fontSize: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: getSize(10),
                    ),
                    detailRow(
                      iconWidget: SvgPicture.asset(SvgImageConstant.calender),
                      title: 'Order on 23 Oct 2023',
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    detailRow(
                      iconWidget: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: AppColors.black, shape: BoxShape.circle),
                      ),
                      title: 'Color',
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    detailRow(
                      iconWidget: SvgPicture.asset(SvgImageConstant.sizeIcon),
                      title: '42',
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Row(
                      children: [
                        detailRow(
                          iconWidget: Row(
                            children: [
                              BaseText(
                                text: ' 1',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ],
                          ),
                          title: 'Oty',
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(getSize(4)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFD0A200).withOpacity(0.08),
                          ),
                          child: BaseText(
                            text: 'Out of Delivery',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            textColor: Color(0XFFD0A200),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getSize(14),
          ),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgImageConstant.message,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryOrange,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: getSize(10),
              ),
              BaseText(
                text: AppLocalizations.of(context).contactVendor,
                textColor: AppColors.primaryOrange,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget detailRow({required Widget iconWidget, required String title}) {
    return Row(
      children: [
        iconWidget,
        SizedBox(
          width: getSize(5),
        ),
        BaseText(
          text: title,
          fontSize: 8,
          fontWeight: FontWeight.w500,
          textColor: AppColors.black.withOpacity(0.7),
        )
      ],
    );
  }
}
