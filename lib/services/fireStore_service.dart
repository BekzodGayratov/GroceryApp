import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class FireStoreService {
  //* to sava data in box
  static Box? categoryBox;
  static Box? bestSellingBox;
  static Box? couponsBox;
  static Box? locationsBox;
  //* to recieve data
  static List? locations;
  static String? selectedLocation;
  static List? category;
  static List? bestSelling;
  static int? coupons;
  static final firestore = FirebaseFirestore.instance;

  static readValue({required String collection}) async {
    try {
      await openBox();
      await readData();
      await putDataToBox(category!, bestSelling!);
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

  static openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    categoryBox = await Hive.openBox("category");
    bestSellingBox = await Hive.openBox("bestSelling");
  }

  static putDataToBox(List data, List data2) async {
    await categoryBox!.clear();
    await bestSellingBox!.clear();
    categoryBox!.add(data);
    bestSellingBox!.add(data2);
    return;
  }
}
