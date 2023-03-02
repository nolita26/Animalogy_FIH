import 'package:animalogy/Story1/StoryP6.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryP5 extends StatefulWidget {
  const StoryP5({Key? key}) : super(key: key);

  @override
  State<StoryP5> createState() => _StoryP5State();
}

class _StoryP5State extends State<StoryP5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryP6()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/8.png'),
          ),
        ),
      ),
    );
  }
}
