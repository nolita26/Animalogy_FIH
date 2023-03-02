import 'package:animalogy/Story2/Story2P8.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P7 extends StatefulWidget {
  const Story2P7({Key? key}) : super(key: key);

  @override
  State<Story2P7> createState() => _Story2P7State();
}

class _Story2P7State extends State<Story2P7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P8()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/16.png'),
          ),
        ),
      ),
    );
  }
}
