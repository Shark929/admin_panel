import 'package:admin_panel/screens/category.dart';
import 'package:admin_panel/screens/cuisine.dart';
import 'package:admin_panel/screens/home.dart';
import 'package:admin_panel/screens/location.dart';
import 'package:admin_panel/screens/mall.dart';
import 'package:admin_panel/screens/order.dart';
import 'package:admin_panel/screens/promotion.dart';
import 'package:admin_panel/screens/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

String adminId = "RXNiDLAgNF7ERdi78mJo";

List screensLabel = [
  "Main",
  "Users",
  "Promotions",
  "Locations",
  "Malls",
  "Orders",
  "Categories",
  "Cuisines",
];
List screens = [
  const Home(),
  const User(),
  const Promotion(),
  const Location(),
  const Mall(),
  const OrderScreen(),
  const Category(),
  const Cuisine(),
];
