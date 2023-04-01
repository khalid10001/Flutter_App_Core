// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/facilities_provider.dart';

import 'package:flutter_app/providers/login_provider.dart';
import 'package:flutter_app/ui/login/login_page.dart';

import 'package:provider/provider.dart';

void main() {
  var app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => FacilitiesProvider()),
    ],
    child: const MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        home: LoginPage()), //HomePage (that contains bottom nav)
  );
  runApp(app);
}
