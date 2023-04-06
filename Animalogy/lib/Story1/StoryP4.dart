import 'package:animalogy/Story1/StoryP3.dart';
import 'package:animalogy/Story1/StoryP5.dart';
import 'package:animalogy/Story1/StoryQuiz.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryP4 extends StatefulWidget {
  const StoryP4({Key? key}) : super(key: key);

  @override
  State<StoryP4> createState() => _StoryP4State();
}

class _StoryP4State extends State<StoryP4> {

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
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'storyP4');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset(
        'assets/audio/6.m4a');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset(
        'assets/audio/6.m4a');
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
                image: AssetImage('assets/Backgrounds/6.png'),
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
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> StoryP3()));
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
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> StoryP5()));
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
