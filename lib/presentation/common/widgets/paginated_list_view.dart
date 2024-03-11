import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginatedListView extends StatelessWidget {
  final Widget child;
  final bool isNoDataFound;
  final bool? enablePullUp;
  final bool? enablePullDown;
  final String? dataStatus;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final RefreshController refreshController;
  final bool reverse;
  final Axis? scrollDirection;
  const PaginatedListView({
    super.key,
    required this.onRefresh,
    required this.onLoading,
    required this.child,
    required this.refreshController,
    this.isNoDataFound = false,
    this.dataStatus,
    this.reverse = false,
    this.scrollDirection,
    this.enablePullUp,
    this.enablePullDown,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: MaterialClassicHeader(
        color: AppColors.primaryOrange,
      ),
      enablePullUp: true,
      enablePullDown: true,
      reverse: reverse,
      scrollDirection: scrollDirection,
      controller: refreshController,
      physics: BouncingScrollPhysics(),
      footer: CustomFooter(
        builder: (context, mode) {
          switch (mode) {
            case LoadStatus.loading:
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryOrange,
                ),
              );
            case LoadStatus.canLoading:
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryOrange,
                ),
              );
            case LoadStatus.noMore:
              return const SizedBox();

            case LoadStatus.failed:
              return const SizedBox();

            default:
          }
          return Container();
        },
      ),
      onRefresh: () {
        onRefreshData();
      },
      onLoading: () {
        onLoadMoreData();
      },
      child: isNoDataFound
          ? Center(
              child: SizedBox(
                width: getSize(280),
                child: BaseText(
                  textColor: AppColors.black.withOpacity(0.65),
                  text: dataStatus ?? 'No Result',
                  textAlign: TextAlign.center,
                  lineHeight: 1.2,
                ),
              ),
            )
          : child,
    );
  }

  onRefreshData() {
    onRefresh();
    refreshController.refreshCompleted();
  }

  onLoadMoreData() {
    onLoading();
    refreshController.loadComplete();
  }
}
