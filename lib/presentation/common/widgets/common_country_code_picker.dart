import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:grape_customer_app/domain/core/math_utils.dart';
import 'package:grape_customer_app/presentation/core/styles/app_colors.dart';

class CommonCountryCodePicker extends StatelessWidget {
  final Function(CountryCode) onChanged;
  final String? initialSelection;
  const CommonCountryCodePicker({
    super.key,
    required this.onChanged,
    this.initialSelection,
  });

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlagMain: false,
      alignLeft: true,
      initialSelection: initialSelection,
      flagDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getSize(14),
        ),
      ),
      searchDecoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white.withOpacity(0.2),
        hintText: 'Search country',
        contentPadding: EdgeInsets.symmetric(
          vertical: getSize(12),
          horizontal: getSize(20),
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(getSize(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(getSize(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(getSize(10)),
        ),
        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(0.3),
          fontSize: getFontSize(14),
          fontFamily: 'SfPro',
          fontWeight: FontWeight.w500,
        ),
      ),
      // showDropDownButton: true,
      showFlag: true,
    );
  }
}
