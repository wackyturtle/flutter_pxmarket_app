import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';
import 'package:flutter_pxmarket_app/cartpage.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _itemCount = 1; 
  late int _totalPrice;

  @override
  void initState() {
    super.initState();
    _totalPrice = widget.product.productPrice * _itemCount;
  }

  // 예외처리 => 구매 수량 0보다 작을 수 없고 100보다 클 수 없음 1~99
  void _incrementItem() {
    setState(() {
      if (_itemCount < 99) {
        _itemCount++;
        _totalPrice = widget.product.productPrice * _itemCount;
      }
    });
  }

  void _decrementItem() {
    setState(() {
      if (_itemCount > 1) {
        _itemCount--;
        _totalPrice = widget.product.productPrice * _itemCount;
      }
    });
  }

  // 구매 확인 팝업
  void _showPurchaseConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('구매 확인'),
          content: Text(
            '${widget.product.productName}을 $_itemCount개 구매하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _showPurchaseCompleteDialog();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 구매 완료 팝업
  void _showPurchaseCompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('구매 완료'),
          content: const Text('구매가 성공적으로 완료되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E5630),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '상품 상세',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        // 장바구니 넘어가기
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              final cartItem = NewProduct(
                name: widget.product.productName,
                price: widget.product.productPrice,
                quantity: _itemCount,
                info: widget.product.productInfo,
                image: widget.product.productImage,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: [cartItem]),
                ),
              );
            },
          ),
        ],
      ),

      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              FittedBox(fit: BoxFit.cover, child: widget.product.productImage),

              // 상품 상세
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style: const TextStyle(
                        fontSize: 24,
                        color: const Color(0xFF292929),
                        height: 1.1, // 줄 간격 줄이기
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 가격 텍스트
                        Text(
                          '₩ ${NumberFormat('#,###').format(widget.product.productPrice * _itemCount)}',
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF292929),
                          ),
                        ),

                        // 수량 버튼
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _decrementItem,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3E5630),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            // 수량 텍스트
                            Text(
                              '$_itemCount',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF292929),
                              ),
                            ),

                            const SizedBox(width: 12),

                            GestureDetector(
                              onTap: _incrementItem,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3E5630),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // 가방 설명
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      height: 1.0, // 실선
                      color: Color(0xFF292929),
                    ),

                    SizedBox(height: 18),
                    Text(
                      widget.product.productInfo,
                      style: const TextStyle(
                        fontSize: 19,
                        color: Color(0xFF292929),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // 장바구니 넘어가기
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        final cartItem = NewProduct(
                          name: widget.product.productName,
                          price: widget.product.productPrice,
                          quantity: _itemCount,
                          info: widget.product.productInfo,
                          image: widget.product.productImage,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CartPage(cartItems: [cartItem]),
                          ),
                        );
                      },

                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: Color(0xFF292929),
                          width: 1.5,
                        ),
                        backgroundColor: const Color(0xFF292929),
                      ),
                      child: const Text(
                        '장바구니',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // 바로구매
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _showPurchaseConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3E5630),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),

                      child: const Text(
                        '바로구매',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
