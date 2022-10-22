import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore fireStore = FirebaseFirestore.instance;
final docFal = fireStore.collection("fallar");
final docUser = FirebaseFirestore.instance.collection("users");
final docEnv = FirebaseFirestore.instance.collection("falci");
