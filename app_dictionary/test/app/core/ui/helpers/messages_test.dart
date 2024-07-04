import 'package:app_dictionary/app/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test show messages', () {
    Future<void> testSnackBar(
      WidgetTester tester,
      String message,
      IconData icon,
      void Function(String, BuildContext) showMessage,
      Key testKey,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  key: testKey,
                  onPressed: () => showMessage(message, context),
                  child: const Text('Show SnackBar'),
                );
              },
            ),
          ),
        ),
      );

      // Verify that the button exists
      expect(find.byKey(testKey), findsOneWidget);

      // Tap the button and trigger a frame
      await tester.tap(find.byKey(testKey));
      await tester.pump();

      // Verify that the CustomSnackBar is shown
      expect(find.text(message), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
    }

    testWidgets('showError displays error snack bar',
        (WidgetTester tester) async {
      await testSnackBar(
        tester,
        'Error message',
        Icons.error_outline,
        Messages.showError,
        const Key('showErrorTestKey'),
      );
    });

    testWidgets('showInfo displays info snack bar',
        (WidgetTester tester) async {
      await testSnackBar(
        tester,
        'Info message',
        Icons.sentiment_neutral,
        Messages.showInfo,
        const Key('showInfoTestKey'),
      );
    });

    testWidgets('showSuccess displays success snack bar',
        (WidgetTester tester) async {
      await testSnackBar(
        tester,
        'Success message',
        Icons.sentiment_very_satisfied,
        Messages.showSuccess,
        const Key('showSuccessTestKey'),
      );
    });
  });
}
