import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFFf9f5f1),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/Backgrounds/dark_room.png'),
                alignment: Alignment.center,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 50),
                child: Text(
                  "When your friend reach the house, they got drugged and kidnapped. You never heard from them again.",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
