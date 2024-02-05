import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class SelectModelWidget extends StatelessWidget {
  const SelectModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Opacity(
        opacity: index == 0 ? 1 : 0.6,
        child: Container(
          height: getSize(50),
          width: getSize(50),
          margin: EdgeInsets.only(
            left: getSize(index == 0 ? 18 : 5),
            right: getSize(index == 9 ? 18 : 5),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(getSize(6)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getSize(6)),
            boxShadow: index == 0
                ? [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ]
                : null,
            border: Border.all(
              color: index == 0
                  ? AppColors.black
                  : AppColors.black.withOpacity(0.2),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0U3avlAFpuN9Sf5PVhN3MHdXQzh6rJusL93tMQRngAnrK1k0Z9CH4hzhArR0kyV-Fm_E&usqp=CAU',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
