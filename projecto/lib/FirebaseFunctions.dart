import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  // For registering a new user
  static Future<List> registerUsingEmailPassword(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required bool isDuplicateID}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = await userCredential.user;
      await user!.updateDisplayName(name);
      // PhoneAuthCredential phone = ("+91" + phoneNumber) as PhoneAuthCredential;
      // await user.updatePhoneNumber(phone);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        isDuplicateID = true;
      }
    } catch (e) {
      print(e);
    }

    return [user, isDuplicateID];
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      if (user != null) {
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return null;
  }
}
