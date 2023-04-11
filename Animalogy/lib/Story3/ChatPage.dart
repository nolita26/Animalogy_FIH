import 'package:animalogy/Story3/ChatMessageModel.dart';
import 'package:animalogy/FadeAnimation.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  late double width;
  late double height;

  final String _user = "Jack";
  final String _message ="";
  // int conversationCount = 0;
  Chat chat =  Chat([]);
  List<List<ChatMessagePromptOptions>> allOptions = [];

  void send(){
    setState(() {
      chat.messages.add(ChatMessage(messageContent: _message, messageType: "Test",leftSide: false, onTap: setMessage));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    storePageData();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    allOptions = [
      [
        ChatMessagePromptOptions(option: "A", prompt: "Yes I am interested, please tell me more!",
          onTap: setMessage,
          confirmMessage:ChatMessage(
              messageContent: "Yes I am interested, please tell me more!",
              messageType: "A1",
              leftSide:false,
              onTap: setMessage
          ),
          // checkCen: ChatMessagePromp(checkCenter: false, messageContent: '', messageType: 'test', options: allOptions[])
        ),
        ChatMessagePromptOptions(option: "B", prompt: "Why are you contacting me?",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Why are you contacting me?",
                messageType: "B1",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You think - This look like a fake request",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
                messageType: "C1",
                leftSide:false,
                onTap: setMessage
            )
        )
      ],// option main
      [
        ChatMessagePromptOptions(option: "A", prompt: "Awesome, I’m coming over now.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Awesome, I’m coming over now.",
                messageType: "A11",
                leftSide:false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "Will anybody else be there?",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Will anybody else be there?",
                messageType: "A12",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
                messageType: "A13",
                leftSide:false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "D", prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
                messageType: "D2",
                leftSide:false,
                onTap: setMessage
            )
        ),
      ], // convo if A chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: "Awesome, I’m coming over now.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Awesome, I’m coming over now.",
                messageType: "A11",
                onTap: setMessage,
                leftSide: false
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
                messageType: "B2",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You don’t trust the person so you block them.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Friend get trafficked",
                messageType: "B13",
                leftSide:false,
                onTap: setMessage
            )
        )
      ], // convo if B1 chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: " “Of course, it’s safe! I don’t want to keep the Tiktoker waiting so I’ll talk to you later.”",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "(Sound of shackles and a black screen is shown.) When you have reached the house, they offer you a drink. After a few hours, you wake up in a dark room, and you realize you might have been drugged and kidnapped.",
                messageType: "A21",
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "You ask your friend: “What do you mean with it being a trap?”.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Will anybody else be there?",
                messageType: "A22",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You convince your friend to join you to the Tiktoker’s house as you tell them it’s safe to go there.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Your parents do not allow you to go to a stranger’s house. (Add advice)",
                messageType: "A23",
                leftSide:false,
                onTap: setMessage
            )
        )
      ], // convo if A2 chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: "You want to check if they are a real person so you video call them.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "The TikToker does not engage in a video call with you and tells you they also can't at another time.",
                messageType: "B3",
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "Since they have a lot of followers, you decide to go anyways",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "",
                messageType: "",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You decide to further investigate their profiles",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You notice that a lot of the followers of the Tiktoker’s account don’t have any pictures or information. The account names are odd, having a lot of random letter combinations without any meaning.",
                messageType: "B4",
                leftSide:false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "D", prompt: "You notice this is sketchy and decide to block them.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Friend get trafficked",
                messageType: "D",
                leftSide:false,
                onTap: setMessage
            )
        )
      ], // convo if B2 chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: "You text back: “Awesome, I’m coming over now.” (continue from aa)",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You are on your way to the Tiktoker’s house and meet a friend on the road. You inform your friend on where you’re going and the plans. Your friend asks you: “Do you think it’s safe to go there? Are you sure it’s not a trap?”.",
                messageType: "B11",
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "You check online whether this is a real Tik Tok influencer and look at their different social media profiles.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.",
                messageType: "B12",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: "You don’t trust the person so you block them.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Friend get trafficked",
                messageType: "B13",
                leftSide:false,
                onTap: setMessage
            )
        )
      ], // convo if C chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: "Since they have a lot of followers, you decide to go anyway.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Since they have a lot of followers, you decide to go anyway.",
                messageType: "B22",
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "You decide to further investigate their profiles.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You decide to further investigate their profiles.",
                messageType: "B23",
                leftSide: false,
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "C", prompt: " You notice this is sketchy and decide to block them.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You notice this is sketchy and decide to block them.",
                messageType: "B24",
                leftSide:false,
                onTap: setMessage
            )
        )
      ], // convo if B1 chosen
      [
        ChatMessagePromptOptions(option: "A", prompt: "Okay perfect, I'll be there!",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "Okay perfect, I'll be there!",
                messageType: "A11",
                onTap: setMessage
            )
        ),
        ChatMessagePromptOptions(option: "B", prompt: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
            onTap: setMessage,
            confirmMessage:ChatMessage(
                messageContent: "You inform your parents that a Tik Tok influencer has invited you to be in their next video and you ask your parents’ opinion about this.",
                messageType: "A13",
                leftSide: false,
                onTap: setMessage
            )
        ),
      ], // convo if A12 chosen
    ];

    chat = Chat(
        [
          ChatMessage(messageContent: "Hello Benita", messageType: "Test", onTap: setMessage),
          ChatMessage(messageContent: "How are you doing?", messageType: "Test", onTap: setMessage),
          ChatMessage(messageContent: "You wouldn't know me but I live in your neighbourhood.", messageType: "Test", onTap: setMessage),
          ChatMessage(messageContent: "I saw your videos on Facebook and they are so amazing! I'm a TikTok influencer and would like to collaborate with you on my next video! Would you like to join?", messageType: "Test", onTap: setMessage),
          ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[0], onTap: setMessage,),
        ]
    );

    super.initState();
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'chatPage');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  void setMessage(ChatMessage message){
    setState(() {
      // conversationCount++;
      chat.messages.add(message);});
    if(message.messageType == "A1") {
      List<ChatMessage> newMessages =  [
        ChatMessage(messageContent: "That’s great, you can meet me at Santa Clara and will record a Tik Tok video together.", messageType: "Test", onTap: setMessage, leftSide: true),
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[1], onTap: setMessage,),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "B1") {
      List<ChatMessage> newMessages =  [
        ChatMessage(
            messageContent: "From your profile I could see that you’re very talented and I want to give you the chance to also become a star.",
            messageType: "test",
            leftSide: true,
            onTap: setMessage
        ),
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[2], onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "A12") {
      List<ChatMessage> newMessages =  [
        ChatMessage(messageContent: "Yes! We will have other influencers present too, so you can socialize with them!", messageType: "test", onTap: setMessage, leftSide: true),
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[6], onTap: setMessage,),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "C1") {
      List<ChatMessage> newMessages =  [
        ChatMessage(messageContent: "You notice that they have a lot of followers, but none of their videos have many views so haven’t gone viral.", messageType: "Test", onTap: setMessage, leftSide: false),
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[3], onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "B3") {
      List<ChatMessage> newMessages =  [
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[6], onTap: setMessage,),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "B4") {
      List<ChatMessage> newMessages =  [
        ChatMessage(messageContent: "You notice this is sketchy and decide to block them.", messageType: "Test", onTap: setMessage, leftSide: false),
        ChatMessage(messageContent: "Friend gets trafficked", messageType: "Test", onTap: setMessage),
      ];
      chat.messages.addAll(newMessages);
    } else if(message.messageType == "A11") {
      List<ChatMessage> newMessages =  [
        StoryContainer(messageContent: "You are on your way to the Tiktoker’s house and meet a friend on the road. You inform your friend on where you’re going and the plans. Your friend asks you: “Do you think it’s safe to go there? Are you sure it’s not a trap?”.", messageType: "Test", onTap: setMessage),
        ChatMessagePromp(messageContent: "Select one of the options", messageType: "Test", options: allOptions[3], onTap: setMessage, ),
      ];
      chat.messages.addAll(newMessages);
    }
  }

  @override
  void dispose() {
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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,color: kChatThemeColor,),
                ),
                SizedBox(width: 2,),
                const CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${_user}',style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                Icon(Icons.phone,color: kThemeCColor, size: 30,),
                SizedBox(width: 15,),
                Icon(Icons.videocam_rounded,color: kThemeCColor, size: 30,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: Column(
                    children: chat.render()
                ),
              )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      onChanged:(value) {
                        // setMessage(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      send();
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.black,
                    elevation: 0,
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