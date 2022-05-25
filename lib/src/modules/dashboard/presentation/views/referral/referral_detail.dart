import 'package:flutter/material.dart';

import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';

import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/referral_detail_large_screen.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/referral_detail_mobile_screen.dart';

class ReferralDetailScreen extends StatelessWidget {
  const ReferralDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ReferralDetailLargeScreen(
        key: Key("large_screen"),
      ),
      mediumScreen: ReferralDetailLargeScreen(
        key: Key("medium_screen"),
      ),
      smallScreen: ReferralDetailMobileScreen(
        key: Key("mobile_screen"),
      ),
    );
  }
}
