import 'package:flutter/material.dart';
import 'package:flutter_app/ui/facilities/facilities_header.dart';

void main() {
  runApp(const FacilitiesPage());
}

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FacilitiesHeader(),
    );
  }
}
