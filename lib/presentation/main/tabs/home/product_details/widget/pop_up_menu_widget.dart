import 'package:auto_route/auto_route.dart';
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
import 'package:share_plus/share_plus.dart';

class PopMenuWidget extends StatelessWidget {
  const PopMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return PopupMenuButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            SvgImageConstant.more,
          ),
          color: AppColors.white,
          offset: Offset(0, 0),
          elevation: 0,
          position: PopupMenuPosition.under,
          shadowColor: AppColors.black.withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getSize(10),
            ),
            side: BorderSide(
              color: AppColors.black.withOpacity(0.25),
            ),
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            getMenuItems(
              title: 'Home',
              image: SvgImageConstant.homeUnselected,
              onTap: () {},
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'Share',
              image: SvgImageConstant.share,
              onTap: () async {
                var shortlink = await DynamicLinksService.createDynamicLink(
                  imageURL: state.getProductDetails.product
                          ?.images?[state.selectedImageIndex].image ??
                      "",
                  title: state.getProductDetails.product?.product_name ?? "",
                  description: state.dataList[4].value ?? "",
                );

                if (shortlink.isNotEmpty) {
                  await Share.share(shortlink);
                }
              },
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: state.getProductDetails.product?.is_favorite == true
                  ? 'Favourite'
                  : 'Add Favorite',
              image: state.getProductDetails.product?.is_favorite == true
                  ? SvgImageConstant.favouriteSelected
                  : SvgImageConstant.favouriteUnselected,
              onTap: () {
                if (state.getProductDetails.product?.is_favorite == true) {
                } else {
                  context
                      .read<ProductDetailBloc>()
                      .add(ProductDetailEvent.addToFavourite());
                }
              },
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'Messages',
              image: SvgImageConstant.message,
              onTap: () {
                context.router.push(PageRouteInfo(ChatView.name));
              },
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'My Profile',
              image: SvgImageConstant.profileUnselected,
              onTap: () {},
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'Ask Help?',
              image: SvgImageConstant.feedback,
              onTap: () {},
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'Report',
              image: SvgImageConstant.report,
              onTap: () {},
            ),
            PopupMenuDivider(
              height: 0,
            ),
            getMenuItems(
              title: 'Feedback',
              image: SvgImageConstant.help,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  PopupMenuItem<dynamic> getMenuItems(
      {required String title,
      required String image,
      required Function() onTap}) {
    return PopupMenuItem(
      padding: EdgeInsets.symmetric(horizontal: getSize(12)),
      onTap: onTap,
      child: ListTile(
        dense: true,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: getSize(0),
        horizontalTitleGap: getSize(10),
        leading: SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          height: getSize(18),
          width: getSize(18),
        ),
        title: BaseText(
          text: title,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
