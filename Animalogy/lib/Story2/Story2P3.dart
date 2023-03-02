import 'package:animalogy/Story2/Story2P4.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P3 extends StatefulWidget {
  const Story2P3({Key? key}) : super(key: key);

  @override
  State<Story2P3> createState() => _Story2P3State();
}

class _Story2P3State extends State<Story2P3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P4()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/13.png'),
          ),
        ),
      ),
    );
  }
}
