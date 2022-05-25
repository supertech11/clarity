import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/components/circular_avatar_with_name.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          // settings: RouteSettings(
          //     arguments: {"user": User()}), // Your Argument here),
          builder: (context) {
            return CircularImageWithName(
                firstName: "Oluwatosin", lastName: "Idowu", radius: 20);
          },
        );
      },
    );
  });

  group('CircularImageWithName Widget Test', () {
    testWidgets(
        "Validate widget extract and display the initials from the firstname and lastname",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      // await tester.pumpAndSettle();

      expect(find.text("OI"), findsNWidgets(1));
    });
  });
}
