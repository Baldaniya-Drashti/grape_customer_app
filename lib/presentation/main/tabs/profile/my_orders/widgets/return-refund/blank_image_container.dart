import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/application/main/profile/my_orders/my_orders_bloc.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/utils/image_picker_utils.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/common/widgets/image_chosser.dialog.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:image_picker/image_picker.dart';

class BlankImageContainer extends StatelessWidget {
  final int index;
  const BlankImageContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: getSize(index != 0 ? 9 : 0),
            right: getSize(index == (state.uploadImageList.length - 1) ? 0 : 9),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {
                  ImageChooserDialog().showImageChooserDialog(
                    takePhotoCallback: () async {
                      String path = await ImagePickerUtils().pickImage(
                              imageSource: ImageSource.camera,
                              context: context) ??
                          '';

                      if (path.isNotEmpty) {
                        context.read<MyOrdersBloc>().add(
                              MyOrdersEvent.addRefundPhoto(path),
                            );
                      }
                      context.router.maybePop();
                    },
                    selectPhotoCallback: () async {
                      String path = await ImagePickerUtils().pickImage(
                              imageSource: ImageSource.gallery,
                              context: context) ??
                          '';
                      if (path.isNotEmpty) {
                        context.read<MyOrdersBloc>().add(
                              MyOrdersEvent.addRefundPhoto(path),
                            );
                      }
                      context.router.maybePop();
                    },
                    context: context,
                  );
                },
                child: DottedBorder(
                  color: Color(0xFFBABABA),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(getSize(10)),
                  padding: EdgeInsets.zero,
                  borderPadding: EdgeInsets.zero,
                  strokeWidth: 1.5,
                  dashPattern: [4, 4],
                  child: Container(
                    alignment: Alignment.center,
                    height: getSize(160),
                    width: getSize(160),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getSize(10)),
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            state.uploadImageList[index],
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: state.uploadImageList[index].isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                SvgImageConstant.addPhotos,
                              ),
                              SizedBox(
                                height: getSize(6),
                              ),
                              BaseText(
                                text: 'Add Photos',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black.withOpacity(0.60),
                              )
                            ],
                          )
                        : null,
                  ),
                ),
              ),
              Positioned(
                right: getSize(10),
                top: getSize(10),
                child: Visibility(
                  visible: state.uploadImageList[index].isNotEmpty,
                  child: GestureDetector(
                    onTap: () {
                      context.read<MyOrdersBloc>().add(
                            MyOrdersEvent.removeRefundPhoto(index),
                          );
                    },
                    child: Container(
                      height: getSize(20),
                      width: getSize(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.20),
                            offset: Offset(0, 0),
                            blurRadius: 14,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: getSize(14),
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
