import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/domain/core/svg_image_constants.dart';
import 'package:grape_customer_app/presentation/common/widgets/base_text.dart';

class CommonCountryCodePicker extends StatelessWidget {
  final Function(Country) onChanged;
  String? initialSelection;
  CommonCountryCodePicker({
    super.key,
    required this.onChanged,
    this.initialSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getSize(20)),
      child: GestureDetector(
        onTap: () {
          showFlag(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseText(
              text: '+ $initialSelection',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: getSize(10),
            ),
            SvgPicture.asset(
              SvgImageConstant.downArrow,
            ),
            SizedBox(
              width: getSize(15),
            ),
          ],
        ),
      ),
    );

    // Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Container(
    //       width: getSize(60),
    //       // color: Colors.black,
    //       child: CountryCodePicker(
    //         onChanged: onChanged,
    //         showFlagMain: false,
    //         alignLeft: true,
    //         initialSelection: initialSelection,
    //         flagDecoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(
    //             getSize(14),
    //           ),
    //         ),
    //         searchDecoration: InputDecoration(
    //           filled: true,
    //           fillColor: AppColors.white.withOpacity(0.2),
    //           hintText: 'Search country',
    //           contentPadding: EdgeInsets.symmetric(
    //             vertical: getSize(12),
    //             horizontal: getSize(20),
    //           ),
    //           isDense: true,
    //           border: OutlineInputBorder(
    //             borderSide: BorderSide(
    //               color: AppColors.black.withOpacity(0.3),
    //             ),
    //             borderRadius: BorderRadius.circular(getSize(10)),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(
    //               color: AppColors.black.withOpacity(0.3),
    //             ),
    //             borderRadius: BorderRadius.circular(getSize(10)),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderSide: BorderSide(
    //               color: AppColors.black.withOpacity(0.3),
    //             ),
    //             borderRadius: BorderRadius.circular(getSize(10)),
    //           ),
    //           hintStyle: TextStyle(
    //             color: AppColors.black.withOpacity(0.3),
    //             fontSize: getFontSize(14),
    //             fontFamily: 'SfPro',
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         // showDropDownButton: true,

    //         showFlag: true,
    //       ),
    //     ),
    //     // SvgPicture.asset(SvgImageConstant.downArrow),
    //   ],
    // );
  }

  void showFlag(BuildContext context) {
    showCountryPicker(
      context: context,

      exclude: <String>['KN', 'MF'],
      favorite: <String>['SE'],
      //Optional. Shows phone code before the country name.
      showPhoneCode: true,
      onSelect: onChanged,
      countryListTheme: CountryListThemeData(
        inputDecoration: InputDecoration(
          //labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                // color: ColorConstants.unableColor,
                ),
          ),
          focusedBorder: UnderlineInputBorder(
              // borderSide: BorderSide(color: ColorConstants.unableColor),
              ),
          enabledBorder: UnderlineInputBorder(
              // borderSide: BorderSide(color: ColorConstants.unableColor),
              ),
        ),
      ),
    );
  }
}
