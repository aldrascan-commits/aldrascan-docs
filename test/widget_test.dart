import 'package:flutter_test/flutter_test.dart';
import 'package:dental_catalog/main.dart';

void main() {
  testWidgets('AldraScan app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AldraScanApp());
    expect(find.text('AldraScan'), findsOneWidget);
  });
}
