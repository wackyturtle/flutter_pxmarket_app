import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';

void main() {
  runApp(const PxMarketApp());
}

class PxMarketApp extends StatelessWidget {
  const PxMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
