import 'package:flutter/widgets.dart';
import 'package:project/services/fireStore_readData_services.dart';

class SelectedLocationProvider extends ChangeNotifier {
  String selectedLocation = FireStoreReadDataService.locations![0].toString();
  void changeLocation(String currentLocation) {
    selectedLocation = currentLocation;
    notifyListeners();
  }
}
