import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Injury_page/injury_add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _age = TextEditingController();

  Future addUserDetails() async {
    try {
      String firstName = _firstName.text;
      String lastName = _lastName.text;
      int age = int.tryParse(_age.text) ?? 0;

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'first name': firstName,
        'last name': lastName,
        'age': age,
      });
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('user details are uploaded'));
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In ${user.email!}',
            style: const TextStyle(
                color: Color.fromARGB(255, 10, 255, 22), fontSize: 24),
          ),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.red,
            child: const Text('Sign Out'),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _firstName,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                  hintText: 'FirstName',
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 15, top: 15, bottom: 15)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _lastName,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                  hintText: 'LastName',
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 15, top: 15, bottom: 15)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _age,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                  hintText: 'Age',
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 15, top: 15, bottom: 15)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(18),
            onPressed: addUserDetails,
            color: const Color.fromARGB(255, 222, 233, 8),
            hoverColor: Colors.green,
            focusColor: Colors.green,
            child: const Text('Save'),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(18),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InjuryAddPage();
              }));
            },
            color: const Color.fromARGB(255, 31, 220, 216),
            hoverColor: Colors.green,
            focusColor: Colors.green,
            child: const Text('InjuryPage'),
          ),
        ],
      )),
    );
  }
}
