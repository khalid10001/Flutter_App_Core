// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_app/providers/facilities_provider.dart';

import '../../utils/global.colors.dart';
import 'facilities_list.dart';

class FacilitiesHeader extends StatelessWidget {
  const FacilitiesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leadingWidth: 80,
        titleSpacing: 10,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepOrangeAccent,
              child: Image.asset(
                'images/boy.png',
                fit: BoxFit.cover,
                width: 58,
                height: 58,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                    color: GlobalColors().purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text('Fawaz Fawzy',
                    style: TextStyle(
                        color: GlobalColors().purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              )
            ],
          ),
        ),
      ),
      body: const FacilitiesList(),
    );
  }
}
