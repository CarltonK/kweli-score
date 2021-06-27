import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kweliscore/main.dart';

void main() {
  testWidgets('Basic Material App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    var baseScaffold = find.byType(MaterialApp);
    expect(baseScaffold, findsOneWidget);
  });
}
