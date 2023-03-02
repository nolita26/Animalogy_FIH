import 'package:animalogy/Story1/StoryQuiz.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryP4 extends StatefulWidget {
  const StoryP4({Key? key}) : super(key: key);

  @override
  State<StoryP4> createState() => _StoryP4State();
}

class _StoryP4State extends State<StoryP4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryQuiz()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/7.png'),
          ),
        ),
      ),
    );
  }
}
