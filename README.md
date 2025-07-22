<h1 align=center>🪖 PX Market App 🛒 </h1>
<div align="center">
  <img width="490" height="254" alt="스크린샷 2025-07-22 23 38 32" src="https://github.com/user-attachments/assets/1316d855-49b1-4c18-ad86-79e020656af3" />
</div>
<h3 align=center> [ Flutter 기초 ] 팀 프로젝트 - 쇼핑몰 플랫폼 </h3>
<p align=center>프로젝트 기간 : 25/07/17 ~ 25/07/23</p>
<br><br><br>

## 👨‍👩‍👧‍👦 3분대 🇰🇷조민우 분대🇰🇷

| 이름   | 역할                                              | GitHub / Contact   |
|--------|---------------------------------------------------|--------------------|
| 조민우 | 팀장, 상품 목록 페이지 구성, 발표                 | @wackyturtle       |
| 유수현 | 상품 상세 페이지 구성, 발표 자료 제작             | @su-vely           |
| 윤한조 | 상품 등록 페이지 구성, ReadMe                     | @yunhanjo          |
| 동세진 | 장바구니 페이지 구성, 시연 영상 제작              | @HaeAhn00          |
| 공통 | SA 작성, 담당 UI 디자인, 스크럼 일지 정리, QnA 정리 등 |                    |

<br>

## 📂 프로젝트 바로가기 링크  
👊 Notion :  
https://www.notion.so/teamsparta/3-2292dc3ef51481f78278d05644de5569

👊 Figma :  
https://www.figma.com/design/cHLJc3lDYGpLKZ0A4eqj3Y/%EC%A3%BC%ED%8A%B9%EA%B8%B0-%EA%B8%B0%EC%B4%88_3%EC%A1%B0?node-id=0-1

👊 GitHub :  
https://github.com/wackyturtle/flutter_pxmarket_app  

👊 YouTube :  
https://www.youtube.com/watch?v=h_aDIZ1Qcy4  

<br>

## 📌 프로젝트 개요
<br>

💡 **군부대 내에서만 판매되던 PX 상품을 일반인도 온라인으로 구매할 수 있도록 만든 쇼핑몰 앱**

- 군인들은 PX 상품 정보를 알기 위해 직접 방문해야 하므로 비효율적인 구매 경험이 발생합니다.  
- 전역 후에도 PX 상품을 구매하고 싶어하는 일반인의 수요는 존재하지만, 민간인을 위한 플랫폼은 부재한 상황입니다.  
- 이에 착안해, PX 상품을 누구나 온라인에서 쉽게 구매할 수 있는 플랫폼을 만들고자 본 프로젝트를 기획했습니다.  
<br>

🎯 **목표**
- 군 장병과 일반 사용자 모두가 접근 가능한 PX 마켓 앱 개발
- 상품 정보, 구매 기능, UI 흐름을 실제 쇼핑몰처럼 구현
- UX 편의성을 고려해 간결하고 직관적인 UI 구성
<br>

## 🚀 프로젝트 기능
💼 **상품 목록 페이지**
- 등록된 상품들을 카드형 UI로 시각화  
- 상품 이미지, 이름, 가격이 한눈에 확인 가능하도록 구성  
- 깔끔하고 직관적인 UX를 위한 UI 설계 적용  

📝 **상품 등록 페이지**
- 관리자가 상품명, 가격, 이미지, 설명을 입력하여 상품 등록 가능  
- 별도의 서버 없이 앱 내에서 바로 테스트 가능  
- Flutter의 폼 필드 처리 및 상태관리 경험 강화  

🔍 **상품 상세 페이지**
- 상품 클릭 시 상세 이미지 및 설명 제공  
- 구매 수량 조절 기능(1~99 제한)을 통해 입력 오류 방지  
- 총 가격 자동 계산 기능 구현  

🛒 **장바구니 페이지**
- 다수의 상품을 담고 수량 변경 / 삭제 가능  
- 전체 금액이 실시간으로 계산되어 표시됨  
- 하단 고정 구매 버튼을 통해 UX 편의성 강화
<br>
  
## 📚 개발 목적 및 기술 학습
- 상태 관리와 위젯 트리를 고려한 화면 구성 방법 학습  
- `Navigator`를 활용한 페이지 이동과 앱 흐름 설계  
- 사용자 인터랙션에 따른 이벤트 처리와 데이터 흐름 이해  
- 수량 제한, 잘못된 입력 방지 등 UX 관점에서의 예외 처리 경험
<br>

