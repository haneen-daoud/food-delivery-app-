import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_color.dart';
class AppTheme {
  static ThemeData lightThem =ThemeData(
    appBarTheme:const AppBarTheme(backgroundColor: AppColor.bgcolor),
    scaffoldBackgroundColor: AppColor.bgcolor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.orange),
    /*
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColor.bgcolor,
      
    ),*/
    useMaterial3: true, 
    inputDecorationTheme: InputDecorationTheme(
border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.grey.withOpacity(0.3)),

              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.red)
              ),
               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.red.withOpacity(0.3))
              ),

               disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.grey)
              ),
    ),

  );
}