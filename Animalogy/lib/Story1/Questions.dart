import 'package:animalogy/Story2/Story2P1.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P1()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/9.png'),
        ),
      ),
    ));
  }
}
