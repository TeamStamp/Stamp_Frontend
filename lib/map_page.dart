import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stamp_front/repository/map_repository.dart';

class mappage extends StatefulWidget {
  final double latitude;
  final double longitude;
  final int plcId;

  const mappage({Key? key, required this.latitude, required this.longitude, required this.plcId})
      : super(key: key);

  @override
  State<mappage> createState() => MapSampleState();
}

class MapSampleState extends State<mappage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  LocationData? _currentLocation;
  Location location = Location();
  final MapRepository mapRepository = MapRepository();

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
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _showError() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('경양카츠와의 거리가 100m 이내여야 합니다!'),
          actions: [
            TextButton(
              onPressed: () {
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
      target: LatLng(37.32138, 127.10955),
      zoom: 22,
    );
    CameraPosition markCameraPosition = CameraPosition(
      target: LatLng(37.32166, 127.11015),
      zoom: 18,
    );

    CameraPosition currentCameraPosition = _currentLocation != null
        ? CameraPosition(
      target: LatLng(
          _currentLocation!.latitude!, _currentLocation!.longitude!),
      zoom: 20,
    )
        : initialCameraPosition;

    double distance = _currentLocation != null
        ? Geolocator.distanceBetween(
      37.32138,
      127.10955,
      _currentLocation!.latitude!,
      _currentLocation!.longitude!,
    )
        : 0;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: markCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
            markers: Set<Marker>.from([
              Marker(
                markerId: MarkerId('경양카츠'),
                position: LatLng(37.32138,127.10955),
                icon: BitmapDescriptor.defaultMarker, // You can customize the marker icon if needed
              ),
            ]), // Show the current location button on the map
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              _goToPosition(initialCameraPosition);
            },
            label: const Text('경양카츠'),
            icon: Icon(Icons.location_on),
            backgroundColor: Color(0xFFF6BC53),
            foregroundColor: Colors.black,
            heroTag: null,
          ),
          SizedBox(height: 15),
          FloatingActionButton.extended(
            onPressed: () {
              // Check if the distance is less than 100 meters
              if (_currentLocation != null &&
                  Geolocator.distanceBetween(
                      37.32138,
                      127.10950,
                      _currentLocation!.latitude!,
                      _currentLocation!.longitude!) <
                      100) {
                _showConfirmationDialog();
                int crsId=9;
                bool visited=true;
                updateServerData(crsId,widget.plcId,visited);
              }
              else{
                _showError();
              }
            },
            label: const Text('도장 깨기'),
            icon: Icon(Icons.update),
            backgroundColor: Color(0xFFF6BC53),
            foregroundColor: Colors.black,
            heroTag: null,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color(0xFFF6BC53),
          height: 40,
          child: Center(
            child: Text(
              '현재 위치로부터의 거리: ${distance.toStringAsFixed(2)}  미터',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
  void updateServerData(int crsId, int plcId,bool visited) {
    mapRepository.visitPic(crsId, plcId, visited)
        .then((updatedData) {
      // 서버에서 업데이트된 데이터 처리
      print('Data updated: $updatedData');
    })
        .catchError((error) {
      // 오류 처리
      print('Error updating data: $error');
    });
  }

  Future<void> _goToPosition(CameraPosition cameraPosition) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
