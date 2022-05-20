import 'package:flutter/material.dart';
import 'package:projecto/constants.dart';

void main() {
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
        brightness: Brightness.dark,
        primaryColor: militantVegan,
        secondaryHeaderColor: monteCarlo,
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 140.0,
              width: 300.0,
              decoration: const BoxDecoration(
                  color: parchmentPaper,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: const [
                  CustomText("Login 1", 30, pineGreen),
                  CustomText("Login 2", 30, bottleGreen)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
