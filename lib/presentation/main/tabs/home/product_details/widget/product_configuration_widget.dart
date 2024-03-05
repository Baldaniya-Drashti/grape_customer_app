import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/home/product_detail/product_detail_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class ProductConfigurationWidget extends StatelessWidget {
  const ProductConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
            state.productFromJson.data.length,
            (index) => getProductDetails(
              title: state.productFromJson.data[index].name ?? "",
              description: state.productFromJson.data[index].value ?? "",
            ),
          ),
        );
      },
    );
  }

  getProductDetails({required String title, required String description}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getSize(18), vertical: getSize(3)),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: getFontSize(12),
            color: AppColors.black.withOpacity(0.60),
            fontFamily: 'SfPro',
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: '$title: '),
            TextSpan(
              text: description,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.80),
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
