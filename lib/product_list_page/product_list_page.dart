import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_pxmarket_app/product_regist_page/product_regist_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';


class ProductListPage extends StatefulWidget {
=======
import 'package:flutter_pxmarket_app/product_detail_page/product_detail_page.dart';
import 'package:flutter_pxmarket_app/product_regist_page/product_regist_page.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pxmarket_app/widget/method.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> productList = [];

<<<<<<< HEAD
=======
  //상품 등록 버튼 눌렸을 때
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
  void productAdd() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductRegistPage()),
    );
<<<<<<< HEAD

=======
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
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
<<<<<<< HEAD
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
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: (productList.length / 3).ceil(),
              itemBuilder: (context, index) {
                final start = index * 3;
                final end = (start + 3 < productList.length)
                    ? start + 3
                    : productList.length;
                final items = productList.sublist(start, end);

                return ProductRow(productList: items);
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: pab(),
    );
  }

  SizedBox pab() {
=======
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
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
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

<<<<<<< HEAD
class ProductRow extends StatelessWidget {
  final List<Product> productList;

  const ProductRow({super.key, required this.productList});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: productList.map((product) {
        return ProductBox(
          name: product.productName,
          price: '${product.productPrice}원',
          image: product.productImage,
        );
      }).toList(),
=======
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
>>>>>>> 953a7d1c4fc933024235f15c1e220f646ae42c4b
    );
  }
}

class ProductBox extends StatelessWidget {
  final name;
  final price;
  final String image;

  const ProductBox({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    // image 타입이 Image.file 이면 FileImage로 변환
    if (image is Image) {
      final imageWidget = image as Image;
      if (imageWidget.image is FileImage) {
        imageProvider = imageWidget.image as FileImage;
      } else {
        imageProvider = AssetImage('assets/images/placeholder.png'); // 대체 이미지
      }
    } else if (image is String) {
      imageProvider = AssetImage(image);
    } else {
      imageProvider = AssetImage('assets/images/placeholder.png'); // fallback
    }

  return SizedBox(
  width: 120,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: image.startsWith('/data') || image.startsWith('/var')
                ? FileImage(File(image))
                : AssetImage(image) as ImageProvider,
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