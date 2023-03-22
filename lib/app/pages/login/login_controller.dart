import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  var passwordVisible = false;
  var email;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Retreive email from firebase
  void signIn() async {
    try {
      UserCredential userCredential =
          await _auth.signInAnonymously(); // sign in anonymously

      email = userCredential.user!.email;
      print('email iss ====================${userCredential.user!.email}');
      update(); // retrieve email of anonymous user
    } on FirebaseAuthException catch (e) {
      print('Failed to sign in: ${e.message}');
    }
  }
}
