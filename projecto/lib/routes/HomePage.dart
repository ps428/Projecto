import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';
import 'package:projecto/routes/ProfilePage.dart';
import 'package:projecto/routes/ProjectsPage.dart';

import '../validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
  late User user;
  bool _isProcessing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    user = widget.user;
  }

  void SubmitDetails() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });
    }
  }

  int _selectedIndex = 0;
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
              alignment: Alignment.centerLeft, child: Text('Home Page')),
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
                        CustomTextPlayfair(
                            "Projecto: Showcase your projects here! \nWelcome " +
                                widget.user.displayName!,
                            26,
                            Colors.white),
                        const CustomTextPlayfair("Home page", 24, Colors.white),
                        const SizedBox(
                          height: 30,
                        ),
                        StyledButtonPlayfair(
                            text: "Show Projects",
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    // HomeScreen()
                                    ProjectsPage(
                                  user: user,
                                ),
                              ));
                            },
                            size: 20),
                        const SizedBox(
                          height: 20,
                        ),
                        StyledButtonPlayfair(
                            text: "Show My Profile",
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    // HomeScreen()
                                    ProfilePage(
                                  user: user,
                                ),
                              ));
                            },
                            size: 20),
                      ],
                    ),
                  )
                ]),
          ),
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
      ),
    );
  }
}
