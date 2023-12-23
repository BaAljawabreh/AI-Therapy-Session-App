import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MenuDrawer.dart';
import 'FirebaseClasses.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next page after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 430, height: 932,
            color: Color(0xFF252525),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 90),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/BOTNew.gif',
                  width: 350, height: 350,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 65),
                  child: Text(
                    'THERA BOT',
                    style: TextStyle(
                      color: Color(0xFFDDE6EA),
                      fontSize: 30,
                      fontFamily: 'Quintessential',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
