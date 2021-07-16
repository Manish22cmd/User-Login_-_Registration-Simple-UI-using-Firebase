import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_registration_ui/pages/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcomePage.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final _userauth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEEBDB),
      body: Center(
        child: ProgressHUD(
          //indicatorWidget: CircularProgressIndicator(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                "Login Page",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 60,
              ),
              // add the text field for email
              TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                cursorHeight: 28,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 16.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    hintText: "example@demo.com"),
              ),
              SizedBox(
                height: 20,
              ),
              // add the text field for password
              TextField(
                obscureText: true,
                style: TextStyle(
                  fontSize: 20,
                ),
                cursorHeight: 28,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 16.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    hintText: "password"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50.0,
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xffE27629),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  onPressed: () async {
                    // final progress = ProgressHUD.of(context);
                    // progress!.showWithText("Loading...");
                    // Future.delayed(Duration(seconds: 1), () {
                    //   progress.dismiss();
                    // });

                    // set try and catch block
                    try {
                      final newUser =
                          await _userauth.signInWithEmailAndPassword(
                              email: email, password: password);
                      print(newUser.toString());
                      if (newUser != null) {
                        Fluttertoast.showToast(
                          toastLength: Toast.LENGTH_SHORT,
                          msg: "Login Successfull",
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                          fontSize: 16,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                        );
                      }
                    } catch (e) {}
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 18),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
