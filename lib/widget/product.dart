import 'package:flutter/material.dart';

class Product {
  String productName;
  Image productImage;
  int productPrice;
  String productInfo;

  Product({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productInfo,
  });
}

Product p1 = Product(
  productImage: Image.asset('assets/images/크림우동.jpg'),
  productName: '크림우동sss',
  productPrice: 2500,
  productInfo: '군인들의 주식',
);
