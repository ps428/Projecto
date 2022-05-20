import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/routes/OTPVerify.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _attempetd = false;
  bool _wrongCredentials = false;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;

  @override
  void initState() {}

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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
