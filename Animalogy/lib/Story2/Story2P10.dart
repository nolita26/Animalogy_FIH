import 'package:animalogy/Story2/Story2P11.dart';
import 'package:animalogy/Story2/Story2P9.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Story2P10 extends StatefulWidget {
  const Story2P10({Key? key}) : super(key: key);

  @override
  State<Story2P10> createState() => _Story2P10State();
}

class _Story2P10State extends State<Story2P10> {
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
    await prefs.setString('currentPage', 'story2P4');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/19.m4a');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/19.m4a');
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

  void playPause() {
    if(playing) {
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
      backgroundColor: const Color(0xFFbb7735),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Stack(children: <Widget>[
              const Center(
                child: Image(
                    image: AssetImage('assets/Backgrounds/19.png'),
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
                      isSelected: standardSelected,
                      icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white, size: 35,),
                      onPressed: () {
                        setState(() {
                          standardSelected = !standardSelected;
                        });
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Story2P9()));
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                        isSelected: standardSelected,
                        onPressed: () async {
                          setState(() {
                            standardSelected = !standardSelected;
                          });
                          playPause();
                        },
                        icon: playing
                            ? const Icon(Icons.pause, size: 35, color: Colors.white,)
                            : const Icon(Icons.play_arrow, size: 35, color: Colors.white,)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      isSelected: standardSelected,
                      hoverColor: Colors.black.withOpacity(0.8),
                      icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 35,),
                      onPressed: () {
                        setState(() {
                          standardSelected = !standardSelected;
                        });
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Story2P11()));
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
