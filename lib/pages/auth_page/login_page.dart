import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injury_tracking/auth/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const LoginPage({Key? key, required this.showSignUpPage}) : super(key: key);

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
      backgroundColor: const Color.fromARGB(255, 70, 17, 185),
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
              Text('HELLO AGAIN!',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white)),
              const SizedBox(
                height: 5,
              ),
              Text('Welcome Back! you\'ve been missed',
                  style:
                      GoogleFonts.b612Mono(fontSize: 18, color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              //SECTION - email textfield 
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
              //SECTION - Password field
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPasswordPage();
                  }));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding: const EdgeInsets.all(18),
                onPressed: signIn,
                color: const Color.fromARGB(255, 222, 233, 8),
                hoverColor: Colors.green,
                focusColor: Colors.green,
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.showSignUpPage,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(color: Colors.blue),
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
