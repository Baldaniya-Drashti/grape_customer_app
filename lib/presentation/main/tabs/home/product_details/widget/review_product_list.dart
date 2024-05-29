import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/injection.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/paginated_list_view.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';
import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_app_bar.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:intl/intl.dart';

@RoutePage(name: 'ReviewProductList')
class ReviewProductList extends StatelessWidget {
  final String productId;
  const ReviewProductList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailBloc>()
        ..add(
          ProductDetailEvent.getProductReviews(productId, true),
        ),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Review Product'),
        body: SafeArea(
          child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
            listener: (context, state) {},
            builder: (context, state) {
              return PaginatedListView(
                onRefresh: () {
                  context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getProductReviews(productId, true));
                },
                onLoading: () {
                  context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.getProductReviews(productId, false));
                },
                refreshController: context
                    .read<ProductDetailBloc>()
                    .productReviewRefreshController,
                isNoDataFound: state.isNoDataFound,
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      )
                    : state.isErrorInAPI
                        ? Center(
                            child: BaseText(
                                text:
                                    'Something went wrong. Please try again!!'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.reviewList.length,
                            padding:
                                EdgeInsets.symmetric(horizontal: getSize(18)),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(getSize(12)),
                              margin:
                                  EdgeInsets.symmetric(vertical: getSize(5)),
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9).withOpacity(0.20),
                                borderRadius:
                                    BorderRadius.circular(getSize(10)),
                                border: Border.all(
                                  color: AppColors.black.withOpacity(0.2),
                                  width: getSize(1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: getSize(20),
                                        backgroundColor: Colors.grey.shade400,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          state.reviewList[index].image ?? "",
                                        ),
                                      ),
                                      SizedBox(width: getSize(8)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BaseText(
                                            text: state.reviewList[index]
                                                    .fullname ??
                                                "",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: getSize(3),
                                          ),
                                          BaseText(
                                            text: DateFormat('dd MMM,yyyy')
                                                .format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        (state.reviewList[index]
                                                                    .created_at ??
                                                                0) *
                                                            1000)),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      CommonRatingBar(
                                        horizontalPadding: getSize(1.2),
                                        iconnSize: getSize(12),
                                        initialRating: state
                                                .reviewList[index].rate
                                                ?.toDouble() ??
                                            0,
                                        absorbing: true,
                                        onRatingUpdate: (value) {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: getSize(12)),
                                  BaseText(
                                    text: state.reviewList[index].review ?? "",
                                    textColor: AppColors.black.withOpacity(0.6),
                                    fontSize: 12,
                                    lineHeight: 1.5,
                                    showFullDescription: true,
                                    fontWeight: FontWeight.w400,
                                  )
                                ],
                              ),
                            ),
                          ),
              );
            },
          ),
        ),
      ),
    );
  }
}
