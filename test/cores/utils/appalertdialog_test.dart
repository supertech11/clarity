import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/utils/appalertdialog.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          // settings: RouteSettings(
          //     arguments: {"user": User()}), // Your Argument here),
          builder: (context) {
            return Scaffold(
              body: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppAlertDialog.showCustomDialog(context, "message");
                    },
                    child: Text("open dialog"),
                    key: Key("openDialog"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AppAlertDialog.showWhiteOverlayDialog(context);
                    },
                    child: Text("Open OverlayDialog"),
                    key: Key("openOverlayDialog"),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  });

  group('Alert dialog Widget Test', () {
    testWidgets("Validate dialog shows loader and specified message on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byKey(Key("openDialog")));
      await tester.pump();

      expect(find.byKey(Key("loader")), findsOneWidget);

      expect(find.text("message"), findsOneWidget);
    });

    testWidgets("Validate OverlayDialog shows loader on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byKey(Key("openOverlayDialog")));
      await tester.pump();

      expect(find.byKey(Key("loader")), findsOneWidget);
    });
  });
}
