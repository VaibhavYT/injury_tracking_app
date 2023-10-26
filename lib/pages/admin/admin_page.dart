import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final user = FirebaseAuth.instance.currentUser!;
  String firstName = '';
  String lastName = '';

  Future<void> fetchUserData() async {
    String uid = user.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot documentSnapshot = await users.doc(uid).get();
    if (documentSnapshot.exists) {
      var userData = documentSnapshot.data() as Map<String, dynamic>;
      setState(() {
        firstName = userData['first name'];
        lastName = userData['last name'];
      });
    } else {
      print('User document does not exist');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(firstName),
          const SizedBox(
            height: 20,
          ),
          Text(lastName)
        ],
      )),
    );
  }
}
