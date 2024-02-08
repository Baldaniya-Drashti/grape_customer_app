import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/app_router.gr.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class AllMessageListWidget extends StatelessWidget {
  const AllMessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding:
          EdgeInsets.symmetric(horizontal: getSize(12), vertical: getSize(10)),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.router.push(PageRouteInfo(ChatView.name)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: getSize(9)),
            padding: EdgeInsets.symmetric(
              horizontal: getSize(6),
              vertical: getSize(8),
            ),
            decoration: BoxDecoration(
              color: index == 0 ? Color(0xFFFFEEE1) : Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(
                getSize(10),
              ),
              border: Border.all(
                color: index == 0
                    ? AppColors.primaryOrange.withOpacity(0.4)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(getSize(6)),
                  child: CachedNetworkImage(
                    height: getSize(50),
                    width: getSize(50),
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
                    placeholder: (context, url) => Container(
                      height: getSize(50),
                      width: getSize(50),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(
                            cornerRadius: getSize(6),
                            cornerSmoothing: 1,
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: getSize(8),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: 'Michael Snow',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: index == 0
                            ? AppColors.primaryOrange
                            : AppColors.black.withOpacity(0.60),
                      ),
                      SizedBox(
                        height: getSize(4),
                      ),
                      BaseText(
                        text: 'I’m at the office right now.',
                        fontSize: 12,
                        maxLines: 2,
                        textColor: AppColors.black
                            .withOpacity(index == 0 ? 0.60 : 0.40),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: index == 0,
                  child: Container(
                    height: getSize(18),
                    width: getSize(18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      shape: BoxShape.circle,
                    ),
                    child: BaseText(
                      text: '01',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
