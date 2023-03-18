import 'package:flutter/material.dart';
import 'package:flutter_app/providers/FacilitiesProvider.dart';

import 'FacilitiesListItem.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

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
            children: const [
              Text(
                'Welcome!',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Text('Khalid Abdu',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              )
            ],
          ),
        ),
      ),
      body: const FacilitiesListItem(),
    );
  }
}
