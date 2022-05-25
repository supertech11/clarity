import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/app_drawer_item.dart';

class SampleLayer extends StatefulWidget {
  final Widget child;
  const SampleLayer({Key? key, required this.child}) : super(key: key);

  @override
  _SampleLayerState createState() => _SampleLayerState();
}

class _SampleLayerState extends State<SampleLayer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.put(MenuController(vsync: this));
    return Container(
      child: widget.child,
    );
  }
}

void main() {
  late Widget widget1;
  setUp(() {
    widget1 = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(

            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: SampleLayer(
              child: AppDrawerItem(
                label: StringConfig.text.home,
                routeName: RouteConstants.homePageRoute,
                iconUrl: AppImageAssets.home,
                onTap: () {},
              ),
            ),
          );
        });
      },
    );
  });

  group('AppDrawerItem Widget Test', () {
    testWidgets("Validate visibility of AppDrawerItem components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("icon_url")), findsOneWidget);
      expect(find.byKey(Key("label")), findsOneWidget);
    });
  });
}
