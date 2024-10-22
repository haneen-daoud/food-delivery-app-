import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/custom_buttom_navbar.dart';
import 'package:food_delivery_app/pages/product_details_page.dart';
import 'package:food_delivery_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery',
      theme: AppTheme.lightThem,
      home: const CustomButtomNavbar(),
      routes:{
      '/product-details':(context) =>const ProductDetailsPage()
      }

    );
  }
}
