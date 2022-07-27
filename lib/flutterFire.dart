// import 'package:firebase_auth/firebase_auth.dart';
//
// Future<bool> signIn(String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   try{
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//     return true;
//   }
//   catch(e){
//     print(e.toString());
//   }
//   return false;
// }
//
// Future<bool> register(String email, String password)async{
//
//   try{
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//     return true;
//   } on FirebaseException catch(e){
//     if (e.code == "weak-password"){
//       print("Created Password is Weak.");
//     }
//     else if (e.code == 'emial-already-in-use'){
//       print("The Account Exist for this Email.");
//     }
//     return false;
//   }
//   catch(e){
//     print(e.toString());
//   }
//
//   return false;
//
// }