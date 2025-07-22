import 'dart:io';

class Product {
  String productName;
  File productImage;
  int productPrice;
  String productInfo;

  Product({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productInfo,
  });
}
