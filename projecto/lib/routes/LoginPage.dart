import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
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

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: militantVegan,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextPlayfair(
                          "Projecto: Showcase your projects here!",
                          26,
                          Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextPlayfair("Welcome", 20, Colors.white),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
