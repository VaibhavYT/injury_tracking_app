import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 156, 17),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/blue.png',
                width: 300,
                height: 300,
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                         
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 15)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          
                          hintText: 'password',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 15)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                padding: const EdgeInsets.all(18),
                onPressed: signIn,
                color: Colors.blue,
                hoverColor: Colors.green,
                focusColor: Colors.green,
                shape: const CircleBorder(eccentricity: .025),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
