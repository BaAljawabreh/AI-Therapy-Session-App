import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ChatPage.dart';
import 'UserProfilePage.dart';
import 'MenuItems.dart';
import 'MenuDrawer.dart';
import 'package:dialogflow_flutter_plus/dialogflowFlutter.dart';
import 'package:dialogflow_flutter_plus/googleAuth.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map> messages = [];
  final messageController = TextEditingController();

  /////////////Integrating and Fetching responses from DialogFlow
  void response(query) async {
    // Simulate typing delay
    await Future.delayed(Duration(seconds: 1));

    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/servicesNew.json").build();
    DialogFlow dialogflow = DialogFlow(authGoogle: authGoogle, language: 'en');
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    print("DialogFlow Response: ${aiResponse.toString()}");

    setState(() {
      // Add a typing indicator message
      messages.insert(0, {
        "data": 0, // 1 represents bot typing message
        "message": "Typing...",
      });
    });
    // Simulate processing delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Remove the typing indicator message and add the actual response
      messages.removeAt(0);
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()?[0]["text"]["text"][0].toString()
      });
    });
    print(aiResponse.getListMessage()?[0]["text"]["text"][0].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

///////////////Page Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF099BAC),
        elevation: 5,
        // Adjust the elevation as needed
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
            //alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 0),
            icon: Image.asset(
              'assets/TheraBotImg.png',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutThera()),
              );
            },
          ),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Thera',
                style: TextStyle(
                  color: Color(0xFFDDE6EA),
                  fontSize: 28,
                  fontFamily: 'Quintessential',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_rounded, color: Color(0xFFDDE6EA), size: 30),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),

///////////////Invoke MenuDrawer class
      endDrawer: CustomEndDrawer(context: context),

//////////////Interface Body
      body: Center(
        child: Container(
          width: 430,
          height: 932,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          child: Column(
            children: [
//////////////////Date
              Container(
                padding: EdgeInsets.only(top: 11, bottom: 9),
                child: Text(
                  "Today, ${DateFormat("Hm").format(DateTime.now())}",
                  style: TextStyle(fontSize: 20, color: Colors.white24),
                ),
              ),
//////////////Bubbles
              Flexible(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) => chat(
                          messages[index]["message"].toString(),
                          messages[index]["data"]
                      )
                  )
              ),
              SizedBox(
                height: 20,
              ),
////////////////Chat Style
              Container(
                child: ListTile(
                  title: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                    padding: EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Enter a message...",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      onChanged: (value) {},
                    ),
                  ),
                  trailing: IconButton( //send button
                      icon: Icon(
                        Icons.send,
                        size: 30.0,
                        color: Color(0xFF099BAC),
                      ),
                      onPressed: () {
                        if (messageController.text.isEmpty) {
                          print("empty message");
                        } else {
                          setState(() {
                            messages.insert(0,
                                {"data": 1, "message": messageController.text});
                          });
                          response(messageController.text);
                          messageController.clear();
                        }
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////////////Chat method
Widget chat(String message, int data) {
  return Container(
    padding: EdgeInsets.only(left: 17, right: 10),
    child: Row(
      mainAxisAlignment:
      data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        data == 0 ? Container(
          height: 30, width: 30,
          child: Image.asset("assets/TheraBotIcon.png"),
        ) : Container(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Bubble(
              radius: Radius.circular(15.0),
              color: data == 0 ? Color(0xFF099BAC) : Color(0xFFDDE6EA),
              elevation: 0.0,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: data == 0 ? Color(0xFFDDE6EA) : Color(0xFF252525),
                            ),
                          ),
                        ))
                  ],
                ),
              )
          ),
        ),
        data == 1 ? Container(
          height: 5, width: 5,
        ) : Container(),
      ],
    ),
  );
}