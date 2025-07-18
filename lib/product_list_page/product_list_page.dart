import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductListPage extends StatelessWidget {
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
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: 10,
        itemBuilder: (context, index) => ProductRow(),
        separatorBuilder: (context, index) => SizedBox(height: 20),
        //물품을 하나만 생성했을땐 어떻게 할지 구현해야함
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [ProductBox(), ProductBox(), ProductBox()]);
  }
}

//값을 받아오는거 구현해야함
class ProductBox extends StatelessWidget {
  const ProductBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage('assets/images/슈넬.jpg'),
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
                    '슈넬 치킨',
                    style: TextStyle(fontSize: 15, color: Color(0xFF292929)),
                  ),
                  Text(
                    '3500원',
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
