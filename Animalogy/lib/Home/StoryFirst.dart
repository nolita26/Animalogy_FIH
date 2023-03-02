import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/StorySecond.dart';
import 'package:animalogy/FadeAnimation.dart';
import 'package:fluttermoji/fluttermoji.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio_cache/just_audio_cache.dart';

class StoryFirst extends StatefulWidget {
  const StoryFirst({Key? key}) : super(key: key);

  @override
  State<StoryFirst> createState() => _StoryFirstState();
}

class _StoryFirstState extends State<StoryFirst> {

  // AudioCache audioCache = AudioCache();
  // audioCache.load('A.m4a');
  // audioCache.play('A.m4a');
  //
  // late AudioPlayer player;
  // @override
  // void initState() {
  //   super.initState();
  //   player = AudioPlayer();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await audioCache.load('A.m4a'); // I don't sure it need await or not in load file
  //     player = await audioCache.play('A.m4a');
  //   };
  // }
  //
  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kContainerColor,
        body: GestureDetector(
          onTap: () {
            // Timer(Duration(seconds:3), (){
            //   player?.stop();
            //   });
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> StorySecond()));
          },
          child: Center(
              child: RotatedBox(
                quarterTurns:3,
                child: Image.asset('assets/Backgrounds/1.png'),
              ),
          ),
        ),
    );
  }
}
