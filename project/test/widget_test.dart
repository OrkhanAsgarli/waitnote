import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
    await tester.pumpWidget(const WaitNoteApp());

    expect(find.byType(WaitNoteApp), findsOneWidget);
  });
}