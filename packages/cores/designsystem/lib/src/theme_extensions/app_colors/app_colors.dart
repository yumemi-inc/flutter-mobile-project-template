import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_colors.g.theme.dart';

@themeExtensions
class AppColors extends ThemeExtension<AppColors> with _$ThemeExtensionMixin {
  const AppColors({
    required this.icon,
  });
  factory AppColors.light() => const AppColors(icon: Color(0xFF009688));

  factory AppColors.dark() => const AppColors(icon: Color(0xFF80CBC4));

  final Color icon;
}
