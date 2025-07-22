import 'package:flutter/material.dart';
import 'product_detail_page/product_detail_page.dart';
import 'widget/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PX 마켓',
      home: ProductDetailPage(product: p2),
    );
  }
}
