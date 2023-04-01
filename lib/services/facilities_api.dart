import 'dart:convert';

import 'package:flutter_app/models/facility.dart';
import 'package:http/http.dart' as http;

import '../utils/constants/api_constants.dart';

class FacilitiesApi {
  bookFacility(facilityId, userId, startTime, endTime) async {
    var body = jsonEncode(<String, dynamic>{
      "user_id": 3,
      "start_time": startTime,
      "end_time": endTime,
    });
    var response = await http.post(
        Uri.parse(
            '${APIConstants.BASE_API_URL}/facilities/$facilityId/reservations'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: body);
    if (response.statusCode == 201) {
      return "Reservation created successfully";
    } else {
      throw Exception('Failed to book facility');
    }
  }

  Future<List<Facility>> getFacilities() async {
    var response =
        await http.get(Uri.parse('${APIConstants.BASE_API_URL}/facilities'));
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);

      List<Facility> facilities = [];

      for (var item in responseJson["data"]) {
        Facility facility = Facility.fromJson(item);
        facilities.add(facility);
      }
      print(facilities);

      return facilities;
    } else {
      throw Exception('Failed');
    }
  }
}
