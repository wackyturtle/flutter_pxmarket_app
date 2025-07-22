import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 58, 115, 37)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 58, 115, 37)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.yellow[50],
          titleTextStyle: TextStyle(
            //팝업창제목스타일
            color: Color(0xFF3E5934),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
