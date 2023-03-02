import 'package:animalogy/Story2/Story2P11.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P10 extends StatefulWidget {
  const Story2P10({Key? key}) : super(key: key);

  @override
  State<Story2P10> createState() => _Story2P10State();
}

class _Story2P10State extends State<Story2P10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P11()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/21.png'),
          ),
        ),
      ),
    );
  }
}
