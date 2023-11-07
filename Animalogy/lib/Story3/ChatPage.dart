import 'dart:async';
import 'package:animalogy/Story3/BeginStory3.dart';
import 'package:animalogy/Story3/ChatMessageModel.dart';
import 'package:animalogy/Story3/DarkPage.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import '../Home/FirstPage.dart';

class ChatPage extends StatefulWidget {
  String username = '';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  late double width;
  late double height;
  late AudioPlayer player;
  bool playing = false;

  final String _user = "Jack";
  final String _message = "";
  // int conversationCount = 0;
  Chat chat = Chat([]);
  List<List<ChatMessagePromptOptions>> allOptions = [];

  final ScrollController _scrollController = ScrollController();

  void send() {
    setState(() {
      chat.messages.add(ChatMessage(
          messageContent: _message,
          messageType: "Test",
          leftSide: false,
          onTap: setMessage));
    });
  }

  void shackle() {
    setState(() async {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DarkPage()));
    });
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/msg_tone.m4r');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/msg_tone.m4r');
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
    if (playing) {
      pause();
    } else {
      resume();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    widget.username = userDataModel.getUsername();
    player = AudioPlayer();
    play();
    playing = true;

    //  storing to localdata
    storePageData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    allOptions = [
      [
        ChatMessagePromptOptions(
          option: "A",
          prompt: "Yes I am interested, please tell me more!",
          onTap: setMessage,
          confirmMessage: ChatMessage(
              messageContent: "Yes I am interested, please tell me more!",
              messageType: "A1",
              leftSide: false,
              onTap: setMessage),
        ),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "Why are you contacting me?",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Why are you contacting me?",
                messageType: "B1",
                leftSide: false,
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You think - This look like a fake request",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
                messageType: "C1",
                onTap: setMessage))
      ], // option main
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Awesome, I’m coming over now.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Awesome, I’m coming over now.",
                messageType: "A11",
                leftSide: false,
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "Will anybody else be there?",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Will anybody else be there?",
                messageType: "A12",
                leftSide: false,
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
                messageType: "A13",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "D",
            prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
                messageType: "A14", //"D2"
                leftSide: false,
                onTap: setMessage)),
      ], // convo if A chosen 1
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Awesome, I’m coming over now.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Awesome, I’m coming over now.",
                messageType: "A11",
                onTap: setMessage,
                leftSide: false)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
                messageType: "B2",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You don’t trust the person so you block them.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
                messageType: "D",
                onTap: setMessage))
      ], // convo if B1 chosen 2
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Of course, it’s safe! I don’t want to keep the Tiktoker waiting so I’ll talk to you later.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "",
                messageType: "E",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You ask your friend: “What do you mean with it being a trap?”.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Sometimes there are fake accounts so you should make sure it is real and safe to go.",
                messageType: "A6",
                leftSide: false,
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You convince your friend to join you to the Tiktoker’s house as you tell them it’s safe to go there.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "",
                messageType: "E",
                onTap: setMessage))
      ], // convo if A2 chosen 3
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "You want to check if they are a real person so you video call them.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "The TikToker does not engage in a video call with you and tells you they also can't at another time.",
                messageType: "B3",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "Since they have a lot of followers, you decide to go anyways",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Awesome, I'm coming over now.",
                messageType: "A11",
                leftSide: false,
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You decide to further investigate their profiles",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You notice that a lot of the followers of the Tiktoker’s account don’t have any pictures or information. The account names are odd, having a lot of random letter combinations without any meaning. You decide to block them.",
                messageType: "B4",
                onTap: setMessage)),
        /*ChatMessagePromptOptions(
            option: "D",
            prompt: "You notice this is sketchy and decide to block them.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
                messageType: "D",
                onTap: setMessage))*/
      ], // convo if B2 chosen 4
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "You text back: “Awesome, I’m coming over now.” (continue from aa)",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You are on your way to the Tiktoker’s house and meet a friend on the road. You inform your friend on where you’re going and the plans. Your friend asks you: “Do you think it’s safe to go there? Are you sure it’s not a trap?”.",
                messageType: "B11",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
                messageType: "B12",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You don’t trust the person so you block them.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
                messageType: "D",
                onTap: setMessage))
      ], // convo if C chosen 5
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Since they have a lot of followers, you decide to go anyway.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Since they have a lot of followers, you decide to go anyway.",
                messageType: "A1",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You decide to further investigate their profiles.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "You notice that a lot of the followers of TikToker's account don't have any pictures or information. The account names are odd, having a lot of random letter combinations without any meaning.",
                messageType: "B4",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You notice this is sketchy and decide to block them.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
                messageType: "D",
                onTap: setMessage))
      ], // convo if B3 chosen 6
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Okay perfect, I'll be there!",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Okay perfect, I'll be there!",
                messageType: "A31", //"A11"
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
                messageType: "A13",
                onTap: setMessage)),
      ], // convo if A12 chosen 7
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "You listen to your parents and decide to block the person.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
                messageType: "D",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You ignore your parent's advice and go to the TikToker's house.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "",
                messageType: "E",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You don't go to their house, but continue to have a conversation with them on instagram. You share funny TikTok videos with each other, and you figure out you have the same sense of humour. The two create a bond.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "The TikToker invites you over to their house again to record a video with you",
                messageType: "A5",
                onTap: setMessage)),
      ], // convo if A5 chosen 8
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "Awesome, I'm coming over now.",
            onTap: setMessage,
            confirmMessage: ChatMessage(
                messageContent: "Awesome, I'm coming over now.",
                messageType: "A11",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "You check online whether this is a real TikTok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "You check online whether this is a real TikTok influencer and look at their different social media profiles.",
                messageType: "A14",
                onTap: setMessage)),
      ], // convo if A13 chosen 9
      [
        ChatMessagePromptOptions(
            option: "A",
            prompt: "You warn your friend it's sketchy, and they should block the TikToker.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Your friend does not listen to you and goes to the house of the TikToker.",
                messageType: "D2",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "B",
            prompt: "Your friend convinces you that the TikToker is to be trusted, they assure you that nothing bad will happen.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "",
                messageType: "E",
                onTap: setMessage)),
        ChatMessagePromptOptions(
            option: "C",
            prompt: "You advise your friend to tell their parents about the TikToker.",
            onTap: setMessage,
            confirmMessage: StoryContainer(
                messageContent: "Your friend does not want to tell their parents and goes to the house of the TikToker.",
                messageType: "D3",
                onTap: setMessage)),
      ], // convo if D1 chosen 10
    ];

    chat = Chat([
      ChatMessage(
          messageContent: "Hello ${widget.username}",
          messageType: "Test",
          onTap: setMessage),
      ChatMessage(
          messageContent: "How are you doing?",
          messageType: "Test",
          onTap: setMessage),
      ChatMessage(
          messageContent: "You wouldn't know me but I live in your neighbourhood.",
          messageType: "Test",
          onTap: setMessage),
      ChatMessage(
          messageContent: "I saw your videos on Facebook and they are so amazing! I'm a TikTok influencer and would like to collaborate with you on my next video! Would you like to join?",
          messageType: "Test",
          onTap: setMessage),
      ChatMessagePromp(
        messageContent: "Select one of the options",
        messageType: "Test",
        options: allOptions[0],
        onTap: setMessage,
      ),
    ]);

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'chatPage');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  void setMessage(ChatMessage message) {
    setState(() {
      // conversationCount++;
      chat.messages.add(message);
      play();
    });
    if(message.messageType == "A1") {
      play();
      List<ChatMessage> newMessages = [
        ChatMessage(
            messageContent: "That’s great, you can meet me at Shobhabazar and will record a Tik Tok video together.",
            messageType: "Test",
            onTap: setMessage,
            leftSide: true),
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[1],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "B1") {
      play();
      List<ChatMessage> newMessages = [
        ChatMessage(
            messageContent: "From your profile I could see that you’re very talented and I want to give you the chance to also become a star.",
            messageType: "test",
            leftSide: true,
            onTap: setMessage),
        ChatMessagePromp(
            messageContent: "Select one of the options",
            messageType: "Test",
            options: allOptions[2],
            onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A12") {
      play();
      List<ChatMessage> newMessages = [
        ChatMessage(
            messageContent: "Yes! We will have other influencers present too, so you can socialize with them!",
            messageType: "test",
            onTap: setMessage,
            leftSide: true),
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[7],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A13") {
      play();
      List<ChatMessage> newMessages = [
        StoryContainer(
            messageContent: "Your parents do not allow you to go to a stranger's house, (add advice)",
            messageType: "test",
            onTap: setMessage),
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[8],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A14") {
      play();
      List<ChatMessage> newMessages = [
        StoryContainer(
            messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
            messageType: "Test",
            onTap: setMessage),
        ChatMessagePromp(
            messageContent: "Select one of the options",
            messageType: "Test",
            options: allOptions[4],
            onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A5") {
      List<ChatMessage> newMessages = [
        ChatMessagePromp(
            messageContent: "Select one of the options",
            messageType: "Test",
            options: allOptions[9],
            onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A6") {
      play();
      List<ChatMessage> newMessages = [
        StoryContainer(
            messageContent: "You check online whether this is a real TikTok influencer and look at their different social media profiles. You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral. ",
            messageType: "Test",
            onTap: setMessage),
        ChatMessagePromp(
            messageContent: "Select one of the options",
            messageType: "Test",
            options: allOptions[4],
            onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "C1") {
      play();
      List<ChatMessage> newMessages = [
        StoryContainer(
            messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
            messageType: "Test",
            onTap: setMessage),
        ChatMessagePromp(
            messageContent: "Select one of the options",
            messageType: "Test",
            options: allOptions[4],
            onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "B2") {
      List<ChatMessage> newMessages = [
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[4],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "B3") {
      List<ChatMessage> newMessages = [
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[6],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "B4") {
      List<ChatMessage> newMessages = [
/*        StoryContainer(
            messageContent:
                "You notice this is sketchy and decide to block them.",
            messageType: "Test",
            onTap: setMessage),*/
        StoryContainer(
            messageContent: "Soon after you have blocked the TikToker, your friend comes to you and tells you they have received a message from a TikToker, asking them to be in their video.",
            messageType: "Test",
            onTap: setMessage),
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[10],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "A11" || message.messageType == "A31") {
      List<ChatMessage> newMessages = [
        StoryContainer(
            messageContent: "You are on your way to the TikToker’s house and meet a friend on the road. You inform your friend on where you’re going and the plans. Your friend asks you: “Do you think it’s safe to go there? Are you sure it’s not a trap?”.",
            messageType: "Test",
            onTap: setMessage),
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[3],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    } else if (message.messageType == "D") {
      List<ChatMessage> newMessages = [
        ChatMessagePromp(
          messageContent: "Select one of the options",
          messageType: "Test",
          options: allOptions[10],
          onTap: setMessage,
        ),
      ];
      chat.messages.addAll(newMessages);
    }
    //  else if (message.messageType == "D1") {
    //   List<ChatMessage> newMessages = [
    //     ChatMessagePromp(
    //       messageContent: "Select one of the options",
    //       messageType: "Test",
    //       options: allOptions[10],
    //       onTap: setMessage,
    //     ),
    //   ];
    //   chat.messages.addAll(newMessages);}
     else if (message.messageType == "D2" || message.messageType == "D3" || message.messageType == "E") {
       pause();
       shackle();
    }
  }

  // Function to scroll to the bottom of the chat.
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollController = Scrollable.of(context);
      scrollController.position.ensureVisible(
        (chat.messages.isNotEmpty ? chat.messages.length - 1 : 0) as RenderObject,
        alignment: 1.0,
        duration: Duration(milliseconds: 300),
      );
    });
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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginStoryP3()));
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: kChatThemeColor,),
                ),
                const SizedBox(width: 2,),
                const CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_user,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6,),
                      Text("Online",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.phone, color: kThemeCColor, size: 30,),
                const SizedBox(width: 15,),
                const Icon(Icons.videocam_rounded, color: kThemeCColor, size: 30,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                    children: chat.render()
                ),
              )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20,),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // setMessage(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: () {
                      send();
                    },
                    backgroundColor: Colors.black,
                    elevation: 0,
                    child: const Icon(Icons.send, color: Colors.white, size: 18,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
