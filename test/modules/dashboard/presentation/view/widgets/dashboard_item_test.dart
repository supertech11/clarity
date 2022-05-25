import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/dashboard_item.dart';

void main() {
  late Widget widget1;
  setUp(() {
    widget1 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: DashboardItem(
              title: "Surveys",
              subTitle: "Filling out the survey",
              bgColor: Pallet.primary,
              titleColor: Pallet.white,
              image: AppImageAssets.survey_bg,
              icon: AppImageAssets.survey_icon,
            ),
          );
        });
      },
    );
  });

  group('DashboardItem Widget Test', () {
    testWidgets("Validate visibility of DashboardItem  components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("icon")), findsOneWidget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("subtitle")), findsOneWidget);
    });
  });
}
