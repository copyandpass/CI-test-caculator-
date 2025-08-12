import 'package:flutter/material.dart'; 
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_caculator/main.dart';

void main() {
  testWidgets('Calculator UI Test', (WidgetTester tester) async {
    // 앱을 실행하고 위젯을 빌드합니다.
    await tester.pumpWidget(const MyApp());

    // '5' 버튼을 찾아서 탭합니다.
    await tester.tap(find.text('5'));
    await tester.pump();
    
    // 화면에 '5'가 표시되는지 확인합니다.
    expect(find.text('5'), findsOneWidget);

    // '+' 버튼을 찾아서 탭합니다.
    await tester.tap(find.text('+'));
    await tester.pump();
    
    // '3' 버튼을 찾아서 탭합니다.
    await tester.tap(find.text('3'));
    await tester.pump();
    
    // '=' 버튼을 찾아서 탭합니다.
    await tester.tap(find.text('='));
    await tester.pump();

    // 계산 결과인 '8'이 표시되는지 확인합니다.
    expect(find.text('8'), findsOneWidget);
  });
}