import 'package:api_api/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle dialogTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle labelText = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const TextStyle submitButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    color: AppColors.errorColor,
  );
}
