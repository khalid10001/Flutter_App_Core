// ignore_for_file: file_names, unused_import, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/facilities/facilities_header.dart';
import 'package:flutter_app/ui/facilities/facilities_page.dart';
import 'package:flutter_app/ui/profile/profile.dart';

import 'package:flutter_app/utils/global.colors.dart';

import '../setting/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const FacilitiesPage(),
    const Profile(),
    const Setting()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const FacilitiesPage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: BottomAppBar(
            shape: AutomaticNotchedShape(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            color: GlobalColors().purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  padding: const EdgeInsets.all(15),
                  splashRadius: 20,
                  hoverColor: GlobalColors().orange,
                  iconSize: 20,
                  icon: const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = const FacilitiesPage();
                      currentTab = 0;
                    });
                  },
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 20,
                  hoverColor: GlobalColors().orange,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = const Profile();
                      currentTab = 1;
                    });
                  },
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 20,
                  hoverColor: GlobalColors().orange,
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = const Setting();
                      currentTab = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
