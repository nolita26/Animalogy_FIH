import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Dashboard.dart';
import 'package:fluttermoji/fluttermoji.dart';


class AvatarCreator extends StatefulWidget {
  const AvatarCreator({Key? key}) : super(key: key);

  @override
  State<AvatarCreator> createState() => _AvatarCreatorState();
}

class _AvatarCreatorState extends State<AvatarCreator> {

  late ConfettiController _controller;

  @override
  void initState() {
    _controller = ConfettiController(duration: const Duration(seconds: 4));
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Create your Avatar", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 22.0,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.black,),
            onPressed: () {
              _controller.play();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: FluttermojiCircleAvatar(
                  radius: 140,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FluttermojiCustomizer(
                  // scaffoldWidth: min(600, _width * 0.85),
                  autosave: false,
                  theme: FluttermojiThemeData(
                      boxDecoration: BoxDecoration(boxShadow: [BoxShadow()])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}