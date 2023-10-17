import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In ${user.email!}',
            style: TextStyle(
                color: Color.fromARGB(255, 10, 255, 22), fontSize: 24),
          ),
          MaterialButton(onPressed: () {
            FirebaseAuth.instance.signOut();

          },
          color: Colors.red,
          child: Text('Sign Out'),
          )
        ],
      )),
    );
  }
}
