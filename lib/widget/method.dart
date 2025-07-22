import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_cart_page/product_cart_page.dart';

//타이틀 형식 함수
Text titleMethod(String title) {
  return Text(title, style: TextStyle(fontSize: 24, color: Color(0xFFF9F9F9)));
}

//장바구니 바로가기 버튼
IconButton goToCart(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.shopping_cart, color: Colors.white),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductCartPage()),
      );
    },
  );
}
