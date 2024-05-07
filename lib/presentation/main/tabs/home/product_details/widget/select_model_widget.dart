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
            itemCount: state.getProductDetails.product?.media?.length ?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
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
                              ((state.getProductDetails.product?.media
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
                        state.getProductDetails.product?.media?[index]
                                .thumbnail ??
                            "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Visibility(
                    visible: state.getProductDetails.product?.media?[index]
                            .media_type ==
                        2,
                    child: Container(
                      height: getSize(20),
                      width: getSize(20),
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
                        size: getSize(16),
                      ),
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
