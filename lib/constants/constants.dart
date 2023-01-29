// const firebaseConfig = {
//   apiKey: "AIzaSyBog26Fv1Etpqnso6DpbZhMSYQRuGaYtMI",
//   authDomain: "foodie-app-30c78.firebaseapp.com",
//   projectId: "foodie-app-30c78",
//   storageBucket: "foodie-app-30c78.appspot.com",
//   messagingSenderId: "749033509302",
//   appId: "1:749033509302:web:802a266763fb048a81b117",
//   measurementId: "G-4J5FL2D57H"
// };

import 'package:cloud_firestore/cloud_firestore.dart';

List list1 = [
  "Label 1",
  "Label 2",
  "Label 3",
];

List users = [
  "users",
];

//firebase

var firebaseFirestore = FirebaseFirestore.instance;
