import 'package:animalogy/Story1/StoryP3.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryP2 extends StatefulWidget {
  const StoryP2({Key? key}) : super(key: key);

  @override
  State<StoryP2> createState() => _StoryP2State();
}

class _StoryP2State extends State<StoryP2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryP3()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/33.png'),
          ),
        ),
      ),
    );
  }
}
