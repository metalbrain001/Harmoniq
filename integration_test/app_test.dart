import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:harmoniq/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Launch Tests Succeed', () {
    testWidgets('App boots and shows login screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Expect Login UI to load
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Create an account'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsWidgets);
    });
  });
}
