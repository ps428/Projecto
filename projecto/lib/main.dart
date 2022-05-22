import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';
import 'package:projecto/firebase_options.dart';
import 'package:projecto/routes/LoginPage.dart';
import 'package:projecto/routes/SignUpPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: militantVegan,
        secondaryHeaderColor: monteCarlo,
        backgroundColor: Colors.transparent,
        hoverColor: japanBlush,
        fontFamily: 'Playfair',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
            fontSize: 32.0,
          ),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Lato'),
        ),
      ),
      home: const MyHomePage(title: 'Projecto: Showcase your work here!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {}

  void goToLogIn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInPage(),
      ),
    );
  }

  void goToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
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
                alignment: Alignment.centerLeft, child: Text('Home Page')),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledButtonPlayfair(
                              text: "Sign Up",
                              onPressed: goToSignUp,
                              size: 22.0),
                          const SizedBox(
                            width: 20,
                          ),
                          StyledButtonPlayfair(
                              text: "Log In", onPressed: goToLogIn, size: 22.0),
                        ],
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
