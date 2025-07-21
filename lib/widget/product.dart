import 'package:flutter/material.dart';

class Product {
  String? productName;
  Image productImage;
  int productPrice;
  String productInfo;

  Product({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productInfo,
  });
}
