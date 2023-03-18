import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../providers/FacilitiesProvider.dart';

class FacilitiesListItem extends StatefulWidget {
  const FacilitiesListItem({Key? key}) : super(key: key);

  @override
  State<FacilitiesListItem> createState() => _FacilitiesListItemState();
}

class _FacilitiesListItemState extends State<FacilitiesListItem> {
  @override
  Widget build(BuildContext context) {
    var rooms = FacilitiesProvider().getFacilities();
    return Scaffold(
      backgroundColor: const Color(0xFFFFE0B2),
      body: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: const [
                    Text('Our Offices',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                    SizedBox(
                      width: 120,
                    ),
                    Text('16 Office',
                        style: TextStyle(color: Colors.purple, fontSize: 12)),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              rooms[index].url,
                            ),
                          ),
                          ListTile(
                            title: Text(rooms[index].name,
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                              rooms[index].description,
                              style: const TextStyle(
                                  color: Colors.purple, fontSize: 10),
                            ),
                            trailing: Container(
                              width: 65,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 165, 214, 167),
                              ),
                              child: const Text(
                                "Available",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              );
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(50),
                boxShadow: null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      Feedback.forTap(context);
                      Colors.orange;
                    });
                  },
                  icon: const Icon(
                    Icons.timer,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      HapticFeedback.lightImpact();
                    });
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      HapticFeedback.lightImpact();
                    });
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
