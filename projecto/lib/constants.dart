import 'package:flutter/material.dart';

const japanBlush = Color(0xffE2D6F3);

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24, fontFamily: 'Playfair'),
        ),
      );
}
