import 'package:flutter/widgets.dart';
import 'package:project/services/fireStore_service.dart';

class SelectedLocationProvider extends ChangeNotifier {
  String selectedLocation = FireStoreService.locations![0].toString();
  void changeLocation(String currentLocation) {
    selectedLocation = currentLocation;
    notifyListeners();
  }
}
