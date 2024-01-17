import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';

class CommonRatingBar extends StatelessWidget {
  const CommonRatingBar({
    super.key,
    required this.onRatingUpdate,
    this.iconnSize,
    this.horizontalPadding,
    this.absorbing = false,
    this.initialRating = 0.0,
  });
  final void Function(double) onRatingUpdate;
  final double? iconnSize;
  final double? horizontalPadding;
  final bool absorbing;
  final double initialRating;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: RatingBar(
        itemSize: iconnSize ?? getSize(40),
        allowHalfRating: true,
        minRating: 0,
        initialRating: initialRating,
        glow: false,
        ratingWidget: RatingWidget(
          full: SvgPicture.asset(SvgImageConstant.fullStar),
          half: SvgPicture.asset(SvgImageConstant.halfStart),
          empty: SvgPicture.asset(SvgImageConstant.emptyStar),
        ),
        onRatingUpdate: onRatingUpdate,
        itemPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? getSize(07),
        ),
      ),
    );
  }
}
