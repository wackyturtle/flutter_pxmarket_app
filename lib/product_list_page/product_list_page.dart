import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_detail_page/product_detail_page.dart';
import 'package:flutter_pxmarket_app/product_regist_page/product_regist_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pxmarket_app/widget/method.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> productList = [];

  //상품 등록 버튼 눌렸을 때
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
      //상품이 있는지 없는지 체크
      body: productList.isEmpty
          ? Center(child: Text('등록된 상품이 없습니다.'))
          : GridView.count(
              padding: EdgeInsets.symmetric(vertical: 30),
              crossAxisCount: 3, // 아이템 갯수
              mainAxisSpacing: 40, // 그리드마다 위아래 공간 띄우기
              childAspectRatio: 0.7, // 그리드 한칸의 가로 세로의 비율을 맞춰줌
              children: productList.map((product) {
                return ProductBox(product: product);
              }).toList(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: fAB(),
    );
  }

  SizedBox fAB() {
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

class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              border: BoxBorder.all(color: Color(0xFF3E5630), width: 2),
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
                  product.productPrice == 0
                      ? Text(
                          '무료',
                          style: TextStyle(
                            color: Color(0xFF292929),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
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
    );
  }
}
