import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/main/tabs/profile/my_orders/widgets/return-refund/blank_image_container.dart';

class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        return SizedBox(
          height: getSize(180),
          child: ListView.builder(
            itemCount: state.uploadImageList.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
                horizontal: getSize(18), vertical: getSize(8)),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => BlankImageContainer(
              index: index,
            ),
          ),
        );
      },
    );
  }
}
