import 'package:angela3_i_m_rich/chat_screen.dart';
import 'package:angela3_i_m_rich/login_screen.dart';
import 'package:angela3_i_m_rich/registration_screen.dart';
import 'package:angela3_i_m_rich/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      /*theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1E1531),
        scaffoldBackgroundColor: Color(0xFF1E1531),
      ),*/
      // theme: ThemeData.dark(),
      /*home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Flutter Learning'),
          centerTitle: true,
        ),
        body: Destiny(),
        ),*/
      //home: BMIcalc(),
      //home: LoadingScreen(),
      // home: PriceScreen(),
      //home: null,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      /*routes: {
        '/results': (context) => ResultsPage(),
      },*/
    );
  }
}
