import 'package:airport_flutter/models/flight.dart';
import 'package:airport_flutter/models/flight_fav.dart';
import 'package:http/http.dart' as http;
import 'package:airport_flutter/utils/constants.dart';
import 'dart:async';
import 'dart:convert';

class Repository {
  final http.Client httpClient = http.Client();

  Repository();

  Future<List<Flight>> fetchFlights() async {
    final response = await httpClient.get(
      API_URL + "flights/",
      headers: {'authorization': basicAuthenticationHeader('admin', 'admin')},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawFlight) {
        return Flight(
            id: rawFlight['id'],
            destinationCity: rawFlight['destination_city'],
            startingCity: rawFlight['starting_city'],
            flightShortName: rawFlight['flight_short_name'],
            flightDate: DateTime.parse(rawFlight['flight_date'].toString()));
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }

  Future<List<Flight>> searchFlights(String searchTerm) async {
    final response = await httpClient.get(
      API_URL + "flights/?search=" + searchTerm,
      headers: {'authorization': basicAuthenticationHeader('admin', 'admin')},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawFlight) {
        return Flight(
            destinationCity: rawFlight['destination_city'],
            startingCity: rawFlight['starting_city'],
            flightShortName: rawFlight['flight_short_name'],
            flightDate: DateTime.parse(rawFlight['flight_date'].toString()));
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }

  Future<List<FlightFav>> fetchBookedFlights() async {
    final response = await httpClient.get(
      API_URL + "booked/",
      headers: {'authorization': basicAuthenticationHeader('admin', 'admin')},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawFavFlight) {
        return FlightFav(
            id: rawFavFlight['id'],
            flight: Flight(
              id: rawFavFlight['flight']['id'],
              destinationCity: rawFavFlight['flight']['destination_city'],
              startingCity: rawFavFlight['flight']['starting_city'],
              flightShortName: rawFavFlight['flight']['flight_short_name'],
              flightDate: DateTime.parse(rawFavFlight['flight']['flight_date'].toString()))
            );
            
      }).toList();
    } else {
      throw Exception('erjror fetching posts');
    }
  }


  Future<void> addFavs(int flightId) async {
    final response = await httpClient.post(
      API_URL + "create-book/",
      headers: {'authorization': basicAuthenticationHeader('admin', 'admin'), 'content-type': 'application/json'},
      body:  json.encode({"flight":flightId})
    );
    if (response.statusCode == 201) {
      print("send");
    } else {
      print(response.reasonPhrase);
      throw Exception('error fetching posts');
    }
  }

  String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }
}
