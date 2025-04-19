import 'package:flutter_test/flutter_test.dart';
import 'package:harmoniq/main.dart';

void main() {
  testWidgets('App boots without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MyApp), findsOneWidget);
  });
}
