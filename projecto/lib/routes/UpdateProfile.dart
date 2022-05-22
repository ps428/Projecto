import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/FirebaseUserSide.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';
import 'package:projecto/routes/ProfilePage.dart';

import '../validator.dart';
import 'HomePage.dart';
import 'ProjectsPage.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePage();
}

class _UpdateProfilePage extends State<UpdateProfilePage> {
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
  bool success = false;
  bool _isProcessing = false;
  final _formKey = GlobalKey<FormState>();
  late User user;
  @override
  void initState() {
    user = widget.user;
  }

  void SubmitDetails() {
    if (_formKey.currentState!.validate()) {
      FirebaseUser.updateProfile(
          user.uid,
          _nameTextController.text,
          user.email,
          user.phoneNumber,
          _AddressTextController.text,
          _CityTextController.text,
          _StateTextController.text,
          _PincodeTextController.text,
          _CountryTextController.text,
          _CompanyNameTextController.text,
          _OccupationTextController.text,
          _YearsOfExperienceTextController.text);
      setState(() {
        _isProcessing = true;
        success = true;
      });
    }
  }

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: user,
          ),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProjectsPage(
            user: user,
          ),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user,
          ),
        ),
      );
    }
  }

  void toMyProfile() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            // HomeScreen()
            ProfilePage(user: user),
        // builder: (context) =>
        //     const SignupScreen(),
      ),
    );
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
                alignment: Alignment.centerLeft, child: Text('Update Profile')),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextPlayfair(
                              "Projecto: Showcase your projects here!",
                              26,
                              Colors.white),
                          const CustomTextPlayfair(
                              "Update Profile", 24, Colors.white),
                          const SizedBox(
                            height: 30,
                          ),
                          //input boxes
                          success
                              ? const CustomTextPlayfair(
                                  "Success! Profile updated successfully.",
                                  20,
                                  Colors.white)
                              : Form(
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
                                      ),

                                      //Address field
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          //controlling options and validation
                                          controller:
                                              _AddressTextController, //here
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
                                      ),

                                      //City field

                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          //controlling options and validation
                                          controller:
                                              _CityTextController, //here
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
                                      ),

                                      //State field
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          //controlling options and validation
                                          controller:
                                              _StateTextController, //here
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
                                      ),

                                      // pincode field
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          maxLength: 6,
                                          //controlling options and validation
                                          controller:
                                              _PincodeTextController, //here
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
                                      ),

                                      //Country field
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          //controlling options and validation
                                          controller:
                                              _CountryTextController, //here
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
                                      ),

                                      //Years of experience field
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          //controlling options and validation
                                          controller:
                                              _YearsOfExperienceTextController, //here
                                          validator: (value) => Validator
                                              .validateYearsOfExperience(
                                            //here
                                            yearsOfExperience: value, //here
                                          ),

                                          //decorations and UI enhancements
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                            //for floating name color
                                            floatingLabelStyle: const TextStyle(
                                                color: Colors.white),
                                            labelText:
                                                "Years of experience", //here
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
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 7,
                          ),
                          success
                              ? StyledButtonPlayfair(
                                  text: "My Profile",
                                  onPressed: toMyProfile,
                                  size: 20)
                              : StyledButtonPlayfair(
                                  onPressed: SubmitDetails,
                                  size: 20,
                                  text: "Submit")
                        ],
                      ),
                    )
                  ]),
            )
          ]),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'My Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'My Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: monteCarlo,
            selectedItemColor: bottleGreen,
            onTap: _onItemTapped,
          ),
        ));
  }
}
