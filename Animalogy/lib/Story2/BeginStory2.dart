import 'package:animalogy/Story1/Questions.dart';
import 'package:animalogy/Story2/Story2P1.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeginStoryP2 extends StatefulWidget {
  const BeginStoryP2({Key? key}) : super(key: key);

  @override
  State<BeginStoryP2> createState() => _BeginStoryP2State();
}

class _BeginStoryP2State extends State<BeginStoryP2> {

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
    await prefs.setString('currentPage', 'beginstoryP2');
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
          title: Text("Story"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Let's begin with", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 5,),
              Text("Story 2!", textAlign: TextAlign.start, style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 30,),
              Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.deepPurpleAccent
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "You have already met Meerkat and learned about his background in the first story. Now, let's meet Meerkat's friend, Drongo!",
                        style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                          onTap: () {
                            print("pressed!");
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => Questions()));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kYellowColor
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Let's Begin",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Icon(Icons.arrow_circle_right, color: Colors.white, size: 32,)
                              ],
                            ),
                          )
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}