import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/FirebaseUserSide.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';
import 'package:projecto/routes/UpdateProfile.dart';

import '../validator.dart';
import 'HomePage.dart';
import 'ProjectsPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
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
  Map<String, String> userData = {};
  bool _isProcessing = true;
  bool noData = true;
  final _formKey = GlobalKey<FormState>();
  late User user;
  @override
  void initState() {
    user = widget.user;
    firebaseCalled();
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

  Future<void> firebaseCalled() async {
    userData = await FirebaseUser.getProfile(user.uid);
    if (userData.isEmpty) {
      // print("not found any data");
      setState(() {
        noData = true;
        _isProcessing = false;
      });
    } else {
      print("found data");
      setState(() {
        noData = false;
        _isProcessing = false;
      });
      print(noData);
      print(_isProcessing);
    }
  }

  void UpdateProfile() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            // HomeScreen()
            UpdateProfilePage(user: user),
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
                alignment: Alignment.centerLeft, child: Text('Profile Page')),
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
                              "Profile page", 24, Colors.white),
                          const SizedBox(
                            height: 30,
                          ),
                          _isProcessing
                              ? Column(
                                  children: const [
                                    CustomTextPlayfair(
                                        "Loading data", 15, Colors.white60),
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              : noData
                                  ? const CustomTextPlayfair(
                                      "NO DATA FOUND", 20, Colors.white)
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomTextPlayfairUser(
                                            "Name: ",
                                            userData['Name']!,
                                            22,
                                            20,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Email: ",
                                            userData['email']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Mobile number: ",
                                            userData['phoneNumber']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Address: ",
                                            userData['address']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "City: ",
                                            userData['city']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "State: ",
                                            userData['state']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Pincode: ",
                                            userData['pincode']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Country: ",
                                            userData['country']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Company: ",
                                            userData['company']!,
                                            19,
                                            17,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Occupation: ",
                                            userData['occupation']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                        CustomTextPlayfairUser(
                                            "Years of Experience: ",
                                            userData['yearsOfExperience']!,
                                            16,
                                            14,
                                            Colors.white,
                                            Colors.white60),
                                      ],
                                    ),
                          StyledButtonPlayfair(
                              text: "Reload",
                              onPressed: firebaseCalled,
                              size: 20),
                          const SizedBox(
                            height: 10,
                          ),
                          StyledButtonPlayfair(
                              onPressed: UpdateProfile,
                              size: 20,
                              text: "Edit Profile")
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
