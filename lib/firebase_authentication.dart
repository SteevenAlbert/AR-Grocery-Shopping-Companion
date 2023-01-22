import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'presentation/components/custom_widgets/custom_awesome_snackbar.dart';

class FirebaseAuthentication {
  static Future<User?> registerUsingEmailPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        CustomAwesomeSnackbar(
            context: context,
            title: "Email Taken",
            message:
                "An account already exists for that email. Please try an another email.",
            contentType: ContentType.failure);
      } else
        print(e);
    }
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomAwesomeSnackbar(
            context: context,
            title: 'Wrong Email',
            message:
                'It appears there are no users found for that email. Please try again.',
            contentType: ContentType.failure);
      } else if (e.code == 'wrong-password') {
        CustomAwesomeSnackbar(
            context: context,
            title: 'Wrong Password',
            message:
                'It appears you have entered the wrong password. Please try again.',
            contentType: ContentType.failure);
      } else {
        print(e);
      }
    }

    return user;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      authProvider.addScope('https://www.googleapis.com/auth/userinfo.profile');
      authProvider
          .addScope('https://www.googleapis.com/auth/user.birthday.read');
      authProvider.addScope('https://www.googleapis.com/auth/user.gender.read');
      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/user.birthday.read',
        'https://www.googleapis.com/auth/user.gender.read',
      ]);

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          print(e);
        }
      }
    }

    return user;
  }

  static Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      CustomAwesomeSnackbar(
          context: context,
          title: 'Email Sent',
          message: 'Please check your email inbox.',
          contentType: ContentType.success);
    } catch (e) {
      CustomAwesomeSnackbar(
          context: context,
          title: 'Email Not Sent',
          message: 'No user associated with that email. Please try again.',
          contentType: ContentType.failure);
    }
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      CustomAwesomeSnackbar(
          context: context,
          title: 'Error Signing Out.',
          message:
              'It appears there was an error during sign out. Please try again.',
          contentType: ContentType.failure);
    }
  }
}
