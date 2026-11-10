import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const government = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const appTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: AppColors.darkBlue,
  );

  static const subtitle = TextStyle(
    fontSize: 11,
    color: AppColors.textGrey,
    fontWeight: FontWeight.w500,
  );

  static const navigation = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const heroTitle = TextStyle(
    fontSize: 23,
    height: 1.15,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static const heroSubtitle = TextStyle(
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  static const cardTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static const cardSubtitle = TextStyle(
    fontSize: 10,
    color: AppColors.textGrey,
  );
}