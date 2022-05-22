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

class CustomTextPlayfair extends StatelessWidget {
  const CustomTextPlayfair(this.heading, this.size, this.color);
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

class CustomTextPlayfairUser extends StatelessWidget {
  const CustomTextPlayfairUser(this.question, this.answer, this.size,
      this.size2, this.color, this.color2);
  final double size;
  final double size2;
  final Color color;
  final Color color2;
  final String? answer;
  final String question;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            question,
            style: TextStyle(
                fontSize: size2, fontFamily: 'Playfair', color: color2),
          ),
          SizedBox(
            width: size / 2,
          ),
          Text(
            answer!,
            style:
                TextStyle(fontSize: size, fontFamily: 'Playfair', color: color),
          ),
        ],
      ));
}

class StyledButtonPlayfair extends StatelessWidget {
  const StyledButtonPlayfair(
      {required this.text, required this.onPressed, required this.size});
  final String text;
  final double size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: monteCarlo, // background (button) color
          onPrimary: bottleGreen, // foreground (text) color
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Playfair', color: bottleGreen, fontSize: size),
        ),
      );
}

class ProjectDataWidget extends StatelessWidget {
  const ProjectDataWidget(this.title, this.description, this.category,
      this.startDate, this.endDate);
  final String title;
  final String description;
  final String category;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22, fontFamily: 'Playfair', color: Colors.white),
          ),
          Text(
            category,
            style: const TextStyle(
                fontSize: 18, fontFamily: 'Playfair', color: Colors.white60),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                startDate,
                style: const TextStyle(
                    fontSize: 16, fontFamily: 'Playfair', color: Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                endDate,
                style: const TextStyle(
                    fontSize: 16, fontFamily: 'Playfair', color: Colors.white),
              ),
            ],
          ),
          Text(
            description,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Playfair', color: Colors.white54),
          ),
        ],
      ));
}
