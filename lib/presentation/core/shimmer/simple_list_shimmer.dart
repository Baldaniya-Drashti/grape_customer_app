import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class SimpleListShimmer extends StatelessWidget {
  const SimpleListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(getSize(18)),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return getCheckoutContainer(context);
      },
    );
  }

  getCheckoutContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(10)),
      margin: EdgeInsets.symmetric(vertical: getSize(9)),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(getSize(10)),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                height: getSize(90),
                width: getSize(90),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(getSize(10)),
                  ),
                ),
              ),
              SizedBox(
                width: getSize(8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getSize(06)),
                    width: getSize(150),
                    height: getSize(5),
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(
                    height: getSize(8),
                  ),
                  getProductDetails(
                    title: 'Colors',
                    description: 'Black',
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  getProductDetails(
                    title: 'Size',
                    description: '128 GB',
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  getProductDetails(
                    title: 'Quantity',
                    description: '1',
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: BaseText(
                text: '\$299',
                fontSize: 18,
                textColor: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned.fill(
            top: getSize(-10),
            right: getSize(-10),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText getProductDetails(
      {required String title, required String description}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: getFontSize(10),
          color: Colors.grey.shade400,
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontFamily: 'SfPro',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: description,
          )
        ],
      ),
      textScaler: TextScaler.linear(1),
    );
  }
}
