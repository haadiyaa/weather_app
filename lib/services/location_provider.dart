import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location_service.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  final LocationService _locationService = LocationService();
  Placemark? _currenLocationName;
  Placemark? get currentLocationName=>_currenLocationName;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> determinePosition() async {
    _isLoading=true;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        _currentPosition == null;
        notifyListeners();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
      notifyListeners();
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    print('CURRENT POSITION : $_currentPosition');

    _currenLocationName=await _locationService.getLocationName(_currentPosition);
    print('CURRENT LOCATION NAME: $_currenLocationName');
    _isLoading=false;
    notifyListeners();
  }
}
