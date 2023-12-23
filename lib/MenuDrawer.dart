import 'package:flutter/material.dart';
import 'ChatPage.dart';
import 'UserProfilePage.dart';
import 'MenuItems.dart';

class CustomEndDrawer extends StatelessWidget {
  final BuildContext context;
  const CustomEndDrawer({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      child: Drawer(
        width: 240,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF099BAC),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(''),
              ),

              ListTile(
                title: Text(
                  'Chat Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 26,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Quintessential',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),

              ListTile(
                title: Text(
                  'User Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 26,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Quintessential',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
              ),

              ListTile(
                title: Text(
                  'About Thera',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 26,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Quintessential',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutThera()),
                  );
                },
              ),

              ListTile(
                title: Text(
                  'SOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 26,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Quintessential',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SOS()),
                  );
                },
              ),

              SizedBox(height: 280),
              ListTile(
                title: Text(
                  'Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Quintessential',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}