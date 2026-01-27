// Basic smoke test for ExtinCheck app

import 'package:flutter_test/flutter_test.dart';
import 'package:extincheck/main.dart';

void main() {
  testWidgets('ExtinCheck app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ExtinCheckApp());
    
    // Verify app builds without errors
    expect(find.byType(ExtinCheckApp), findsOneWidget);
  });
}
