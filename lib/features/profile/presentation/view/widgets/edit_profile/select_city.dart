import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';

class CityDropdownWidget extends StatelessWidget {
  final String? selectedCity;
  final ValueChanged<String?> onChanged;

  const CityDropdownWidget({
    super.key,
    required this.selectedCity,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    final countryOptions = ['cairo'.tr(), 'alexandria'.tr(), 'giza'.tr(), 'luxor'.tr(), 'aswan'.tr(), 'port_said'.tr(), 'suez'.tr(), 'mansoura'.tr(), 'tanta'.tr(), 'faiyum'.tr(),
      'zagazig'.tr(), 'ismailia'.tr(), 'asyut'.tr(), 'qena'.tr(), 'damietta'.tr(), 'beni_suef'.tr(), 'minya'.tr(), 'sohag'.tr(), 'kafr_el_sheikh'.tr(), 'daqahlia'.tr(),
      'sharqia'.tr(), 'gharbia'.tr(), 'monufia'.tr(), 'beheira'.tr(), 'matrouh'.tr(), 'north_sinai'.tr(), 'south_sinai'.tr()];
    final value = countryOptions.contains(selectedCity) ? selectedCity : null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: isDark
          ? AppColors.current.darkText
          : AppColors.current.text,
    );
    return Padding(
      padding: PaddingConstants.horizontalMedium,
      child: DropdownButtonFormField<String>(
        isDense: true,
        menuMaxHeight: 200,
        dropdownColor: AppColors.current.white,
        value: value,
        style: textStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.flag_outlined, color: AppColors.current.blue),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          fillColor: AppColors.current.white,
          hoverColor: AppColors.current.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: AppColors.current.blue,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.current.white, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColors.current.white, width: 1),
          ),
        ),
        items: countryOptions
            .map((city) => DropdownMenuItem(
          value: city,
          child: Text(city.tr()),
        ))
            .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? "please_select_your_city".tr() : null,
      ),
    );
  }
}