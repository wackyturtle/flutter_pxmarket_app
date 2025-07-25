import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/widget/method.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_pxmarket_app/product_list_page/product_list_page.dart';
import 'package:intl/intl.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  // 앱 전역에서 장바구니 데이터를 관리하기 위한 static 변수 및 메서드
  static List<CartItem> items = [];

  /// 장바구니에 상품을 추가합니다. 이미 있는 상품이면 수량을 더하기
  static void addItem(Product product, int quantity) {
    // 장바구니에 이미 있는 상품인지 확인 (상품 이름으로 비교)
    for (var item in items) {
      if (item.product.productName == product.productName) {
        item.quantity += quantity;
        return; // 수량만 추가하고 함수 종료
      }
    }
    // 장바구니에 없는 새로운 상품이면 추가
    items.add(CartItem(product: product, quantity: quantity));
  }
}

class ProductCartPage extends StatefulWidget {
  const ProductCartPage({super.key});

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  // 총액을 계산하는 함수
  int _calculateTotalPrice() {
    int total = 0;
    for (final item in CartItem.items) {
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
        title: titleMethod('장바구니'),
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
      body: CartItem.items.isEmpty
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
                    itemCount: CartItem.items.length,
                    itemBuilder: (context, index) {
                      final item = CartItem.items[index];
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
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.file(item.product.productImage),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // 상품명은 위로, 가격/버튼은 아래로
                    children: [
                      Text(
                        item.product.productName ?? '이름 없는 상품',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8), // 상품명과 가격/버튼 사이에 약간의 여백 추가

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // 가격과 버튼을 수평으로 정렬
                        children: [
                          item.product.productPrice == 0
                              ? Text(
                                  '무료',
                                  style: TextStyle(
                                    color: Color(0xFF292929),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '${NumberFormat('#,###').format(item.product.productPrice * item.quantity)}원',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    } else {
                                      CartItem.items.removeAt(index);
                                    }
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF3E5630),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF3E5630),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                  CartItem.items.removeAt(index);
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
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '총액',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '${NumberFormat('#,###').format(_calculateTotalPrice())}원',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // const SizedBox(width: 130),
          const Spacer(),
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
                          setState(() => CartItem.items.clear());
                          // 3. 메인 화면으로 이동
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
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
        ],
      ),
    );
  }
}
