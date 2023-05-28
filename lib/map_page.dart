import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'test.dart'; // test.dart 파일을 import합니다.

class mappage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const mappage({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<mappage> createState() => MapSampleState();
}

class MapSampleState extends State<mappage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  LocationData? _currentLocation;
  Location location = Location();
  bool showStamp = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      _currentLocation = _locationData;
    });

    // Check if the distance is less than 100 meters
    if (_currentLocation != null &&
        Geolocator.distanceBetween(
            widget.latitude,
            widget.longitude,
            _currentLocation!.latitude!,
            _currentLocation!.longitude!) <
            10000) {
      _showConfirmationDialog();
    }
  }

  Future<void> _showConfirmationDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('확인 되었습니다!'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  showStamp = true;
                });
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );

    CameraPosition currentCameraPosition = _currentLocation != null
        ? CameraPosition(
      target: LatLng(
          _currentLocation!.latitude!, _currentLocation!.longitude!),
      zoom: 14.4746,
    )
        : initialCameraPosition;

    double distance = _currentLocation != null
        ? Geolocator.distanceBetween(
      widget.latitude,
      widget.longitude,
      _currentLocation!.latitude!,
      _currentLocation!.longitude!,
    )
        : 0;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true, // Show the current location button on the map
          ),
          if (showStamp)
            Center(
              child: Image.asset(
                'images/place1.jpg', // Replace with the actual path to your image
                width: 500,
                height: 500,
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              _goToPosition(initialCameraPosition);
            },
            label: const Text('초기 위치'),
            icon: Icon(Icons.location_on),
            heroTag: null,
          ),
          SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              _goToPosition(currentCameraPosition);
            },
            label: const Text('현재 위치'),
            icon: Icon(Icons.my_location),
            heroTag: null,
          ),
          SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              // Navigate to the test page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestPage()),
              );
            },
            label: const Text('테스트 페이지로 이동'),
            icon: Icon(Icons.navigate_next),
            heroTag: null,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              '현재 위치로부터의 거리: ${distance.toStringAsFixed(2)} 미터',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _goToPosition(CameraPosition cameraPosition) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
