import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/src/features/authentification/screens/dashboard.dart';
import 'package:flutter_application_1/src/features/authentification/screens/welcome_screen.dart';
import 'package:flutter_application_1/src/repository/exceptions/signup_failure.dart';
import 'package:get/get.dart';

class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override 
  void onReady () {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try { 
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null? Get.offAll(() => const Dashboard()) : Get.to(() => WelcomeScreen());
  // ignore: unused_catch_clause
  } on FirebaseException catch(e) {
    final ex = SignUpEmailAndPasswordFailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}' );
    throw ex;
  } catch (_) {
    const ex = SignUpEmailAndPasswordFailure();
    print('EXCEPTION - ${ex.message}');
    throw ex;
  }
}



 Future<void> loginWithEmailAndPassword(String email, String password) async {
    try { 
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  // ignore: unused_catch_clause
  } on FirebaseException catch(e){}
    catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}