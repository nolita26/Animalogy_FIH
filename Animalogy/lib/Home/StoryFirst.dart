import 'package:animalogy/Dashboard.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/StorySecond.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryFirst extends StatefulWidget {
  const StoryFirst({Key? key}) : super(key: key);

  @override
  State<StoryFirst> createState() => _StoryFirstState();
}

class _StoryFirstState extends State<StoryFirst> {

  late double width;
  late double height;
  late AudioPlayer player;
  bool playing = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    play();
    playing = true;

  //  storing to localdata
    storePageData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'storyFirst');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset(
        'assets/audio/1.m4a');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset(
        'assets/audio/1.m4a');
    player.pause();
    setState(() {
      playing = false;
    });
  }

  Future<void> resume() async {
    player.play();
    setState(() {
      playing = true;
    });
  }

  void playPause(){
    if(playing){
      pause();
    }
    else{
      resume();
    }
  }

  @override
  void dispose() {
    player.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kContainerColor,
        body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const AspectRatio(
               aspectRatio: 3.77/2,
                  child: Image(
                        image: AssetImage('assets/Backgrounds/1.png'),
                        alignment: Alignment.center,
                        fit: BoxFit.fill
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kDefaultIconLightColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> Dashboard()));
                      },
                      child: const Text('Previous',
                        style: TextStyle(
                          color: Colors.black,
                        ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () async {
                         playPause();
                        },
                        icon: playing? Icon(Icons.pause, color: Colors.black,): Icon(Icons.play_arrow, color: Colors.black,)
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kDefaultIconLightColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> StorySecond()));
                        },
                      child: const Text('Next',
                        style: TextStyle(
                          color: Colors.black,
                        ),),
                    ),
                  ),
                ],
              ),
            ],
        ),
    );
  }
}
