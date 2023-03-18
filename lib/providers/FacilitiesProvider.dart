// ignore_for_file: avoid_print

import '../models/Facility.dart';

class FacilitiesProvider {
  getFacilities() {
    Future.delayed(const Duration(seconds: 3), () {
      print('3 seconds passed');
    });

    List<Facility> rooms = [];

    for (int i = 0; i < 10; i++) {
      rooms.add(
          Facility('images/office.jpg', 'The Training Hall', 'Office Type'));
      rooms.add(
          Facility('images/office.jpg', 'The Training Hall', 'Office Type'));
      rooms.add(
          Facility('images/office.jpg', 'The Training Hall', 'Office Type'));
      rooms.add(
          Facility('images/office.jpg', 'The Training Hall', 'Office Type'));
      rooms.add(
          Facility('images/office.jpg', 'The Training Hall', 'Office Type'));
      return rooms;
    }
  }
}
