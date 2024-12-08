import 'dart:ui';

import 'package:appointment_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/pages/main_page.dart';
import 'package:flutter/services.dart';

class ProfessorLogin extends StatefulWidget {
  const ProfessorLogin({super.key});

  @override
  State<ProfessorLogin> createState() => _ProfessorLoginState();
}

class _ProfessorLoginState extends State<ProfessorLogin> {
  final _formKey = GlobalKey<FormState>();
  String _staffId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        //background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/yeditepe.jpeg'),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Constants.mainColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 125),
                      child: Text("Log In", style: Constants.loginStyle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Welcome",
                      style: Constants.loginStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Staff ID",
                            style: TextStyle(
                                fontSize: 18,
                                color: Constants.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                11), // Maksimum 11 karakter
                          ],
                          decoration: InputDecoration(
                            hintText: "staff id",
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            enabledBorder: Constants.textFormFielEnabledBorder,
                            focusedBorder: Constants.textFormFieldFocusedBorder,
                            errorBorder: Constants.textFormFieldErrorBorder,
                            focusedErrorBorder:
                                Constants.textFormFieldFocusedErrorBorder,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Staff ID cannot be empty!";
                            } else if (value.length < 11) {
                              return "Staff ID must be 11 characters long!";
                            }
                            return null;
                          },
                          onSaved: (value) => _staffId = value!,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 18,
                                color: Constants.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty!';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _password = value!,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '**************',
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            enabledBorder: Constants.textFormFielEnabledBorder,
                            focusedBorder: Constants.textFormFieldFocusedBorder,
                            errorBorder: Constants.textFormFieldErrorBorder,
                            focusedErrorBorder:
                                Constants.textFormFieldFocusedErrorBorder,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.mainColor,
                          fixedSize: Constants.buttonSize),
                      onPressed: () async {
                        bool _validate = _formKey.currentState!.validate();
                        if (_validate) {
                          _formKey.currentState!.save();

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Plase enter a valid input")));
                        }
                      },
                      child: Text(
                        "Log In",
                        style: Constants.buttonTextStyle,
                      )),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
