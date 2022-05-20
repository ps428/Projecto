import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';

import '../validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
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

  bool _isProcessing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  void SubmitDetails() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
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

                                  //Address field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _AddressTextController, //here
                                      validator: (value) =>
                                          Validator.validateAddress(
                                        //here
                                        address: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Address", //here
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

                                  //City field

                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _CityTextController, //here
                                      validator: (value) =>
                                          Validator.validateCity(
                                        //here
                                        city: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "City", //here
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

                                  //State field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _StateTextController, //here
                                      validator: (value) =>
                                          Validator.validateState(
                                        //here
                                        state: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "State", //here
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

                                  // pincode field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _PincodeTextController, //here
                                      validator: (value) =>
                                          Validator.validatePincode(
                                        //here
                                        pincode: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Pincode", //here
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

                                  //Country field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller: _CountryTextController, //here
                                      validator: (value) =>
                                          Validator.validateCountry(
                                        //here
                                        country: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Country", //here
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

                                  //Company name
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller:
                                          _CompanyNameTextController, //here
                                      validator: (value) =>
                                          Validator.validateCompanyName(
                                        //here
                                        companyName: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Company Name", //here
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

                                  //Occupation field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller:
                                          _OccupationTextController, //here
                                      validator: (value) =>
                                          Validator.validateOccupation(
                                        //here
                                        occupation: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Occupation", //here
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

                                  //Years of experience field
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      //controlling options and validation
                                      controller:
                                          _YearsOfExperienceTextController, //here
                                      validator: (value) =>
                                          Validator.validateYearsOfExperience(
                                        //here
                                        yearsOfExperience: value, //here
                                      ),

                                      //decorations and UI enhancements
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        //for floating name color
                                        floatingLabelStyle: const TextStyle(
                                            color: Colors.white),
                                        labelText: "Years of experience", //here
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

                                  const SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                            StyledButtonPlayfair(
                                onPressed: SubmitDetails,
                                size: 20,
                                text: "Submit")
                          ],
                        ),
                      )
                    ]),
              )
            ])));
  }
}
