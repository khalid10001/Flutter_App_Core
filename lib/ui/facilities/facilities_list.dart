// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/facility.dart';
import 'package:flutter_app/providers/facilities_provider.dart';
import 'package:flutter_app/ui/facilities/facilities_page.dart';
import 'package:flutter_app/ui/facilities/facility_booking.dart';
import 'package:flutter_app/ui/shared/loading_widget.dart';
import 'package:flutter_app/utils/global.colors.dart';
import 'package:provider/provider.dart';

class FacilitiesList extends StatelessWidget {
  const FacilitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FacilitiesProvider>(context);
    var facilities = provider.facilities;
    if (provider.state == FacilityState.initial) {
      provider.getFacilities();
      return const Scaffold(
          backgroundColor: Color(0xFFFFE0B2),
          body: Center(child: loadingWidget()));
    } else if (provider.state == FacilityState.failed) {
      return const Center(
        child: Text('Failed'),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xFFFFE0B2),
        body: Column(
          children: [
            const OurOffice(),
            FacilitiesListItem(facilities),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: const SizedBox(
          height: 80,
        ),
      );
    }
  }
}

class OurOffice extends StatelessWidget {
  const OurOffice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Our Offices',
              style: TextStyle(
                  color: GlobalColors().purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          const SizedBox(
            width: 120,
          ),
          Consumer<FacilitiesProvider>(builder: (context, state, _) {
            return Text("${state.facilities.length} Office",
                style: TextStyle(color: GlobalColors().purple, fontSize: 12));
          }),
        ],
      ),
    );
  }
}

class FacilitiesListItem extends StatelessWidget {
  final List<Facility> facilities;
  const FacilitiesListItem(this.facilities, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: facilities.length,
          itemBuilder: (BuildContext context, int index) {
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
                          child: Image.network(
                            facilities[index].photos[0],
                          ),
                        ),
                        ListTile(
                          title: Text(facilities[index].name,
                              style: TextStyle(
                                color: GlobalColors().purple,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                facilities[index].capacity,
                                style: TextStyle(
                                    color: GlobalColors().purple, fontSize: 10),
                              ),
                              Container(
                                width: 65,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 165, 214, 167),
                                ),
                                child: const Text(
                                  'Available',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: GlobalColors().purple,
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FacilityBooking(facilities[index])));
                            },
                            child: const Text("Book"))
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
