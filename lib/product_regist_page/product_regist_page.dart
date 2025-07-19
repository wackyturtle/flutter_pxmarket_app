import 'package:flutter/material.dart';

class ProductRegistPage extends StatefulWidget {
  @override
  _ProductRegistPageState createState() => _ProductRegistPageState();
}

class _ProductRegistPageState extends State<ProductRegistPage> {
  bool _imageSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9E2),
      appBar: AppBar(
        title: Text('상품 등록'),
        backgroundColor: Color(0xFF3E5934),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // 하얀 컨테이너
                    Container(
                      width: 360,
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    // 회색 컨테이너 (겹쳐서 보임)
                    Positioned(
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          print('이미지가 선택 되었습니다');
                          setState(() {
                            _imageSelected = !_imageSelected;
                          });
                        },
                        child: Container(
                          width: 320,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: _imageSelected
                                ? Image.asset(
                                    'assets/images/test.png',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Text(
                                    '이미지를 선택해주세요',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 등록 버튼
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print('등록 되었습니다');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3E5934),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('등록하기', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
