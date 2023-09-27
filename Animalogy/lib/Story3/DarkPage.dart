import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DarkPage extends StatefulWidget {
  const DarkPage({Key? key}) : super(key: key);

  @override
  State<DarkPage> createState() => _DarkPageState();
}

class _DarkPageState extends State<DarkPage> {
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/Backgrounds/dark_room.png'),
                alignment: Alignment.center,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(28, 100, 28, 250),
              child: Container(
                color: Colors.transparent, // Change the color as desired
                child: Center(
                  child: TypewriterAnimatedTextKit(
                    text: ['When your friend reach the house, they got drugged and kidnapped. You never heard from them again!'],
                    textStyle: TextStyle(
                      fontSize: 22.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    speed: Duration(milliseconds: 100),
                    /*totalRepeatCount: 1,*/
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
