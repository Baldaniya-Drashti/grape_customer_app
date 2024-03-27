import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class VenderDetailWidget extends StatelessWidget {
  const VenderDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(getSize(10)),
          margin: EdgeInsets.symmetric(horizontal: getSize(18)),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(
              getSize(10),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFAEFFFF),
                    radius: getSize(25),
                    backgroundImage: state.shopDetailDTO.vendor?.profile != null
                        ? CachedNetworkImageProvider(
                            state.shopDetailDTO.vendor?.profile ?? "")
                        : null,
                    child: state.shopDetailDTO.vendor?.profile == null
                        ? BaseText(
                            text: getInitials(
                                state.shopDetailDTO.vendor?.seller_name ??
                                    "Temp Name"),
                            fontSize: 24,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black,
                          )
                        : Container(),
                  ),
                  SizedBox(
                    width: getSize(6),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: state.shopDetailDTO.vendor?.seller_name ?? "",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: getSize(2),
                        ),
                        BaseText(
                          text: 'Active Now',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: AppColors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getSize(12),
              ),
              Row(
                children: [
                  commonContainer(
                    '${state.shopDetailDTO.vendor?.seller_total_product ?? "0"} Products',
                  ),
                  SizedBox(
                    width: getSize(18),
                  ),
                  commonContainer(
                    'Rating ${state.shopDetailDTO.vendor?.review ?? "0"}/5',
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  commonContainer(String title) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getSize(10), vertical: getSize(6)),
      decoration: BoxDecoration(
        color: Color(0xFFFFEEE1),
        borderRadius: BorderRadius.circular(getSize(6)),
      ),
      child: BaseText(
        text: title,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        textColor: AppColors.primaryOrange,
      ),
    );
  }

  String getInitials(String venderName) => venderName
      .trim()
      .split(' ')
      .map((l) => l[0])
      .take(2)
      .join()
      .toUpperCase();
}
