import 'package:flutter/material.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';

class CartPage extends StatelessWidget {
  final List<NewProduct> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Color(0xFF3E5630),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: SizedBox(width: 60, child: item.image),
            title: Text(item.name),
            subtitle: Text('₩ ${item.price} x ${item.quantity}'),
            trailing: Text(
              '₩ ${item.price * item.quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}