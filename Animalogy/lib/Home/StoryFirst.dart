import 'package:animalogy/Home/StorySecond.dart';
import 'package:animalogy/Story1/BeginStory1.dart';
import 'package:flutter/material.dart';
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
  bool standardSelected = false;

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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: const Color(0xFFe5ab96),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Stack(children: <Widget>[
                  const Center(
                    child: Image(
                        image: AssetImage('assets/Backgrounds/1.png'),
                        alignment: Alignment.center,
                        fit: BoxFit.cover
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white, size: 35,),
                            onPressed: () {
                              pause();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginStoryP1()));
                            },
                          ),
                      ),
                      Align(
                        alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () async {
                                playPause();
                              },
                              icon: playing ? Visibility( visible: !playing, child: const Icon(Icons.pause, size: 50, color: Colors.white,))
                                  : Visibility( visible: !playing, child: const Icon(Icons.play_arrow, size: 50, color: Colors.white,))
                          ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          hoverColor: Colors.black.withOpacity(0.8),
                          icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 35,),
                          onPressed: () {
                            pause();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const StorySecond()));
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Align(
              //       alignment: Alignment.bottomLeft,
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             primary: kDefaultIconLightColor,
              //             padding: const EdgeInsets.symmetric(
              //                 horizontal: 10, vertical: 10),
              //             textStyle: const TextStyle(
              //                 fontSize: 15, fontWeight: FontWeight.bold)),
              //         onPressed: () {
              //           pause();
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => StorySecond()));
              //         },
              //         child: const Text(
              //           'Previous',
              //           style: TextStyle(
              //             color: Colors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.center,
              //       child: IconButton(
              //           onPressed: () async {
              //             playPause();
              //           },
              //           icon: playing
              //               ? Icon(
              //             Icons.pause,
              //             color: Colors.black,
              //           )
              //               : Icon(
              //             Icons.play_arrow,
              //             color: Colors.black,
              //           )),
              //     ),
              //     Align(
              //       alignment: Alignment.bottomRight,
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             primary: kDefaultIconLightColor,
              //             padding: const EdgeInsets.symmetric(
              //                 horizontal: 10, vertical: 10),
              //             textStyle: const TextStyle(
              //                 fontSize: 15, fontWeight: FontWeight.bold)),
              //         onPressed: () {
              //           pause();
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => StoryP2()));
              //         },
              //         child: const Text(
              //           'Next',
              //           style: TextStyle(
              //             color: Colors.black,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
      ),
    );
  }
}
