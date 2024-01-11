import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

Widget getAvatarWithBadge(
  String image, {
  required bool isOnline,
  required double imageRadius,
  required double iconRadius,
}) {
  return Stack(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(
          image,
        ),
        backgroundColor: Colors.transparent,
        radius: imageRadius,
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: isOnline ? AppColors.green : Colors.grey,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 2,
              color: AppColors.grey,
            ),
          ),
          constraints: BoxConstraints(
            minWidth: iconRadius,
            minHeight: iconRadius,
          ),
        ),
      )
    ],
  );
}
