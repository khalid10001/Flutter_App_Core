// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/global.colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

class loadingWidget extends StatelessWidget {
  const loadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [GlobalColors().purple],
      ),
    );
  }
}
