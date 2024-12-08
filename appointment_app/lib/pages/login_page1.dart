import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/pages/professor_login.dart';
import 'package:appointment_app/pages/student_login.dart';

class LoginPage1 extends StatelessWidget {
  const LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return Scaffold(
      body: Stack(children: <Widget>[
        //background image
        Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/yeditepe.jpeg'),
                fit: BoxFit.cover),
          ),
        ),

        Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width / 2 - 170,
          child: Image.asset(
            'assets/images/yeditepe_logo.png',
            width: 340,
            height: 340,
          ),
        ),

        Positioned(
          bottom: 160.0,
          left: MediaQuery.of(context).size.width / 4 -
              65.0, // Sağ butonun konumunu ayarlar
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.mainColor,
                fixedSize: Constants.buttonSize),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfessorLogin(),
              ));
            },
            child: Text(
              'Professors',
              style: Constants.buttonTextStyle,
            ),
          ),
        ),
        Positioned(
          bottom: 80.0,
          left: MediaQuery.of(context).size.width / 4 -
              65.0, // Sağ butonun konumunu ayarlar
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.mainColor,
                fixedSize: Constants.buttonSize),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentLogin(),
              ));
            },
            child: Text(
              'Students',
              style: Constants.buttonTextStyle,
            ),
          ),
        ),
        Center(
          child: Text(Constants.titleText,
              textAlign: TextAlign.center, style: Constants.titleStyle),
        ),
        Positioned(
            bottom: 240,
            left: MediaQuery.of(context).size.width / 4 - 30,
            child: Text(
              "Log in using your account on:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ]),
    );
  }
}
