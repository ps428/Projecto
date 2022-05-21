import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/FirebaseFunctions.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';

import '../validator.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _optSent = false;
  final _OTPTextController = TextEditingController();

  bool _isProcessing = false;
  bool _wrongUserCredentials = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  void sendOTP() {}

  void LogInWithOTP(
    String email,
    String password,
  ) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });

      User? user = await FireAuth.signInUsingEmailPassword(
          email: email, password: password);
      if (user != null) {
        setState(() {
          _isProcessing = false;
          _wrongUserCredentials = false;
          _optSent = true;
        });
      } else {
        setState(() {
          _wrongUserCredentials = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [pineGreen, bottleGreen])),
        child: Scaffold(
            // By defaut, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black45,
              title: const Align(
                  alignment: Alignment.centerLeft, child: Text('Log In Page')),
            ),
            body: ListView(children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: militantVegan,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomTextPlayfair(
                                "Projecto: Showcase your projects here!",
                                26,
                                Colors.white),
                            const CustomTextPlayfair("LogIn", 24, Colors.white),
                            const SizedBox(
                              height: 30,
                            ),
                            //input boxes
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  // email field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _emailTextController,
                                      validator: (value) =>
                                          Validator.validateEmail(
                                        email: value,
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Email ID",
                                        prefixIconColor: Colors.white,
                                        fillColor: Colors.white,

                                        errorBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),

                                        focusColor: Colors.white,

                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ),

                                      style: const TextStyle(
                                          fontFamily: "Playfair",
                                          fontSize: 14,
                                          color: Colors.white,
                                          decorationColor: Colors.white),
                                    ),
                                  ),

                                  //password field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      obscureText: true,
                                      controller: _passwordTextController,
                                      validator: (value) =>
                                          Validator.validatePassword(
                                        password: value,
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Password",
                                        prefixIconColor: Colors.white,
                                        fillColor: Colors.white,

                                        errorBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),

                                        focusColor: Colors.white,

                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ),

                                      style: const TextStyle(
                                          fontFamily: "Playfair",
                                          fontSize: 14,
                                          color: Colors.white,
                                          decorationColor: Colors.white),
                                    ),
                                  ),

                                  // OTP field
                                  _optSent
                                      ? Container(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            obscureText: true,
                                            //controlling options and validation
                                            controller: _OTPTextController,

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText: "OTP",
                                              prefixIconColor: Colors.white,
                                              fillColor: Colors.white,

                                              errorBorder: UnderlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),

                                              focusColor: Colors.white,

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),

                                            style: const TextStyle(
                                                fontFamily: "Playfair",
                                                fontSize: 14,
                                                color: Colors.white,
                                                decorationColor: Colors.white),
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 10,
                                        ),

                                  const SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),

                            _wrongUserCredentials
                                ? const CustomTextPlayfair(
                                    "Error! Wrong Credentials!",
                                    24,
                                    Colors.white)
                                : const SizedBox(
                                    height: 2,
                                  ),

                            StyledButtonPlayfair(
                                size: 20,
                                text: "Log In",
                                onPressed: () {
                                  LogInWithOTP(_emailTextController.text,
                                      _passwordTextController.text);
                                })
                          ],
                        ),
                      )
                    ]),
              )
            ])));
  }
}
