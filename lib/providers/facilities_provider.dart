// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/facilities_api.dart';

import '../models/facility.dart';

enum FacilityState { initial, loading, failed, succeeded }

class FacilitiesProvider extends ChangeNotifier {
  FacilityState state = FacilityState.initial;
  List<Facility> facilities = [];
  FacilitiesProvider._privateConstructor();
  static final FacilitiesProvider facilitiesProvider =
      FacilitiesProvider._privateConstructor();
  factory FacilitiesProvider() {
    return facilitiesProvider;
  }
  getFacilities() async {
    state = FacilityState.loading;
    notifyListeners();
    facilities = await FacilitiesApi().getFacilities();
    // var response = facilities = await FacilitiesApi()
    //     .bookFacility(2, 2, "2023-04-07T14:00:00", "2023-04-07T16:00:00");
    // print(response);
    state = FacilityState.succeeded;
    notifyListeners();
  }
}
