import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/FirebaseUserSide.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';
import 'package:projecto/routes/ProjectsPage.dart';

import '../validator.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<AddProjectPage> createState() => _AddProjectPage();
}

class _AddProjectPage extends State<AddProjectPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _category = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  late User user;
  bool _isProcessing = false;
  final _formKey = GlobalKey<FormState>();
  bool success = false;
  @override
  void initState() {
    user = widget.user;
  }

  void addProjectNow() {
    if (_formKey.currentState!.validate()) {
      FirebaseUser.addProjecct(user.uid, _title.text, _description.text,
          _category.text, _startDate.text, _endDate.text);
      setState(() {
        success = true;
      });
    }
  }

  _selectDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime(2021),
        firstDate: DateTime(2022),
        lastDate: DateTime(2022),
        initialEntryMode: DatePickerEntryMode.input);
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
                  alignment: Alignment.centerLeft, child: Text('Add Project')),
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
                                "Add Project", 24, Colors.white),
                            const SizedBox(
                              height: 30,
                            ),
                            //input boxes
                            success
                                ? Column(
                                    children: [
                                      const CustomTextPlayfair(
                                          "Successfully added the project",
                                          20,
                                          Colors.white),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      StyledButtonPlayfair(
                                          text: "My Projects",
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) =>
                                                  // HomeScreen()
                                                  ProjectsPage(
                                                user: user,
                                              ),
                                            ));
                                          },
                                          size: 20)
                                    ],
                                  )
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
                                            controller: _title,
                                            validator: (value) =>
                                                Validator.validateName(
                                              name: value,
                                            ),

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText: "Title",
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
                                            controller: _description, //here
                                            validator: (value) =>
                                                Validator.validateAddress(
                                              //here
                                              address: value, //here
                                            ),

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText: "Description", //here
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
                                            controller: _category, //here
                                            validator: (value) =>
                                                Validator.validateCity(
                                              //here
                                              city: value, //here
                                            ),

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText: "Category", //here
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

                                        //Start Date
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            //controlling options and validation
                                            controller: _startDate, //here
                                            validator: (value) =>
                                                Validator.validateDate(
                                              //here
                                              date: value, //here
                                            ),

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText:
                                                  "Start Date: dd/mm/yyyy", //here
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

                                        //END date
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            //controlling options and validation
                                            controller: _endDate, //here
                                            validator: (value) =>
                                                Validator.validateDate(
                                              //here
                                              date: value, //here
                                            ),

                                            //decorations and UI enhancements
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              //for floating name color
                                              floatingLabelStyle:
                                                  const TextStyle(
                                                      color: Colors.white),
                                              labelText:
                                                  "End Date dd/mm/yyyy", //here
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

                                        // StyledButtonPlayfair(
                                        //     text: "Start Date",
                                        //     onPressed: _selectDate(context),
                                        //     size: 20),

                                        const SizedBox(
                                          height: 7,
                                        ),
                                      ],
                                    ),
                                  ),
                            success
                                ? const SizedBox(
                                    height: 2,
                                  )
                                : StyledButtonPlayfair(
                                    onPressed: addProjectNow,
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
            )));
  }
}
