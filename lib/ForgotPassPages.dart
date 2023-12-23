import 'package:flutter/material.dart';
import 'package:gpai_therapy_session/ChatPage.dart';
import 'package:gpai_therapy_session/LoginPage.dart';
import 'FirebaseClasses.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}
class _ForgotPassState extends State<ForgotPass> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _verificationCodeController = TextEditingController();
  bool _validateVerificationCode = false;
  bool _validateEmail = false;
  String _verificationCode = '';

  //////////////Validation method
  bool isValidEmail(String email) {
    validator:
        (value) {
      if (value!.isEmpty) {
        return 'Please enter your email!';
      }
      // You can add additional email validation here if needed
      return null;
    };
    RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Container(
            width: 430, height: 932,
            decoration: BoxDecoration(
              color: Color(0xFF252525),
            ),
            child: Column(
              children: [
                SizedBox(height: 45),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/TheraBotImg.png',
                    width: 230,
                    height: 230,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Enter your email address',
                  style: TextStyle(
                    color: Color(0xFFDDE6EA),
                    fontSize: 24,
                    fontFamily: 'Catamaran',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(cursorColor: Color(0xFFDDE6EA),
                    controller: _emailController,
                    style: TextStyle(color: Color(0xFFDDE6EA)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFDDE6EA), size: 30,),
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
                      errorText: _validateEmail ? 'Enter a valid email!' : null,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _validateEmail = _emailController.text.isEmpty ||
                                    !isValidEmail(_emailController.text);
                                _verificationCodeController.clear();
                              });
                              if (!_validateEmail) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CodePassPage()),
                                );
                              }
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Color(0xFFDDE6EA),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: Color(0xFF099BAC),
                              textStyle: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Catamaran',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFDDE6EA),
                                fontFamily: 'Catamaran',
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class CodePassPage extends StatefulWidget {

  @override
  _CodePassPageState createState() => _CodePassPageState();
}
class _CodePassPageState extends State<CodePassPage> {

  TextEditingController _verificationCodeController = TextEditingController();
  bool _validateVerificationCode = false;
  String _verificationCode = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          width: 430, height: 932,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/TheraBotImg.png',
                  width: 230,
                  height: 230,
                ),
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter Verification Code',
                    style: TextStyle(
                      color: Color(0xFFDDE6EA),
                      fontSize: 24,
                      fontFamily: 'Catamaran',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'An email with a verification code has been sent to your email address. Please enter the code below:',
                    style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 16),
                  ),
                  TextField(cursorColor: Color(0xFFDDE6EA),
                    controller: _verificationCodeController,
                    style: TextStyle(color: Color(0xFFDDE6EA)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.verified_outlined,color: Color(0xFFDDE6EA), size: 30,),
                      labelText: 'Verification Code',
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
                      //errorText: _validateVerificationCode ? 'Invalid verification code!' : null,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed:() { //_verifyCode,
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePassPage()),
                      ); },
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: Color(0xFFDDE6EA),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 70),
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
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePassPage extends StatefulWidget {
  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}
class _ChangePassPageState extends State<ChangePassPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _validatePassword = false;
  bool _validateConfirmPassword = false;
  bool isValidPassword(String password) {
    // Perform password validation logic
    // You can define your own password rules and check them accordingly
    // Here's a simple example:
    return password.length >= 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          width: 430,height: 932,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/TheraBotImg.png',
                  width: 230,
                  height: 230,
                ),
              ),
              SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Change Your Password',
                    style: TextStyle(
                      color: Color(0xFFDDE6EA),
                      fontSize: 24,
                      fontFamily: 'Catamaran',
                      fontWeight: FontWeight.w400,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(cursorColor: Color(0xFFDDE6EA),
                      controller: _passwordController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined,color: Color(0xFFDDE6EA), size: 30,),
                        labelText: 'New Password',
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
                        errorText:
                        _validatePassword ? 'Enter a valid password!' : null,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(cursorColor: Color(0xFFDDE6EA),
                      controller: _confirmPasswordController,
                      style: TextStyle(color: Color(0xFFDDE6EA)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined,color: Color(0xFFDDE6EA)),
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
                        errorText: _validateConfirmPassword ? 'Passwords do not match!' : null,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _validatePassword = _passwordController.text.isEmpty ||
                            !isValidPassword(_passwordController.text);
                        _validateConfirmPassword =
                            _confirmPasswordController.text != _passwordController.text;
                      });
                      if (!_validatePassword &&
                          !_validateConfirmPassword) {
                        // Perform sign-up logic
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Color(0xFFDDE6EA),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 70),
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
            ],
          ),
        ),
      ),
    );
  }
}

