import 'package:flutter/material.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';
import 'FirebaseClasses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {

  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _validateConfirmPassword = false;
  final userRepo = Get.put(UserRepository());
  
Future<void> createUser(UserModel user) async {
  await userRepo.createUser(user);
}

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

/////////////////////Interface Body
            child: Form(
              key: _formKey,
              child: Column(
                children: [

/////////////////////Bot and Welcome
                  SizedBox(height: 50),
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
                                  fontWeight: FontWeight.w500,),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/TheraBotImg.png',
                          width: 230, height: 230,),
                      ),
                    ],
                  ),

////////////////////////Username Field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextField( cursorColor: Color(0xFFDDE6EA),
                      controller: controller.usernameController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outlined,color: Color(0xFFDDE6EA),size: 32),
                        labelText: 'Username',
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
                    ),
                  ),
                  SizedBox(height: 20),

////////////////////////Email Field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(cursorColor: Color(0xFFDDE6EA),
                      controller: controller.emailController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFDDE6EA),size: 30),
                        labelText: 'Email',
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
                        errorText: _validateEmail ? 'Enter a valid email' : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

////////////////////////Pass Field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(cursorColor: Color(0xFFDDE6EA),
                      controller: controller.passwordController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined,color: Color(0xFFDDE6EA),size: 30),
                        labelText: 'Password',
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
                        errorText: _validatePassword ? 'Enter a valid password' : null,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20),

////////////////////////Confirm Pass Field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: TextFormField(cursorColor: Color(0xFFDDE6EA),
                      controller: controller.confirmPasswordController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined,color: Color(0xFFDDE6EA),size: 30),
                        labelText: 'Confirm Password',
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
                        errorText: _validateConfirmPassword ? 'Passwords do not match' : null,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30),

//////////////////////SingUp Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _validateEmail = controller.emailController.text.isEmpty ||
                            !isValidEmail(controller.emailController.text);
                        _validatePassword = controller.passwordController.text.isEmpty ||
                            !isValidPassword(controller.passwordController.text);
                        _validateConfirmPassword = controller.confirmPasswordController.text != controller.passwordController.text;
                      });

                      if (!_validateEmail && !_validatePassword&& !_validateConfirmPassword) {
                        String email = controller.emailController.text.trim();
                        String password = controller.passwordController.text.trim();

                        // Check if the email exists in Firestore
                        FirebaseFirestore.instance
                            .collection("users") // Replace 'users' with your Firestore collection name
                            .where('email', isEqualTo: email)
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          if (querySnapshot.docs.isNotEmpty) {
                            // Email found in Firestore, prompt the user to log in
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Email Already Registered'),
                                  content: Text('The email entered is already registered. Please log in instead.'),
                                  backgroundColor:  Color(0xFFDDE6EA) ,
                                  actions: [
                                    TextButton(
                                      child: Text('Log In'
                                        ,style: TextStyle(
                                          color: Color(0xFF099BAC),
                                        ),),
                                      onPressed: () {
                                        // Handle the log in action here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Cancel',
                                        style: TextStyle(
                                          color: Color(0xFF099BAC),
                                        ),),
                                      onPressed: () {
                                        // Handle the cancel action here
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Email not found in Firestore, proceed with user registration
                            SignUpController.instance.registerUser(email, password);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChatPage()),
                            );
                            print('Email Signed In');
                          }
                        }).catchError((error) {
                          // Handle Firestore query errors here
                          print('Error querying Firestore: $error');
                        });
                      }
                    },
                    child: Text(
                      'Sign Up',
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
                  SizedBox(height: 15),

////////////////////////Go to Login button
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'Already have an account? ',
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
                            MaterialPageRoute(builder: (context) => LoginPage()),);
                        },
                        child: Text('Log in',
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
