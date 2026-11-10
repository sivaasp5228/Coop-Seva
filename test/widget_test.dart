import 'package:flutter_test/flutter_test.dart';
import 'package:demo_ui/app.dart';

void main() {
  testWidgets('Demo UI loads', (WidgetTester tester) async {
    await tester.pumpWidget(const DemoUIApp());

    expect(
      find.text('SIH26089 – SAHAAYAK'),
      findsOneWidget,
    );

    expect(
      find.text('Popular Services'),
      findsOneWidget,
    );
  });
}