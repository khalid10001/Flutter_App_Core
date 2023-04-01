import 'package:flutter/material.dart';

import '../../models/facility.dart';
import '../../services/facilities_api.dart';
import '../../utils/global.colors.dart';

class FacilityBooking extends StatefulWidget {
  final Facility facility;
  const FacilityBooking(this.facility, {Key? key}) : super(key: key);

  @override
  State<FacilityBooking> createState() => _FacilityBookingState();
}

class _FacilityBookingState extends State<FacilityBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors().purple,
        title: const Text('Facility Booking'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(widget.facility.name),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: GlobalColors().purple,
              ),
              onPressed: () async {
                var response = await FacilitiesApi().bookFacility(
                    2, 2, "2023-04-07T14:00:00", "2023-04-07T16:00:00");
                print(response);
              },
              child: const Text("Book"))
        ],
      )),
    );
  }
}
