import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_cart_page/product_cart_page.dart';
import 'package:flutter_pxmarket_app/product_detail_page/product_detail_page.dart';
import 'package:flutter_pxmarket_app/product_regist_page/product_regist_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pxmarket_app/widget/method.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> productList = [];

  List<Product?> getFilledList(List<Product> productList) {
    const int itemsPerRow = 3;
    int remainder = productList.length % itemsPerRow;
    int toAdd = remainder == 0 ? 0 : itemsPerRow - remainder;
    return [
      ...productList,
      ...List.filled(toAdd, null),
    ]; //List.filled(길이, 넣고싶은 것) // ... == 리스트를 하나씩 분리해서 반환
  }

  void productAdd() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductRegistPage()),
    );
    if (newProduct != null && newProduct is Product) {
      setState(() {
        productList.add(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleMethod('PX 마켓'),
        centerTitle: true,
        backgroundColor: Color(0xFF3E5630),
        actions: [goToCart(context)],
      ),
      body: productList.isEmpty
          ? Center(child: Text('등록된 상품이 없습니다.'))
          : GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 80,
              children: productList.map((product) {
                return product == null
                    ? SizedBox() // 빈 공간
                    : ProductBox(product: product);
              }).toList(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FAB(),
    );
  }

  SizedBox FAB() {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        onPressed: productAdd,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF3E5630), width: 2),
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0,
        // svg 아이콘 이용
        child: SvgPicture.asset(
          'assets/icons/add_bold.svg',
          width: 50,
          height: 50,
          colorFilter: ColorFilter.mode(Color(0xFF3E5630), BlendMode.srcIn),
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final List<Product> productList;
  const ProductRow({super.key, required this.productList});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: productList.map((product) {
        return ProductBox(product: product);
      }).toList(),
    );
  }
}

class ProductBox extends StatelessWidget {
  final Product product;
  const ProductBox({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: product),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: FileImage(product.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      product.productName,
                      style: TextStyle(fontSize: 15, color: Color(0xFF292929)),
                    ),
                    Text(
                      '${NumberFormat('#,###').format(product.productPrice)}원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF292929),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
