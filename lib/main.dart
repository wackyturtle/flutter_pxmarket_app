import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_detail_page/product_detail_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_pxmarket_app/product_cart_page/product_cart_page.dart'; // 이거 추가

void main() {
  runApp(const PxMarketApp());
}

class PxMarketApp extends StatelessWidget {
  const PxMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PX마켓',
      // home: ProductDetailPage(
      //   product: Product(
      //     productName: '상품 상세',
      //     productImage: Image.asset('assets/images/bag.webp'),
      //     productPrice: 15000,
      //     productInfo: '군더더기 없이 깔끔한 디자인과 넉넉한 사이즈로 활용도가 높으며 남녀노소 누구나 착용이 가능합니다.',
      //   ),
      // ),
      home: const ProductCartPage(), // 장바구니 페이지를 바로 보도록 임시 수정, 이거추가
    );
  }
}
