import 'package:flutter/material.dart';

import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';

import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/referral_large_screen.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/referral_mobile_screen.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ReferralLargeScreen(
        key: Key("large_screen"),
      ),
      mediumScreen: ReferralLargeScreen(
        key: Key("medium_screen"),
      ),
      smallScreen: ReferralMobileScreen(
        key: Key("mobile_screen"),
      ),
    );
  }
}
