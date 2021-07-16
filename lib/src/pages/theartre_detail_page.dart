import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheatreDetail extends StatelessWidget {
  GoogleMapController? mapController;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(20.5483066, -97.451714),
    zoom: 18.5,
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Marker marker = Marker(
      markerId: MarkerId('cine'),
      draggable: false,
      position: LatLng(20.5483066, -97.451714));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        centerTitle: true,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.terrain,
        markers: {marker},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_before),
        onPressed: () => mapController?.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
      ),
    );
  }
}
