import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Dashboard.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarCreator extends StatefulWidget {
  const AvatarCreator({Key? key}) : super(key: key);

  @override
  State<AvatarCreator> createState() => _AvatarCreatorState();
}

class _AvatarCreatorState extends State<AvatarCreator> {

  late ConfettiController _controller;

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'avatarCreator');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<bool> _onBackPressed() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Do you want to exit the app?'),
          actions: <Widget> [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            GestureDetector(
              onTap: () => SystemNavigator.pop(),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  void initState() {
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _controller.play();
    super.initState();

    //  storing to localdata
    storePageData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Create your Avatar", style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 22.0,
              color: Colors.black,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
              },
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save, color: Colors.black,),
              onPressed: () {
                _controller.play();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
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
                        boxDecoration: const BoxDecoration(boxShadow: [BoxShadow()])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}