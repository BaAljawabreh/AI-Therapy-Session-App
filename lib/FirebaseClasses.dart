import 'package:flutter/material.dart';
import 'main.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';
import 'ForgotPassPages.dart';
import 'SignUpPage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpController extends GetxController{

  static SignUpController get instance => Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password, usernameController.text);
  }
}

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  //get email of the user who is currently logged in (from AuthController) and pass to user controller to fetch user record
  final _auth_controller = Get.put(AuthenticationRepository());
  final _db = FirebaseFirestore.instance;
  var user = UserModel(username:'', email: '');

  @override
  Future<void> onInit() async {
    user = await getUserData();
    update();
    super.onInit();
  }
  //fetch user information from database
  getUserData() {
    final email = _auth_controller.firebaseUser.value?.email;
    if (email != null) {
      return _auth_controller.getUserDetails(email);
    } else {
      Get.snackbar('error', '.'); //
    }
  }
}

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final _db = FirebaseFirestore.instance;

  @override
  void onReady() {
    firebaseUser = Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream((_auth.userChanges()));
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ?
    Get.offAll(() => const WelcomePage())
        : Get.offAll(() => const ChatPage());
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection('users')
        .where('email', isEqualTo: email)
        .get(); // all data
    //convert snapshot to single record
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future <void> createUserWithEmailAndPassword(String email, String password, String name) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final User? currentUser = _auth.currentUser;
        // store data in in user collection
        await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser?.uid)
            .set({
          'id': currentUser?.uid,
          'email': email,
          'username': name
        });
      });
      firebaseUser.value != null? Get.offAll(() => const ChatPage()) : Get.offAll(() => const WelcomePage());
    }
    on FirebaseAuthException catch(e){
      print("error $e");
    } catch(_){}
  }

  Future <void> loginWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null? Get.offAll(() => const ChatPage()) : Get.offAll(() => const WelcomePage());
    }
    on FirebaseAuthException catch(e){
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    } catch(_){
      const ex = SignWithEmailAndPasswordFailure();
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;
    }
  }

  Future <void> logout() async => await _auth.signOut();
}

class SignWithEmailAndPasswordFailure{
  final String message;
  const SignWithEmailAndPasswordFailure([this.message = "An Unkown error occured."]);
  factory SignWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'Weak-password' : return SignWithEmailAndPasswordFailure('Please enter a stronger password');
      case 'Invalid-email' : return SignWithEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'Email-already-in-use' : return SignWithEmailAndPasswordFailure('This account already exists');
      case 'Operation-not-allowed' : return SignWithEmailAndPasswordFailure('Operation is not allowed, please contact support');
      case 'user-disabled' : return SignWithEmailAndPasswordFailure('This user has been disabled, please contact support for help');
      default : return SignWithEmailAndPasswordFailure();
    }
  }
}

class UserModel{
  final String? id;
  final String username;
  final String email;

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!; //getting complete object
    return UserModel(
        id: document.id,
        username: data['username'],
        email: data['email']
    ); }
  const UserModel({
    this.id,
    required this.username,
    required this.email,
  });
  toJson(){
    return{
      "username": username,
      "email": email,
    };}

}

class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson())
      .whenComplete(() =>
        Get.snackbar("Success", "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green),
      )
    .catchError((error, snackTrace){
      Get.snackbar("Error", "Something went wrong. Try agian.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.1),
        colorText: Colors.red);
      print(error.toString());
    });
  }

}