import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/loginPage.dart';

import 'package:flutter_app/providers/loginProvider.dart';
import 'package:provider/provider.dart';

void main() {
  var app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider()),
    ],
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
