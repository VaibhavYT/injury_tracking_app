import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    } else {}
  }

  bool passwordConfirmed() {
    if (_passwordcontroller.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 17, 185),
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
              Text('HELLO THERE!',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white)),
              const SizedBox(
                height: 5,
              ),
              Text('Register Now ',
                  style:
                      GoogleFonts.b612Mono(fontSize: 18, color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.yellow),
                      ),
                      hintText: 'Email',
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 15)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: TextField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.yellow),
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 15)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: TextField(
                  controller: _confirmpasswordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.yellow),
                      ),
                      hintText: ' Confirm Password',
                      border: InputBorder.none,
                      fillColor: Colors.white,
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
                onPressed: signUp,
                color: Color.fromARGB(255, 222, 233, 8),
                hoverColor: Colors.green,
                focusColor: Colors.green,
                child: const Text('Sign Up'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I am member ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(color: Color.fromARGB(255, 177, 243, 33)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
