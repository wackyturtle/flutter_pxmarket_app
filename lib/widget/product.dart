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
