import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/product_regist_page/product_regist_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_svg/svg.dart';

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
    return [...productList, ...List.filled(toAdd, null)];
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
        title: Text(
          'PX마켓',
          style: TextStyle(fontSize: 32, color: Color(0xFFF9F9F9)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF3E5630),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 40, color: Color(0xFFF9F9F9)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductRegistPage(),
                ), // 여기를 ProductCartPage로 변경하기
              );
            },
          ),
        ],
      ),
      body: productList.isEmpty
          ? Center(child: Text('등록된 상품이 없습니다.'))
          : GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 필요시
              children: productList.map((product) {
                return product == null
                    ? SizedBox() // 빈 공간
                    : ProductBox(
                        name: product.productName,
                        price: '${product.productPrice}원',
                        image: product.productImage,
                      );
              }).toList(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: pab(),
    );
  }

  SizedBox pab() {
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
        return ProductBox(
          name: product.productName,
          price: '${product.productPrice}원',
          image: product.productImage,
        );
      }).toList(),
    );
  }
}

class ProductBox extends StatelessWidget {
  final name;
  final price;
  final File image;

  const ProductBox({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: FileImage(image),
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
                  SizedBox(height: 5),
                  Text(
                    '냉동',
                    style: TextStyle(fontSize: 12, color: Color(0xFF3E5630)),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 15, color: Color(0xFF292929)),
                  ),
                  Text(
                    price,
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
