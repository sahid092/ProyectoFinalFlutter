import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get tema => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primario),
    scaffoldBackgroundColor: AppColors.fondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.fondo,
      foregroundColor: AppColors.texto,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
