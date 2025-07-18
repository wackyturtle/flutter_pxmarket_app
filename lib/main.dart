import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

// 커밋 예시
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductListPage());
  }
}
