import 'package:animalogy/Story1/StoryP1.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StorySecond extends StatefulWidget {
  const StorySecond({Key? key}) : super(key: key);

  @override
  State<StorySecond> createState() => _StorySecondState();
}

class _StorySecondState extends State<StorySecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kContainerColor,
        body: GestureDetector(
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StoryP1()));
        },
          child: Center(
            child: RotatedBox(
              quarterTurns:3,
              child: Image.asset('assets/Backgrounds/3.png'),
            ),
          ),
        ),
    );
  }
}
