import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Center(
          child: state.getProductDetails.product?.media != null
              ? GestureDetector(
                  onTap: () async {
                    var res = await context.router.push(
                      PageRouteInfo(
                        FullImageView.name,
                        args: FullImageViewArgs(
                          productId:
                              state.getProductDetails.product?.id.toString() ??
                                  "",
                          index: state.selectedImageIndex,
                        ),
                      ),
                    );

                    log('res : $res');
                    // if (res != null && res == true) {
                    //   if ((state.getProductDetails.product
                    //           ?.media?[state.selectedImageIndex].media_type ==
                    //       2)) {
                    //     context
                    //         .read<ProductDetailBloc>()
                    //         .add(ProductDetailEvent.disposeController());
                    //   }
                    // }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.getProductDetails.product
                                ?.media?[state.selectedImageIndex].thumbnail ??
                            "",
                        height: getSize(216),
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => Container(
                          height: getSize(216),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                        ),
                        fit: BoxFit.cover,
                      ),
                      Visibility(
                        visible: state.getProductDetails.product
                                ?.media?[state.selectedImageIndex].media_type ==
                            2,
                        child: Container(
                          height: getSize(50),
                          width: getSize(50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                offset: Offset(0, 0),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: getSize(50),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: getSize(216),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade300,
                ),
        );
      },
    );
  }
}
