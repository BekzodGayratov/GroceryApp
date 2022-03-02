import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class FireStoreReadDataService {
  static List? locations;
  static String? selectedLocation;
  static List? category;
  static List? bestSelling;
  static int? coupons;
  static final firestore = FirebaseFirestore.instance;

  static readValue({required String collection}) async {
    try {
      await readData();
      await firestore.collection(collection).doc().get().then((value) {});
      return true;
    } catch (e) {
      debugPrint(Exception().toString());
    }
  }

  static readData() async {
    CollectionReference<Map<String, dynamic>> collection =
        firestore.collection("grocery");
    await collection.doc("categories").get().then((value) {
      category = (value.get("category") as List);
    });
    await collection.doc("location").get().then((value) {
      locations = (value.get("locations") as List);
    });
    await collection.doc("location").get().then((value) {
      selectedLocation = (value.get("selectedLocation") as String);
    });
    await collection.doc("bestSelling").get().then((value) {
      bestSelling = (value.get("products") as List);
    });
    await collection.doc("coupons").get().then((value) {
      coupons = int.parse(value.get("coupons"));
    });
    return null;
  }
}
