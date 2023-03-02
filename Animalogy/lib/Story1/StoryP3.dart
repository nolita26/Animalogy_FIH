import 'package:animalogy/Story1/StoryP4.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryP3 extends StatefulWidget {
  const StoryP3({Key? key}) : super(key: key);

  @override
  State<StoryP3> createState() => _StoryP3State();
}

class _StoryP3State extends State<StoryP3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryP4()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/5.png'),
          ),
        ),
      ),
    );
  }
}
