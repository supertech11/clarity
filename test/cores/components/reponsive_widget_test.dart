import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';

void main() {
  late Widget widget1, widget2, widget3;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget1 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
              key: scaffoldKey,
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 519,
                      child: ResponsiveWidget(
                        smallScreen: Text("small"),
                        mediumScreen: Text("medium"),
                        largeScreen: Text("large"),
                      ),
                    ),
                  ],
                ),
              ));
        });
      },
    );

    widget2 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
              key: scaffoldKey,
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 899,
                      child: ResponsiveWidget(
                        smallScreen: Text("small"),
                        mediumScreen: Text("medium"),
                        largeScreen: Text("large"),
                      ),
                    ),
                  ],
                ),
              ));
        });
      },
    );

    widget3 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
              key: scaffoldKey,
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 1360,
                      child: ResponsiveWidget(
                        smallScreen: Text("small"),
                        mediumScreen: Text("medium"),
                        largeScreen: Text("large"),
                      ),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('ResponsiveWidget Widget Test', () {
    testWidgets(
        "Validate when screen is lesser than 520, small screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.text("small"), findsOneWidget);
      expect(find.text("medium"), findsNothing);
      expect(find.text("large"), findsNothing);
    });

    testWidgets(
        "Validate when screen is greater than 520 and lesser than 900, medium screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.text("small"), findsNothing);
      expect(find.text("medium"), findsOneWidget);
      expect(find.text("large"), findsNothing);
    });

    testWidgets(
        "Validate when screen is greater than 900, large screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget3);

      expect(find.text("small"), findsNothing);
      expect(find.text("medium"), findsNothing);
      expect(find.text("large"), findsOneWidget);
    });

    testWidgets(
        "Validate isSmallScreen returns true when width is lesser than 520",
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
                key: scaffoldKey,
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 510,
                        child: LayoutBuilder(builder: (context, constraints) {
                          bool isSmallscreen = ResponsiveWidget.isSmallScreen(
                              context,
                              constraints: constraints);
                          expect(isSmallscreen, true);
                          return Text("click");
                        }),
                      ),
                    ],
                  ),
                ));
          });
        },
      ));
    });

    testWidgets(
        "Validate isMediumScreen returns true when width is greater than 520 and lesser than 900",
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
                key: scaffoldKey,
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 899,
                        child: LayoutBuilder(builder: (context, constraints) {
                          bool isMediumScreen = ResponsiveWidget.isMediumScreen(
                              context,
                              constraints: constraints);
                          expect(isMediumScreen, true);
                          return Text("click");
                        }),
                      ),
                    ],
                  ),
                ));
          });
        },
      ));
    });

    testWidgets(
        "Validate isLargeScreen returns true when width is greater than 900",
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
                key: scaffoldKey,
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 980,
                        child: LayoutBuilder(builder: (context, constraints) {
                          bool isLargeScreen = ResponsiveWidget.isLargeScreen(
                              context,
                              constraints: constraints);
                          expect(isLargeScreen, true);
                          return Text("click");
                        }),
                      ),
                    ],
                  ),
                ));
          });
        },
      ));
    });
  });
}
