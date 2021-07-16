import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_registration_ui/pages/loginPage.dart';
import 'package:login_registration_ui/pages/registerPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7E4CC),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Login/Register",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal),
              ),
            ),
            // make the two buttons
            // Login and Register button
            // below the text
            SizedBox(
              height: 90.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                // call login page after pressing the button
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                // call login page after pressing the button
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ), // shape
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// the work of mainScreen is done
// first of all now we need to work on firebase
// in firebase setup the auth credentials and then
// first work on registration page and then on the login page
