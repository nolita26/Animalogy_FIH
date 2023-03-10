import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/AvatarCreator.dart';
import 'package:fluttermoji/fluttermoji.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage(this.name);
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f5f1),
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFf9f5f1),
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hi", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        SizedBox(width: 5,),
                        Text(widget.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        Text("!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Text("Let's Create Your", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPurpleColor),),
                    SizedBox(height: 10,),
                    Text("Avatar", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: kYellowColor),),
                    SizedBox(height: 25,),
                    Center(
                      child: FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 120,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 30),
                      child: Text("Make an animated version of yourself to enjoy the learning!", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black54),),
                    ),
                    SizedBox(height: 35,),
                    Row(
                      children: [
                        Spacer(flex: 2),
                        Expanded(
                          flex: 7,
                          child: FloatingActionButton.extended(
                            label: Text("Let's get started", style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),),
                            backgroundColor: Colors.black,
                            icon: Icon(
                              Icons.edit,
                              size: 26.0,
                            ),
                            onPressed: () => Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => AvatarCreator())),
                          ),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  ],
                )
            ),
          )
        )
    );
  }
}

