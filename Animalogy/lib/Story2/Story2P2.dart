import 'package:animalogy/Story2/Story2P3.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P2 extends StatefulWidget {
  const Story2P2({Key? key}) : super(key: key);

  @override
  State<Story2P2> createState() => _Story2P2State();
}

class _Story2P2State extends State<Story2P2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P3()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/12.png'),
          ),
        ),
      ),
    );
  }
}
