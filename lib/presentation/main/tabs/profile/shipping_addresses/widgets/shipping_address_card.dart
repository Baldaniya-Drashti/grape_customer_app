import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/infrastructure/main/shipping_address_dto/shipping_address_dto.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';
import 'package:grape_customer_app/presentation/core/widgets/buttons/common_button.dart';

class ShippingAddressCard extends StatelessWidget {
  final ShippingAddressDTO shippingAddress;
  final void Function()? onTapSelectCard;
  final void Function()? onTapDelete;
  final void Function()? onTapEdit;
  final bool isSelectCard;

  const ShippingAddressCard({
    super.key,
    required this.shippingAddress,
    this.onTapSelectCard,
    this.onTapDelete,
    this.onTapEdit,
    required this.isSelectCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSelectCard,
      child: Container(
        padding: EdgeInsets.all(getSize(24)),
        decoration: BoxDecoration(
          color: isSelectCard ? AppColors.white : AppColors.grey1,
          border: Border.all(
            color: isSelectCard
                ? AppColors.primaryOrange
                : AppColors.black.withOpacity(0.20),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: shippingAddress.full_name ?? '',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: getSize(16),
            ),
            BaseText(
              text:
                  '+${shippingAddress.country_code} ${shippingAddress.mobile}',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: getSize(16),
            ),
            BaseText(
              text:
                  '${shippingAddress.address},${shippingAddress.state},${shippingAddress.city},${shippingAddress.pincode}',
              textColor: AppColors.black.withOpacity(0.6),
              fontSize: 14,
              showFullDescription: true,
            ),
            SizedBox(
              height: getSize(5),
            ),
            BaseText(
              text:
                  '${AppLocalizations.of(context).landMark}: ${shippingAddress.landmark}',
              fontSize: 14,
            ),
            SizedBox(
              height: getSize(16),
            ),
            Row(
              children: [
                CommonButton(
                  buttonFontSize: 14,
                  height: getSize(37),
                  buttonFontWeight: FontWeight.w800,
                  width: getSize(90),
                  onPressed: onTapEdit ?? () {},
                  buttonText: AppLocalizations.of(context).edit,
                ),
                SizedBox(
                  width: getSize(24),
                ),
                GestureDetector(
                  onTap: onTapDelete,
                  child: SvgPicture.asset(SvgImageConstant.deleteIcon),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
