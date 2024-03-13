import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class SelectModelWidget extends StatelessWidget {
  const SelectModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return SizedBox(
          height: getSize(50),
          child: ListView.builder(
            itemCount: state.getProductDetails.product?.images?.length ?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context
                    .read<ProductDetailBloc>()
                    .add(ProductDetailEvent.selectImage(index));
              },
              child: Opacity(
                opacity: state.selectedImageIndex == index ? 1 : 0.6,
                child: Container(
                  height: getSize(50),
                  width: getSize(50),
                  margin: EdgeInsets.only(
                    left: getSize(index == 0 ? 18 : 5),
                    right: getSize(
                      index ==
                              ((state.getProductDetails.product?.images
                                          ?.length ??
                                      0) -
                                  1)
                          ? 18
                          : 5,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(getSize(6)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(6)),
                    boxShadow: index == state.selectedImageIndex
                        ? [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.25),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ]
                        : null,
                    border: Border.all(
                      color: index == state.selectedImageIndex
                          ? AppColors.black
                          : AppColors.black.withOpacity(0.2),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        state.getProductDetails.product?.images?[index].image ??
                            "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
