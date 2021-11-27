import 'dart:ui';

import 'package:angela3_i_m_rich/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var borderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  borderSide: BorderSide(
    color: Colors.black,
    width: 2,
  ),
);

class LoginScreen extends StatefulWidget {
  static String id = '/login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorTextEmail;
  String? errorTextPassword;
  String email = '';
  String password = '';
  void check() {
    if (email.isEmpty) {
      errorTextEmail = 'This field can not be empty.';
      if (password.isEmpty) {
        errorTextPassword = 'This field can not be empty.';
      } else if (password.length < 8) {
        errorTextPassword = 'Password length must be minimum 8';
      } else {
        errorTextPassword = null;
      }
    } else if (password.isEmpty) {
      errorTextEmail = null;
      errorTextPassword = 'This field can not be empty.';
    } else if (password.length < 8) {
      errorTextEmail = null;
      errorTextPassword = 'Password length must be minimum 8';
    } else {
      errorTextEmail = null;
      errorTextPassword = null;
      Navigator.pushNamed(context, ChatScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Image.asset('images/logo.png'),
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
              ),
              child: TextField(
                cursorHeight: 20,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  disabledBorder: borderStyle,
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ubuntu',
                    color: Colors.black12,
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black45,
                  ),
                  errorText: errorTextEmail,
                  errorStyle: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Ubuntu',
                    //color: Colors.red,
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: TextField(
                obscureText: true,
                cursorHeight: 20,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  disabledBorder: borderStyle,
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ubuntu',
                    color: Colors.black12,
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.black45,
                  ),
                  errorText: errorTextPassword,
                  errorStyle: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Ubuntu',
                    //color: Colors.red,
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    check();
                  });
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
