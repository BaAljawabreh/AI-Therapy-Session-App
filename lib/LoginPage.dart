import 'package:flutter/material.dart';
import 'ForgotPassPages.dart';
import 'SignUpPage.dart';
import 'ChatPage.dart';
import 'FirebaseClasses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        body:SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Container(
            width: 430, height: 932,
            decoration: BoxDecoration(
              color: Color(0xFF252525),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 50),

/////////////////////Bot and Welcome
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/WelcomeHolder.png',
                            width: 170, height: 170,
                          ),

                          Positioned.fill(
                            child: Center(
                              child: Text(
                                'Welcome!',
                                style: TextStyle(
                                  color: Color(0xFFDDE6EA),
                                  fontSize: 20,
                                  fontFamily: 'Catamaran',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/TheraBotImg.png',
                          width: 230,
                          height: 230,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 45),

/////////////////////Interface Body
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
////////////////////////Email Field
                        child: TextField(cursorColor: Color(0xFFDDE6EA),
                          controller: controller.emailController,
                          style: TextStyle(color: Color(0xFFDDE6EA)),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFDDE6EA),size: 30,),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color(0xFFA6A6A6), fontFamily: 'Catamaran',),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFDDE6EA)),
                            ),
                            errorText: _validateEmail ? 'Enter a valid email' : null,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

////////////////////////Pass Field
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
////////////////////////Password Field
                        child: TextField(cursorColor: Color(0xFFDDE6EA),
                          controller: controller.passwordController,
                          style: TextStyle(color: Color(0xFFDDE6EA)),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined,color: Color(0xFFDDE6EA),size: 30),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFFA6A6A6), fontFamily: 'Catamaran',),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFFDDE6EA)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFFDDE6EA)),
                            ),
                            errorText:
                            _validatePassword ? 'Enter a valid password' : null,
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 10),

////////////////////////Forgot pass button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPass()),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0xFFDDE6EA),
                            fontFamily: 'Catamaran',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

////////////////////////Login button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _validateEmail = controller.emailController.text.isEmpty ||
                                !isValidEmail(controller.emailController.text);
                            _validatePassword = controller.passwordController.text.isEmpty ||
                                !isValidPassword(controller.passwordController.text);
                          });
                          if (!_validateEmail && !_validatePassword) {
                            String email = controller.emailController.text.trim();
                            String password = controller.passwordController.text.trim();

                            // Check if the email exists in Firestore
                            FirebaseFirestore.instance
                                .collection("users") // Replace 'users' with your Firestore collection name
                                .where('email', isEqualTo: email)
                                .get()
                                .then((QuerySnapshot querySnapshot) {
                              if (querySnapshot.docs.isNotEmpty) {
                                // Email found in Firestore, you can handle this case accordingly.
                                // For example, show an error message or take appropriate action.
                                SignUpController.instance.registerUser(email, password);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChatPage()),
                                );
                                print('Email Signed In');
                              } else {
                                print('Email not signed In');
                                final snackBar = SnackBar(
                                  content: Text('The email entered does not exist.'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                // Email not found in Firestore, proceed with user registration.

                              }
                            }).catchError((error) {
                              // Handle Firestore query errors here.
                              print('Error querying Firestore: $error');                     });
                          }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFFDDE6EA), // Updated text color
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
                            )
                        ),
                      ),
                      SizedBox(height: 20),

////////////////////////Go to SignUp button
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( 'Do not have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFDDE6EA),
                              fontFamily: 'Catamaran',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),);
                            },
                            child: Text('Sign up',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF099BAC),
                                fontFamily: 'Catamaran',
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  //////////////////Validation Methods
  bool isValidEmail(String email) {
    // Perform email validation logic
    // You can use regular expressions or any other email validation technique
    // Here's a simple example using regular expression
    RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
  bool isValidPassword(String password) {
    // Perform password validation logic
    // You can define your own password rules and check them accordingly
    // Here's a simple example:
    return password.length >= 8;
  }
}
