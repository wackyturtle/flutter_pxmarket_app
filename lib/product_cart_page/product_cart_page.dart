import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class ProductCartPage extends StatefulWidget {
  const ProductCartPage({super.key});

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  // 장바구니에 담긴 상품을 나타내는 더미 데이터
  final List<CartItem> _cartItems = [
    CartItem(
      product: Product(
        productName: '슈넬 치킨',
        productImage: Image.asset('assets/images/슈넬.jpg', fit: BoxFit.cover),
        productPrice: 3500,
        productInfo: '바삭바삭 맛있는 슈넬치킨',
      ),
      quantity: 2,
    ),
    CartItem(
      product: Product(
        productName: '크림우동',
        productImage: Image.asset(
          'assets/images/크림우동.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 7500,
        productInfo: '존맛탱',
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        productName: '빅팜',
        productImage: Image.asset(
          'assets/images/빅팜.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 1500,
        productInfo: '따봉',
      ),
      quantity: 3,
    ),
    CartItem(
      product: Product(
        productName: '크림우동',
        productImage: Image.asset(
          'assets/images/크림우동.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 7500,
        productInfo: '존맛탱',
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        productName: '크림우동',
        productImage: Image.asset(
          'assets/images/크림우동.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 7500,
        productInfo: '존맛탱',
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        productName: '크림우동',
        productImage: Image.asset(
          'assets/images/크림우동.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 7500,
        productInfo: '존맛탱',
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        productName: '크림우동',
        productImage: Image.asset(
          'assets/images/크림우동.jpg', // 사용 가능한 이미지로 수정
          fit: BoxFit.cover,
        ),
        productPrice: 7500,
        productInfo: '존맛탱',
      ),
      quantity: 1,
    ),
  ];

  // 총액을 계산하는 함수
  int _calculateTotalPrice() {
    int total = 0;
    for (final item in _cartItems) {
      total += item.product.productPrice * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF9F9F9)),
          onPressed: () {
            // 현재 페이지를 닫고 이전 화면으로 돌아가기
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          '장바구니',
          style: TextStyle(fontSize: 24, color: Color(0xFFF9F9F9)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3E5630),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Color(0xFFF9F9F9)),
            onPressed: () {
              // 메인 화면(상품 목록)으로 돌아가고, 이전 화면 기록을 모두 지우기
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => ProductListPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: _cartItems.isEmpty
          ? const Center(
              child: Text(
                '장바구니가 비어있습니다.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return _buildCartItem(item, index);
                    },
                  ),
                ),
                _buildTotalPriceAndOrderButton(),
              ],
            ),
    );
  }

  // 장바구니 아이템 위젯
  Widget _buildCartItem(CartItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            // 박스의 안쪽 여백을 늘려 X 버튼과 내용이 겹치지 않게 조정
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: item.product.productImage,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                    ), // 상품 정보 텍스트를 아래로 내리기
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TODO: 상품 데이터에 회사명/카테고리 추가 후 연결 필요
                        const Text(
                          '제조사/브랜드',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.product.productName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item.product.productPrice}원',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ), // +,- 버튼을 아래로 내리기 위한 여백
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              _cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                setState(() {
                  _cartItems.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // 총액 및 주문 버튼 위젯
  Widget _buildTotalPriceAndOrderButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30), // 하단 여백 추가
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // 그림자를 위쪽에만 표시
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '총액',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '${_calculateTotalPrice()}원',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 130),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('구매 완료'),
                    content: const Text('구매가 완료되었습니다.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('확인'),
                        onPressed: () {
                          // 1. 팝업 닫기
                          Navigator.of(dialogContext).pop();
                          // 2. 장바구니 비우기
                          setState(() => _cartItems.clear());
                          // 3. 메인 화면으로 이동
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => ProductListPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3E5630),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              '구매하기',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          //   const SizedBox(width: 30),
        ],
      ),
    );
  }
}
