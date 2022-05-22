import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/AddProject.dart';
import 'package:projecto/routes/OTPVerify.dart';

import '../FirebaseUserSide.dart';
import '../validator.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<ProjectsPage> createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
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
  bool noData = false;

  late List<List<String>> projectListData;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    user = widget.user;
    getFirebasseData();
  }

  int _selectedIndex = 1;
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

  Future<void> getFirebasseData() async {
    setState(() {
      _isProcessing = true;
    });

    projectListData = await FirebaseUser.getProjects(user.uid);
    if (projectListData.length == 0) {
      setState(() {
        noData = true;
      });
    }
    setState(() {
      _isProcessing = false;
    });
  }

  void SubmitDetails() {
    if (_formKey.currentState!.validate()) {}
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
                alignment: Alignment.centerLeft, child: Text('My Projects')),
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
                              "Projects:", 28, Colors.white),
                          const SizedBox(
                            height: 30,
                          ),
                          _isProcessing
                              ? const CircularProgressIndicator()
                              : noData
                                  ? const CustomTextPlayfair(
                                      "NO PROJECT DATA FOUND", 22, Colors.white)
                                  : Column(
                                      children: <Widget>[
                                        for (int i = 0;
                                            i < projectListData.length;
                                            i++)
                                          ProjectDataWidget(
                                              projectListData[i][0],
                                              projectListData[i][1],
                                              projectListData[i][2],
                                              projectListData[i][3],
                                              projectListData[i][4])
                                      ],
                                    ),
                          const SizedBox(
                            height: 20,
                          ),
                          StyledButtonPlayfair(
                              text: "Add new project",
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) =>
                                      // HomeScreen()
                                      AddProjectPage(user: user),
                                  // builder: (context) =>
                                  //     const SignupScreen(),
                                ));
                              },
                              size: 20),
                        ],
                      ),
                    ),
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
