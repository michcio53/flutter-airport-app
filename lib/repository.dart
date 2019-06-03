
import 'package:airport_flutter/models/flight.dart';
import 'package:http/http.dart' as http;
import 'package:airport_flutter/utils/constants.dart';
import 'dart:async';
import 'dart:convert';

class Repository {

  final http.Client httpClient = http.Client();


  Repository();
 

  Future<List<Flight>> fetchFlights() async {
    final response = await httpClient.get(API_URL + "flights/", headers: {'authorization': basicAuthenticationHeader('admin', 'admin')},);
    if(response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawFlight) {
        return Flight(
          destinationCity: rawFlight['destination_city'],
          startingCity: rawFlight['starting_city'],
          flightShortName: rawFlight['flight_short_name'],
          flightDate: DateTime.parse(rawFlight['flight_date'].toString())
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }

  String basicAuthenticationHeader(String username, String password) {
  return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
}
}