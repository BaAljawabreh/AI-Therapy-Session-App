import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ChatPage.dart';
import 'MenuItems.dart';
import 'MenuDrawer.dart';
import 'package:get/get.dart';
import 'FirebaseClasses.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}
class _UserProfilePageState extends State<UserProfilePage>  {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      key: _scaffoldKey,

///////////////Page Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF099BAC),
        elevation: 5, // Adjust the elevation as needed
        leading: Padding(
          padding: EdgeInsets.only(left: 11),
          child: Icon(Icons.account_circle, color: Color(0xFFDDE6EA), size: 35,),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'User Profile',
                style: TextStyle(
                  color: Color(0xFFDDE6EA),
                  fontSize: 24,
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
      body: SingleChildScrollView(
        child: Container(
/////////////Interface Style
          width: 430, height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 90),

///////////////Username Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Color(0xFFA6A6A6)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined, color: Color(0xFFDDE6EA),size: 32,),
                    labelStyle: TextStyle(
                      color: Color(0xFFA6A6A6),
                      fontFamily: 'Catamaran',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                  ),
                  controller: controller.usernameController,
                  readOnly: true,
                ),),
              SizedBox(height: 60),

///////////////Email Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Color(0xFFA6A6A6)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: Color(0xFFDDE6EA),size: 30,),
                    labelStyle: TextStyle(
                      color: Color(0xFFA6A6A6),
                      fontFamily: 'Catamaran',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                  ),
                  controller: controller.emailController,
                  readOnly: true,
                ),),
              SizedBox(height: 60),

///////////////Password Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Color(0xFFA6A6A6)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined, color: Color(0xFFDDE6EA),size: 30,),
                    labelStyle: TextStyle(
                      color: Color(0xFFA6A6A6),
                      fontFamily: 'Catamaran',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                    ),
                  ),
                  controller: controller.passwordController,
                  readOnly: true,
                  obscureText: true,
                ),),
              SizedBox(height: 90),

//////////////Logout Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );},
                    child: Text( 'Log out',
                      style: TextStyle(
                        color: Color(0xFFDDE6EA), // Updated text color
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 70),//42
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Color(0xFF099BAC),
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Catamaran',
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
