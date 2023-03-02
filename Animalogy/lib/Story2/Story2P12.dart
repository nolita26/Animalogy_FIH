import 'package:animalogy/Story2/Story2P13.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P12 extends StatefulWidget {
  const Story2P12({Key? key}) : super(key: key);

  @override
  State<Story2P12> createState() => _Story2P12State();
}

class _Story2P12State extends State<Story2P12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P13()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/19.png'),
          ),
        ),
      ),
    );
  }
}
