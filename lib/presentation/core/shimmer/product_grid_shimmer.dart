import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/widgets/utility/common_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridShimmerView extends StatelessWidget {
  const ProductGridShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(18),
      ),
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: getSize(21),
        mainAxisSpacing: getSize(20),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.grey.shade50,
          baseColor: Colors.grey.shade300,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: getSize(160),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(getSize(10)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                    width: MediaQuery.of(context).size.width,
                    height: getSize(5),
                    color: Colors.grey[400],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                          width: MediaQuery.of(context).size.width,
                          height: getSize(5),
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        width: getSize(6),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                          width: MediaQuery.of(context).size.width,
                          height: getSize(5),
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CommonRatingBar(
                        onRatingUpdate: (p0) {},
                        iconnSize: getSize(9),
                        initialRating: 4.5,
                        horizontalPadding: getSize(2),
                        absorbing: true,
                      ),
                      SizedBox(
                        width: getSize(4),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                          width: MediaQuery.of(context).size.width,
                          height: getSize(5),
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstant.location,
                        height: getSize(12),
                        width: getSize(12),
                        colorFilter: ColorFilter.mode(
                          Colors.grey[400]!,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(
                        width: getSize(2),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                          width: MediaQuery.of(context).size.width,
                          height: getSize(5),
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: getSize(6),
                top: getSize(6),
                child: Container(
                  height: getSize(16),
                  width: getSize(36),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(
                      getSize(4),
                    ),
                  ),
                  child: BaseText(
                    text: '-20%',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
