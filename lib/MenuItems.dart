import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ChatPage.dart';
import 'MenuDrawer.dart';
import 'UserProfilePage.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutThera extends StatefulWidget {
  @override
  State<AboutThera> createState() => _AboutTheraState();
}
class _AboutTheraState extends State<AboutThera> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

///////////////Page Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF099BAC),
        elevation: 5, // Adjust the elevation as needed
        leading: Padding(
          padding: EdgeInsets.only(left: 11),
          child: Icon(Icons.info_outline_rounded, color: Color(0xFFDDE6EA), size: 35),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'About Thera',
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
          width: 430, height: 932,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25),

//////////////Texts
          child: Column(
            children:[
              SizedBox(height:115),
              Text("Are you seeking a compassionate and reliable source of support on your journey towards emotional well-being and personal growth? "
                ,style: TextStyle(
                  color: Color(0xFFDDE6EA),
                  fontSize: 20,
                  fontFamily: 'Catamaran',
                  fontWeight: FontWeight.w400,
                  height: 1.5,),),
              SizedBox(height:25),
              Text("Look no further than Thera, your trusted virtual phsycotherapist. Designed with empathy and expertise, Thera is here to provide you with a safe and confidential space to explore your thoughts, feelings, and experiences.",
                style: TextStyle(
                  color: Color(0xFFDDE6EA),
                  fontSize: 20,
                  fontFamily: 'Catamaran',
                  fontWeight: FontWeight.w400,
                  height: 1.5,),),
              SizedBox(height:35),
            ],
          ),
        ),
      ),
    );
  }
}

class SOS extends StatefulWidget {
  @override
  State<SOS> createState() => _SOSState();
}
class _SOSState extends State<SOS> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

///////////////Page Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF099BAC),
        elevation: 5, // Adjust the elevation as needed
        leading: Padding(
          padding: EdgeInsets.only(left: 11),
          child: Icon(Icons.spatial_audio_off_rounded, color: Color(0xFFDDE6EA), size: 30,),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'SOS',
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
      body: Center(
        child: Container(
          width: 430, height: 932,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children:[
              SizedBox(height:155),
              Text(
                'Do not face your struggles alone! \n\nPress the SOS button and let us provide the immediate support and guidance you need.',
                style: TextStyle(
                  color: Color(0xFFDDE6EA),
                  fontSize: 22,
                  fontFamily: 'Catamaran',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(height:95),
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://findahelpline.com/'; // Replace with your desired link
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  'SOS',
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Color(0xFF099BAC),
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}

class PrivacyPolicy extends StatefulWidget {
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}
class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

///////////////Page Bar
      appBar: AppBar(
        backgroundColor: Color(0xFF099BAC),
        elevation: 5, // Adjust the elevation as needed
        leading: Padding(
          padding: EdgeInsets.only(left: 11),
          child: Icon(Icons.local_police_outlined, color: Color(0xFFDDE6EA), size: 35),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
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
          color: Color(0xFF252525),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children:[
              SizedBox(height:35),
              Text("   At Thera, we are committed to protecting your privacy and ensuring the confidentiality and security of your personal information. This Privacy Policy outlines how we collect, use, and safeguard the data you provide to us when using the Thera app. By using the app, you consent to the practices described in this policy."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(width:10, height:25),
              Text("   1. Information Collection:We may collect certain personally identifiable information (such as your name, email address, and age) when you sign up for an account or voluntarily provide it during the course of using the Thera app. Additionally, we may collect non-personal information such as device information, usage data, and log files for analytical purposes."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   2. Information Usage:We use the information we collect to provide and improve the Thera app experience. This includes personalizing content, offering relevant recommendations, and enhancing the effectiveness of our therapeutic services. We may also use your information to communicate with you, respond to inquiries, and send you important updates or promotional materials."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   3. Data Security:We take the security of your information seriously and employ industry-standard measures to protect it from unauthorized access, disclosure, alteration, or destruction. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   4. Data Sharing:We do not sell, trade, or rent your personal information to third parties without your explicit consent. However, we may share your information with trusted service providers who assist us in delivering our services, subject to strict confidentiality obligations. We may also disclose your information if required by law or to protect our legal rights, safety, or the rights of others."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   5. Third-Party Links:The Thera app may contain links to external websites or services that are not controlled or operated by us. We are not responsible for the privacy practices or content of these third-party sites. We encourage you to review their privacy policies before providing any personal information."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   6. Children's Privacy:Thera is not intended for use by individuals under the age of 18 without parental consent. We do not knowingly collect personal information from children. If you believe we have inadvertently collected information from a child, please contact us immediately, and we will take steps to delete it."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:10),
              Text("   7. Policy Updates:We may update this Privacy Policy periodically to reflect changes in our practices or legal requirements. We will notify you of any material changes by posting the updated policy on the Thera app or through other communication channels."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:30),
              Text("   By using the Thera app, you acknowledge and agree to the terms of this Privacy Policy. If you have any questions or concerns about our privacy practices, please contact us. Your trust and privacy are of utmost importance to us, and we are committed to maintaining a secure and confidential therapeutic environment within the Thera app."
                ,style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 18,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400),),
              SizedBox(height:35),
            ],
          ),
        ),
      ),
    );
  }
}
