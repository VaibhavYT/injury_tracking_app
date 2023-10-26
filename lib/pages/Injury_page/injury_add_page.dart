import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InjuryAddPage extends StatefulWidget {
  const InjuryAddPage({super.key});

  @override
  State<InjuryAddPage> createState() => _InjuryAddPageState();
}

class _InjuryAddPageState extends State<InjuryAddPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/glass.png'),
              maxRadius: 70,
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  text: firstName,
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: lastName,
                        style: const TextStyle(color: Colors.black)),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/blue.png'))),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            width: 150,
                            height: 25,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text('Select Body Part'),
                                ),
                                Text('d')
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 75,
                            width: 250,
                            child: const Center(
                                child: Align(
                              alignment: Alignment.bottomCenter,
                              widthFactor: 15,
                              child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 8),
                                  hintText: 'Enter your area',
                                ),
                              ),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
