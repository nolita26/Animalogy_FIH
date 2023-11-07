import 'package:animalogy/Home/NavigationPage.dart';
import 'package:animalogy/Story3/ChatPage.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeginStoryP3 extends StatefulWidget {
  const BeginStoryP3({Key? key}) : super(key: key);

  @override
  State<BeginStoryP3> createState() => _BeginStoryP3State();
}

class _BeginStoryP3State extends State<BeginStoryP3> {

  late double width;
  late double height;
  bool playing = false;

  @override
  void initState() {
    super.initState();
    //  storing to localdata
    storePageData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'beginstoryP3');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Story"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Let's begin with", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
              const SizedBox(height: 5,),
              const Text("Story 3!", textAlign: TextAlign.start, style: TextStyle(color: kChatThemeColor, fontWeight: FontWeight.bold, fontSize: 30),),
              const SizedBox(height: 20,),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: kChatThemeColor,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text("Someone sends you a message on Facebook. You don’t know them and have never seen them, but they claim to be from your neighborhood. They explain they are a Tik Tok influencer and would like to invite you to have you in their next dance video.",
                        style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                          onTap: () {
                            print("pressed!");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kYellowColor
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Let's Begin",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                SizedBox(width: 12,),
                                Icon(Icons.arrow_circle_right, color: Colors.white, size: 32,)
                              ],
                            ),
                          ),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {
                    print("pressed!");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage()));
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 200,
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kYellowColor
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Dashboard",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(width: 12,),
                          Icon(Icons.arrow_circle_right, color: Colors.white, size: 32,)
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
