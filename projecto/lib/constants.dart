import 'package:flutter/material.dart';

const mustard = Color(0xffffdb58);
const japanBlush = Color(0xffE2D6F3);
const cavernPink = Color(0xffE2BCB7);
const parchmentPaper = Color(0xffF0E5D8);
const babyPink = Color(0xffFCD1D1);
const wildWatermelon = Color(0xffFF577F);
const reddish = Color(0xffE10032);
const brown = Color(0xff5D373D);
const monteCarlo = Color(0xffABD8D8);
const coriander = Color(0xffC1DEAE);
const militantVegan = Color(0xff219F94);
const pineGreen = Color(0xff15717E);
const bottleGreen2 = Color(0xff006A4E);
const stromboli = Color(0xff2E5E4E);
const bottleGreen = Color(0xff072227);

class CustomText extends StatelessWidget {
  const CustomText(this.heading, this.size, this.color);
  final double size;
  final Color color;
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style:
              TextStyle(fontSize: size, fontFamily: 'Playfair', color: color),
        ),
      );
}
