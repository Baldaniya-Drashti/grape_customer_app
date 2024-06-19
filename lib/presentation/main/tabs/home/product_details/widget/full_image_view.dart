import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/widgets/layout/layout.dart';

@RoutePage(name: 'FullImageView')
class FullImageView extends StatelessWidget {
  final String productId;
  final int index;
  // final String imageUrl;
  // final int type;
  // final ChewieController? chewieController;
  const FullImageView({
    super.key,
    required this.productId,
    required this.index,
    // required this.imageUrl,
    // this.chewieController,
    // required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: BlocProvider(
        create: (context) => getIt<ProductDetailBloc>()
          ..add(ProductDetailEvent.selectImage(index))
          ..add(ProductDetailEvent.getProductDetails(
              productId, true, true, true)),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isErrorInAPI) {
              return Center(
                child: BaseText(text: 'Something wrong. Please try again!!'),
              );
            } else {
              return WillPopScope(
                onWillPop: () {
                  state.getProductDetails.product!
                      .media![state.selectedImageIndex].chewieController
                      ?.dispose();
                  state.getProductDetails.product!
                      .media![state.selectedImageIndex].videoPlayerController
                      ?.dispose();
                  Navigator.pop(context, true);
                  return Future.value(true);
                },
                child: SafeArea(
                  child: Center(
                    child: state.getProductDetails.product
                                ?.media?[state.selectedImageIndex].media_type ==
                            2
                        ? state
                                        .getProductDetails
                                        .product!
                                        .media![state.selectedImageIndex]
                                        .chewieController !=
                                    null &&
                                state
                                    .getProductDetails
                                    .product!
                                    .media![state.selectedImageIndex]
                                    .chewieController!
                                    .videoPlayerController
                                    .value
                                    .isInitialized
                            ? Chewie(
                                controller: state
                                    .getProductDetails
                                    .product!
                                    .media![state.selectedImageIndex]
                                    .chewieController!)
                            : Center(
                                child: CircularProgressIndicator(),
                              )
                        : CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            imageUrl: state.getProductDetails.product
                                    ?.media?[state.selectedImageIndex].media ??
                                "",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey.shade300,
                            ),
                          ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
