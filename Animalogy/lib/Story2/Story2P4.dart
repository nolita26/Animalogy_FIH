import 'package:animalogy/Story2/Story2P5.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P4 extends StatefulWidget {
  const Story2P4({Key? key}) : super(key: key);

  @override
  State<Story2P4> createState() => _Story2P4State();
}

class _Story2P4State extends State<Story2P4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P5()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/14.png'),
          ),
        ),
      ),
    );
  }
}
