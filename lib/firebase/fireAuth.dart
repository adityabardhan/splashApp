// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splash/home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
Future<User?> signInWithGoogle(BuildContext context) async
{

  try{

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );

    final userCredential  = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    assert(!user!.isAnonymous);
    final User? currentUser = _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(user);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(mail: '', state: '')));
    return user;

  }catch(e){
    print(e);
  }
  return null;
}

void signOut() async
{
  await googleSignIn.disconnect();
  await googleSignIn.signOut();
  await _auth.signOut();
}