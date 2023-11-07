import 'package:animalogy/Home/HomePage.dart';
import 'package:animalogy/Story1/BeginStory1.dart';
import 'package:animalogy/Story2/BeginStory2.dart';
import 'package:animalogy/Story3/BeginStory3.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FirstPage.dart';

class NavigationPage extends StatefulWidget {
  String username = '';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late double width;
  late double height;

  TextEditingController nameController = TextEditingController();

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'navigationPage');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  @override
  void initState() {
    super.initState();
    widget.username = userDataModel.getUsername();

    //  storing to localdata
    storePageData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    nameController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFf9f5f1),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFf9f5f1),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/wow-image.png', width: 450.0, height: 200.0,),
                InkWell(
                    onTap: () {
                      widget.username = userDataModel.getUsername();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(widget.username)));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                    child: Container(
                      height: 60,
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kYellowColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.home, color: Colors.white, size: 32,),
                          SizedBox(width: 15),
                          Text('Home   ',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                ),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginStoryP1()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                    child: Container(
                        height: 60,
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kChatThemeColor,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_circle_right_rounded, color: Colors.white, size: 32,),
                            SizedBox(width: 15),
                            Text('Story 1',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                    ),
                ),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginStoryP2()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                    child: Container(
                        height: 60,
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kYellowColor,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_circle_right_rounded, color: Colors.white, size: 32,),
                            SizedBox(width: 15),
                            Text('Story 2',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                    ),
                ),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginStoryP3()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                    child: Container(
                        height: 60,
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kChatThemeColor,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.arrow_circle_right_rounded, color: Colors.white, size: 32,),
                            SizedBox(width: 15),
                            Text('Story 3',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
