import 'package:animalogy/Story2/Story2P15.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P14 extends StatefulWidget {
  const Story2P14({Key? key}) : super(key: key);

  @override
  State<Story2P14> createState() => _Story2P14State();
}

class _Story2P14State extends State<Story2P14> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Story2P15()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Image.asset('assets/Backgrounds/30.png'),
          ),
        ),
      ),
    );
  }
}
