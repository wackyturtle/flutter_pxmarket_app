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

Product p2 = Product(
  productName: '군용 가방',
  productImage: Image.asset('assets/images/bag.webp'),
  productPrice: 15000,
  productInfo: '군더더기 없이 깔끔한 디자인과 넉넉한 사이즈로 활용도가 높으며 남녀노소 누구나 착용이 가능합니다.',
);


class NewProduct {
  final String name;
  final int price;
  final int quantity;
  final String info;
  final Widget image;

  NewProduct({
    required this.name,
    required this.price,
    required this.quantity,
    required this.info,
    required this.image,
  });
}