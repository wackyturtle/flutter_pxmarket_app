import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_pxmarket_app/widget/product.dart';

class ProductRegistPage extends StatefulWidget {
  @override
  _ProductRegistPageState createState() => _ProductRegistPageState();
}

class _ProductRegistPageState extends State<ProductRegistPage> {
  File? _selectedImage; // 선택한 이미지를 저장할 변수
  final TextEditingController controller_name =
      TextEditingController(); //입력 받을 상품 이름
  final TextEditingController controller_price =
      TextEditingController(); //입력 받을 상품 가격
  final TextEditingController controller_info =
      TextEditingController(); //입력 받을 상품 정보

  bool hasErrorName = false;
  bool hasErrorPrice = false;
  bool hasErrorInfo = false;
  bool hasErrorImage = false;

  Future<void> getImagePickerData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        hasErrorImage = false;
      });
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('입력 오류'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(fontWeight: FontWeight.bold)),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF3E5934), // 버튼 배경색
              foregroundColor: Colors.white, // 버튼 글자색
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('등록 완료'),
        content: Text('상품이 성공적으로 등록되었습니다'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 팝업 닫기

              final product = Product(
                productImage: _selectedImage!.toString(), // File → Image 변환
                productName: controller_name.text.trim(),
                productPrice: int.parse(controller_price.text.trim()),
                productInfo: controller_info.text.trim(),
              );

              Navigator.pop(context, product); // 이전 페이지로 Product 객체 전달
            },
            child: Text('확인', style: TextStyle(fontWeight: FontWeight.bold)),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF3E5934), // 버튼 배경색
              foregroundColor: Colors.white, // 버튼 글자색
            ),
          ),
        ],
      ),
    );
  }

  void handleSubmit() {
    final name = controller_name.text.trim();
    final price = controller_price.text.trim();
    final info = controller_info.text.trim();
    final isPriceValid = double.tryParse(price) != null;

    setState(() {
      hasErrorName = name.isEmpty;
      hasErrorPrice = price.isEmpty || !isPriceValid;
      hasErrorInfo = info.isEmpty;
      hasErrorImage = _selectedImage == null;
    });

    if (hasErrorImage || hasErrorName || hasErrorPrice || hasErrorInfo) {
      showErrorDialog("모든 항목을 올바르게 입력해주세요");
      return;
    }

    showSuccessDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9E2),
      appBar: AppBar(
        title: Text('상품 등록'),
        backgroundColor: Color(0xFF3E5934),
        foregroundColor: Colors.white,
        leading: IconButton(
          //뒤로가기버튼
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // 하얀 박스
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 360,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: getImagePickerData,
                          child: Container(
                            width: 320,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              border: hasErrorImage
                                  ? Border.all(color: Colors.red, width: 2)
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: _selectedImage != null
                                  ? Image.file(
                                      _selectedImage!,
                                      fit: BoxFit.cover,
                                      width: 320,
                                      height: 200,
                                    )
                                  : Center(
                                      child: Text(
                                        '이미지를 선택해주세요',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // 상품 이름
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: TextField(
                            controller: controller_name,
                            decoration: InputDecoration(
                              labelText: '상품 이름',
                              border: OutlineInputBorder(),
                              errorText: hasErrorName ? '상품 이름을 입력해주세요' : null,
                            ),
                          ),
                        ),

                        // 상품 가격
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: TextField(
                            controller: controller_price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: '상품 가격',
                              border: OutlineInputBorder(),
                              errorText: hasErrorPrice ? '숫자만 입력해주세요' : null,
                            ),
                          ),
                        ),

                        // 구분선
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: 200,
                            height: 5,
                            color: Color(0xFF3E5934),
                          ),
                        ),

                        // 상품 설명
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: TextField(
                            controller: controller_info,
                            keyboardType: TextInputType.multiline,
                            maxLines: null, // 줄바꿈 가능
                            decoration: InputDecoration(
                              labelText: '상세정보',
                              border: OutlineInputBorder(),
                              errorText: hasErrorInfo ? '상품 정보를 입력해주세요' : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 등록 버튼
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: handleSubmit,
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
