import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/controller/maplogic.dart';

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  late GoogleMapController mapController;
  BitmapDescriptor customicon = BitmapDescriptor.defaultMarker;
  LatLng currentPosition = const LatLng(36.1904, 44.0096);
  int index = 0;
  double distanceToCustomer = 0.0;
  String cityname = '';
  Timer? movementTimer;

  final List<LatLng> routes = [
    const LatLng(36.1904, 44.0096),
    const LatLng(36.1994, 44.0206),
  ];

  Set<Polyline> polylines = {};
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentPosition = routes.first;
    loadIcon();
    _getRoutes(routes.first, routes.last);
  }

  @override
  void dispose() {
    movementTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location services are disabled")),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location permissions are denied")),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Location permissions are permanently denied"),
          ),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final latLng = LatLng(position.latitude, position.longitude);

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 14),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error fetching location: $e")));
    }
  }

  Future<void> _getRoutes(LatLng start, LatLng end) async {
    try {
      final routePoints = await Networkhelper().getData(start, end);
      if (routePoints.isNotEmpty) {
        setState(() {
          polylines.clear();
          polylines.add(
            Polyline(
              color: Colors.blue,
              width: 8,
              polylineId: const PolylineId("routes"),
              points: routePoints,
            ),
          );
        });

        _startMoving(routePoints);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("No route found")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error fetching route: $e")));
    }
  }

  void _startMoving(List<LatLng> routePoints) {
    movementTimer?.cancel();
    index = 0;

    movementTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (index < routePoints.length - 1) {
          index++;
          currentPosition = routePoints[index];

          distanceToCustomer =
              Geolocator.distanceBetween(
                currentPosition.latitude,
                currentPosition.longitude,
                routes.last.latitude,
                routes.last.longitude,
              ) /
              1000; // Convert to km

          mapController.animateCamera(CameraUpdate.newLatLng(currentPosition));
        } else {
          timer.cancel();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Reached destination!")));
        }
      });
    });
  }

  Future<void> searchCityByName(String cityName) async {
    if (cityName.isEmpty) return;

    final url =
        'https://nominatim.openstreetmap.org/search?q=$cityName&format=json&limit=1';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          final firstResult = data[0];
          final latitude = double.parse(firstResult['lat']);
          final longitude = double.parse(firstResult['lon']);
          final cityLocation = LatLng(latitude, longitude);

          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: cityLocation, zoom: 14),
            ),
          );

          // _getRoutes(currentPosition, cityLocation);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("City not found")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to search for city")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Search error: $e")));
    }
  }

  Future<void> loadIcon() async {
    try {
      customicon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(100, 100)),
        "assets/car.png",
      );
      setState(() {});
    } catch (e) {
      debugPrint("Error loading icon: $e");
      // Fallback to default marker if custom icon fails
      customicon = BitmapDescriptor.defaultMarker;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.my_location_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: routes.first,
              zoom: 14,
            ),
            onMapCreated: (controller) => mapController = controller,
            mapType: MapType.terrain,
            markers: _createMarkers(),
            polylines: polylines,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  hintText: "Search for a city",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: (value) => cityname = value,
                onSubmitted: (value) => searchCityByName(value),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                "Distance: ${distanceToCustomer.toStringAsFixed(2)} km",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 80,
            child: FloatingActionButton(
              onPressed: () => searchCityByName(cityname),
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: const MarkerId("destination"),
        position: routes.last,
        infoWindow: const InfoWindow(title: "Destination"),
      ),
      Marker(
        icon: customicon,
        markerId: const MarkerId("vehicle"),
        position: currentPosition,
        infoWindow: InfoWindow(
          title: "Delivery Vehicle",
          snippet: "${distanceToCustomer.toStringAsFixed(2)} km to destination",
        ),
      ),
    };
  }
}
