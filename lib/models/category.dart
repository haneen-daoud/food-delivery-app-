// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  final String id ;
  final String title;
  final String imgUrl;
  final VoidCallback onTap;

  Category({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.onTap,
  });

   static List<Category> dummyCategories = [
    Category(id: '1', title: 'Burger', imgUrl:'assets/images/burger.png', onTap:(){}),
    Category(id: '2', title: 'Taco', imgUrl:'assets/images/taco.png', onTap:(){}),
    Category(id: '3', title: 'Pizza', imgUrl:'assets/images/pizza.png', onTap:(){}),
    Category(id: '4', title: 'Chicken', imgUrl:'assets/images/turkey.png', onTap:(){}),
    Category(id: '5', title: 'Drink', imgUrl:'assets/images/soda.png', onTap:(){}),


  ];
}
