import 'package:animalogy/Story2/Story2P2.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P1 extends StatefulWidget {
  const Story2P1({Key? key}) : super(key: key);

  @override
  State<Story2P1> createState() => _Story2P1State();
}

class _Story2P1State extends State<Story2P1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P2()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/10.png'),
          ),
        ),
      ),
    );
  }
}
