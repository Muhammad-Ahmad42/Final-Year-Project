// theme/theme.dart (Example file structure)
import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/theme/custome_themes/appbar_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/bottom_sheet_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/checkbox_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/chip_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/elevated_button_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/icon_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/text_field_theme.dart';
import 'package:wildscan/utils/theme/custome_themes/text_theme.dart';

class WildScanAppTheme {
  WildScanAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: WildScanColors.primary,
      hintColor: WildScanColors.black,
      scaffoldBackgroundColor: WildScanColors.white,
      textTheme: WildScanTextTheme.lightTextTheme,
      inputDecorationTheme:
          WildScanTextFormFieldTheme.lightInputDecorationTheme,
      elevatedButtonTheme: WildScanElevatedButtonTheme.lightElevatedButtonTheme,
      checkboxTheme: WildScanCheckboxTheme.lighWildScanCheckboxTheme, //
      appBarTheme: WildScanAppBarTheme.lighWildScanAppBarTheme,
      bottomSheetTheme: WildScanBottomSheetTheme.lightBottomSheetTheme,
      chipTheme: WildScanChipTheme.lightChipTheme,
      iconTheme: WildScanIconTheme.lightIconTheme

      // ... other theme properties (appBarTheme, colorScheme, etc.)
      );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.blueAccent,
      hintColor: WildScanColors.white,
      scaffoldBackgroundColor: Colors.black,
      textTheme: WildScanTextTheme.darkTextTheme,
      inputDecorationTheme: WildScanTextFormFieldTheme.darkInputDecorationTheme,
      elevatedButtonTheme: WildScanElevatedButtonTheme.darkElevatedButtonTheme,
      checkboxTheme: WildScanCheckboxTheme.darkCheckboxTheme,
      appBarTheme: WildScanAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: WildScanBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: WildScanChipTheme.darkChipTheme,
      iconTheme: WildScanIconTheme.darkIconTheme);
}
