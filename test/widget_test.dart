import 'package:flutter_test/flutter_test.dart';

import 'package:appsdev/main.dart';

void main() {
  testWidgets('Portfolio renders headline', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();
    expect(find.textContaining('Flutter Developer'), findsWidgets);
  });
}
