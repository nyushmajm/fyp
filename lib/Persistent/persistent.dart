import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Services/global_variables.dart';

class Persistent {
  static List<String> jobCategoryList = [
    'App Developer',
    'Web Developer',
    'Software engineer',
    'UI designer',
    'UX designer',
    'Network architect',
    'Systems analyst',
    'IT coordinator',
    'Network administrator',
    'Network engineer',
    'Data scientist',
    'DevOps engineer',
    'Front-end developer',
    'Back-end developer',
    'Full-stack developer',
    'Java developer',
  ];

  void getMyData() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    name = userDoc.get('name');
    userImage = userDoc.get('userImage');
    location = userDoc.get('location');
  }
}
