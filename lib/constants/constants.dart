import 'package:admin_panel/screens/home.dart';
import 'package:admin_panel/screens/location.dart';
import 'package:admin_panel/screens/promotion.dart';
import 'package:admin_panel/screens/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

String adminId = "RXNiDLAgNF7ERdi78mJo";

List screensLabel = [
  "Main",
  "Users",
  "Promotions",
  "Locations",
  "Restaurants",
];
List screens = [
  const Home(),
  const User(),
  const Promotion(),
  const Location(),
  const Text("Restaurants"),
];

// TextField(
//           controller: locationController,
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         ElevatedButton(
//             onPressed: () async {
//               final locationModel =
//                   LocationModel(locationName: locationController.text);

//               await LocationFirestoreDb.addLocation(locationModel);
//               locationController.clear();
//             },
//             child: const Text("Add")),
//         const SizedBox(
//           height: 20,
//         ),
//         const Text("Location List"),
//         const SizedBox(
//           height: 20,
//         ),
//         GetX<LocationController>(
//             init: Get.put<LocationController>(LocationController()),
//             builder: (LocationController locationController) {
//               return Flexible(
//                   child: ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: locationController.location.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         // print(locationController.location[index].locationId);
//                         final locationModel0 =
//                             locationController.location[index];

//                         return Row(
//                           children: [
//                             Text(locationModel0.locationName),
//                             IconButton(
//                                 onPressed: () {
//                                   LocationFirestoreDb.deleteLocation(
//                                       locationModel0.locationId!);
//                                 },
//                                 icon: Icon(Icons.delete)),
//                           ],
//                         );
//                       }));
//             }),