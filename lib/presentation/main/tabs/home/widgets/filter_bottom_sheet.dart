import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class FilterBottomSheet extends StatelessWidget {
  final String filterTitle;
  final List<String> list;
  final List<String> selectedList;

  const FilterBottomSheet(
      {super.key,
      required this.filterTitle,
      required this.list,
      required this.selectedList});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  getFilterBottomSheet(
    BuildContext context,
  ) {
    var selectedFilterList = selectedList;
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      enableDrag: false,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getSize(14)),
          topRight: Radius.circular(getSize(14)),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: getSize(20)),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: getSize(20),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: BaseText(
                                textAlign: TextAlign.center,
                                text: filterTitle,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                textColor: AppColors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.pop();
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.close_rounded),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: 0,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: list.length,
                        padding: EdgeInsets.symmetric(vertical: getSize(20)),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (selectedFilterList
                                      .contains(list[index])) {
                                    selectedFilterList.remove(list[index]);
                                  } else {
                                    selectedFilterList.add(list[index]);
                                  }
                                },
                              );
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: getSize(15)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    selectedFilterList.contains(list[index])
                                        ? SvgImageConstant.selectedCheckbox
                                        : SvgImageConstant.emptyCheckbox,
                                  ),
                                  SizedBox(
                                    width: getSize(6),
                                  ),
                                  BaseText(
                                    text: list[index],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: getSize(12),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            width: getSize(160),
                            onPressed: () {
                              context.router.pop(null);
                              //   Get.back();
                            },
                            borderColor: AppColors.primaryOrange,
                            buttonTextColor: AppColors.primaryOrange,
                            backgroundColor: AppColors.white,
                            buttonText: 'Cancel',
                          ),
                        ),
                        SizedBox(width: getSize(19)),
                        Expanded(
                          child: CommonButton(
                            width: getSize(160),
                            onPressed: () {
                              context.router.pop(selectedFilterList);
                            },
                            buttonText: 'Apply',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getSize(isFullScreenDevice(context) ? 0 : 12),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
