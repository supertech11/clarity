import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

AppBar mobileAppBar({required AppBar appBar}) => kIsWeb
    ? AppBar(
        backgroundColor: Pallet.white,
        elevation: 0,
      )
    : appBar;
