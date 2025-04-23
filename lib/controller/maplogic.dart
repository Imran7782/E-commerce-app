import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Future<List<LatLng>> getData(LatLng start, LatLng end) async {
    final url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}'
        '?overview=full&geometries=geojson';
   List<LatLng> routePoints=[];

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final coordinates = data['routes'][0]['geometry']['coordinates'];

         routePoints =
            coordinates.map<LatLng>((coord) {
              return LatLng(
                coord[1],
                coord[0],
              ); //OSM USE Lon,lat we need swap them
            }).toList();

       
      }

    } on Exception catch (e) {
      print("erro occured during fetching the data$e");
    }
     return routePoints ;
  }
}
