import 'package:flutter/material.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class ProductConfigurationWidget extends StatelessWidget {
  const ProductConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getProductDetails(title: 'Brand', description: 'Nothing'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(title: 'Model Name', description: 'A063'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(title: 'Wireless Carrier', description: 'MVNO'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(
            title: 'Operating System', description: 'Android 12.0'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(title: 'Cellular Technology', description: '5G'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(
            title: 'Storage Capacity', description: '128GB/ 256GB'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(
            title: 'Connectivity Technology', description: 'Wi-Fi'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(title: 'Screen Size', description: '3.1 Inches'),
        SizedBox(
          height: getSize(6),
        ),
        getProductDetails(
            title: 'Wireless network technology', description: ' GSM'),
      ],
    );
  }

  getProductDetails({required String title, required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(18)),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: getFontSize(12),
            color: AppColors.black.withOpacity(0.80),
            fontFamily: 'SfPro',
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: '$title: '),
            TextSpan(
              text: description,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.60),
                fontFamily: 'SfPro',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        textScaler: TextScaler.linear(1),
      ),
    );
  }
}
