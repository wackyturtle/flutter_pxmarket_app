import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';
import 'product_regist_page/product_regist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD

=======
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
<<<<<<< HEAD
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 58, 115, 37),
          ),
=======
          labelStyle: TextStyle(color: Color.fromARGB(255, 58, 115, 37)),
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 58, 115, 37)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.yellow[50],
<<<<<<< HEAD
          titleTextStyle: TextStyle( //팝업창제목스타일
=======
          titleTextStyle: TextStyle(
            //팝업창제목스타일
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
            color: Color(0xFF3E5934),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
<<<<<<< HEAD




      
      home: ProductListPage(),
=======
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
    );
  }
}
