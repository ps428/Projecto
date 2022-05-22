import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/FirebaseFunctions.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/LoginPage.dart';
import 'package:projecto/routes/OTPVerify.dart';

import '../FirebaseUserSide.dart';
import '../validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _MobileNumberTextController = TextEditingController();
  final _AddressTextController = TextEditingController();
  final _CityTextController = TextEditingController();
  final _StateTextController = TextEditingController();
  final _PincodeTextController = TextEditingController();
  final _CountryTextController = TextEditingController();
  final _CompanyNameTextController = TextEditingController();
  final _OccupationTextController = TextEditingController();
  final _YearsOfExperienceTextController = TextEditingController();

  bool _isDuplicateID = false;
  bool _isProcessing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  Future<void> SignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
        _isDuplicateID = false;
      });
    }

    if (_formKey.currentState!.validate()) {
      List l = await FireAuth.registerUsingEmailPassword(
        name: _nameTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text,
        phoneNumber: _MobileNumberTextController.text,
        isDuplicateID: _isDuplicateID,
      );

      User? user = await l[0];
      _isDuplicateID = l[1];

      setState(() {
        _isProcessing = false;
      });

      if (user != null && _isDuplicateID == false) {
        FirebaseUser.addUser(user.uid, _nameTextController.text,
            _MobileNumberTextController.text, _emailTextController.text);
      }

      if (_isDuplicateID == false) {
        PhoneAuthCredential phone =
            "+91" + _MobileNumberTextController.text as PhoneAuthCredential;
        user!.updatePhoneNumber(phone);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                // HomeScreen()
                const LogInPage(),
            // builder: (context) =>
            //     const SignupScreen(),
          ),
        );
      } else {}
      setState(() {
        _isProcessing = false;
      });
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
                  alignment: Alignment.centerLeft, child: Text('Sign Up Page')),
            ),
            body: ListView(children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
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
                            const CustomTextPlayfair(
                                "SignUp", 24, Colors.white),
                            const SizedBox(
                              height: 30,
                            ),
                            //input boxes
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  //name field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      //changes here for all objects
                                      controller: _nameTextController,
                                      validator: (value) =>
                                          Validator.validateName(
                                        name: value,
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Name",
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

                                  //email id field
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
                                        labelText: "Email Id",
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

                                  // mobile number field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      maxLength: 10,
                                      //controlling options and validation
                                      controller: _MobileNumberTextController,
                                      validator: (value) =>
                                          Validator.validatePhoneNumber(
                                        phone: value,
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Mobile Number",
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

                                  //Password field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      //changes here for all objects
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
                                  _isDuplicateID
                                      ? const CustomTextPlayfair(
                                          "Error! Id already taken",
                                          20,
                                          Colors.white)
                                      : const SizedBox(height: 2),

                                  const SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                            StyledButtonPlayfair(
                                onPressed: SignUp, size: 20, text: "Submit")
                          ],
                        ),
                      )
                    ]),
              )
            ])));
  }
}
