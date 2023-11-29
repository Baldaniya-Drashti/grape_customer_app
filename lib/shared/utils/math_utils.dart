import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Size size =
    View.of(Get.context!).physicalSize / View.of(Get.context!).devicePixelRatio;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px.w;
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  return px.h;
}

bool isFullScreenDevice() {
  if (MediaQueryData.fromView(View.of(Get.context!)).viewPadding.bottom == 0) {
    return false;
  } else {
    return true;
  }
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  return px.sp;
  // var height = getVerticalSize(px);
  // var width = getHorizontalSize(px);
  // if (height < width) {
  //   return height.toInt().toDouble();
  // } else {
  //   return width.toInt().toDouble();
  // }
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}
