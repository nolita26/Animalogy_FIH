import 'dart:core';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/AvatarCreator.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  dynamic name;
  HomePage(this.name, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'homePage');
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
    super.initState();
    //  storing to localdata
    storePageData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: const Color(0xFFf9f5f1),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Hi",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(width: 5,),
                          Text(widget.name,
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const Text("!",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      const Text("Let's Create Your",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPurpleColor),
                      ),
                      const SizedBox(height: 10,),
                      const Text("Avatar",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: kYellowColor),
                      ),
                      const SizedBox(height: 25,),
                      Center(
                        child: FluttermojiCircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 120,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 30),
                        child: Text("Make an animated version of yourself to enjoy the learning!",
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 35,),
                      Row(
                        children: [
                          const Spacer(flex: 2),
                          Expanded(
                            flex: 7,
                            child: FloatingActionButton.extended(
                              label: const Text("Let's get started",
                                style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
                              ),
                              backgroundColor: Colors.black,
                              icon: const Icon(Icons.edit, size: 26.0),
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AvatarCreator())),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ],
                  )
              ),
            )
          )
      ),
    );
  }
}

