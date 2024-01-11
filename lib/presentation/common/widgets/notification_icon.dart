import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class NotificationIcon extends StatelessWidget {
  final int count;
  const NotificationIcon({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -2,
      bottom: -2,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.white,
            width: 2,
          ),
        ),
        constraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 20,
        ),
        child: Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
