import 'package:analog_clock_light_dark_theme/widgets/appBar.dart';
import 'package:analog_clock_light_dark_theme/widgets/body.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
}