## 🧠 고민한 점
- 적절한 위젯 분리와 상태관리 구조 설계
- 입력값 검증 및 UX 오류 최소화
- 장바구니, 상세 페이지 등에서 실시간 반영 처리
- 기초적인 아키텍처 설계와 리팩토링 시점 판단
<br>

## 🛠 Technologies & 💻 Development Tools
- Flutter
- Dart
- Visual Studio Code – 전체 프로젝트 개발 IDE  
- iOS Simulator / Android Emulator – 기능 테스트 및 UI 시뮬레이션  
- Figma – UI/UX 화면 설계 및 와이어프레임 제작  
- GitHub – 형상 관리 및 협업
<br>

## 🚨 Trouble Shooting

#### 1. 이미지 로딩 오류 및 레이아웃 깨짐
**문제점**  
- `Image.file()` 사용 시 이미지 크기 조절이 되지 않아 레이아웃이 깨짐  
- 이미지 로딩이 느리거나 실패 시 화면이 어색하게 표현됨

**해결 방법**  
- `FadeInImage`나 `BoxDecoration`을 사용하여 이미지 영역을 고정  
- `MediaQuery`를 통해 화면 크기에 맞게 자동 조절
- `BoxFit.cover`를 통해 영역을 꽉 채움
<br>

#### 2. 가격에 콤마(₩ 15000 → ₩ 15,000) 미표시
**문제점**
- 숫자 그대로 출력되어 가독성이 떨어짐

**해결 방법**
- intl 패키지를 pubspec.yaml에 추가
- NumberFormat을 사용하여 숫자에 자동으로 콤마 적용
<br>

#### 3. Hex 색상 코드 사용 오류
**문제점**
- '#3E5934' 형태로 색상 적용 시 오류 발생

**해결 방법**
- Flutter에서는 16진수 색상을 Color(0xFF3E5934) 형태로 사용해야 함
- 앞의 FF는 불투명도(Opacity) 100%를 의미
<br>

#### 4. 반복문으로 위젯 나열 시 Dart 문법 오류
**문제점**
- for 문에 중괄호를 사용할 경우 위젯 트리 내에서 오류 발생

**해결 방법**
- 중괄호 없이 collection for 문법 사용
- 예: children 리스트 내에서 for (int i = 0; i < 10; i++) rowSeat(i)
<br>

#### 5. 객체 전달 시 정의되지 않은 오류 발생
**문제점**
- import 및 정의는 되어 있음에도 객체를 인식하지 못하는 오류 발생

**해결 방법**
- 캐시 문제로 추정됨
- VSCode 재시작 후 flutter clean → flutter pub get 실행하여 해결
<br>

#### 6. GridView 사용 시 오버플로우 발생
**문제점**
- GridView 내부 컬럼이 텍스트를 전부 포함하지 못해 오버플로우 발생
- childAspectRatio 기본값이 1.0으로 고정되어 있음

**해결 방법**
- childAspectRatio 값을 조정하여 텍스트 공간 확보
- 예: 0.6 또는 0.7로 설정하여 세로 공간 확보
<br>

#### 7. 윈도우 환경에서 에뮬레이터 실행 오류
**문제점**
- 에뮬레이터 실행 중 멈추거나 종료됨

**해결 방법**
- 안드로이드 스튜디오 Device Manager에서 Wipe Data 또는 AVD 재생성
- 터미널에서 flutter clean → flutter pub get → flutter run 실행
- Android SDK와 Emulator 최신 버전 업데이트
- 가능하다면 macOS에서 개발하는 것이 가장 안정적임
<br>

#### 8. 이미지 피커 라이브러리 설치 및 iOS 권한 누락
**문제점**
- 이미지 선택 시 아무 반응 없음 (특히 iOS에서)

**해결 방법**
- image_picker 패키지를 설치하고 flutter pub get 실행
- Dart 파일 상단에 import 'package:image_picker/image_picker.dart'; 선언
- iOS의 Info.plist 파일에 NSPhotoLibraryUsageDescription 권한 추가
<br>

#### 9. pubspec.yaml 의존성 오류
**문제점**
- A dependency may only have one source 오류 발생
- 의존성 추가 시 잘못된 들여쓰기나 구조로 인해 발생

**해결 방법**
- flutter: sdk: flutter 아래에 다른 의존성 포함 금지
- 모든 의존성은 flutter 블록과 같은 레벨에 배치
- 들여쓰기는 탭이 아닌 스페이스 2칸으로 맞추기





