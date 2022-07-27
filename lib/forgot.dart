// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splash/login.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {

  TextEditingController pass = TextEditingController();

  bool isDone = false;

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
    child: AppBar(
      leading: const Icon(Icons.back_hand,size: 0,),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back,color: Colors.black,),
      //   onPressed: ()=> Navigator.pop(context),
      // ),
    ),
        ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(35),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assest/images/forgot.jpeg",height: 450,width: 500,),
                TextFormField(
                  cursorColor: const Color(0xff4c505b),
                  validator: (String? value) {
                    // RegExp regex =
                    // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    }
                    else if (!(value.contains(".com"))){
                      return "Enter valid Email";
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    pass.text = value.toString();
                  },
                  controller: pass,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline,color: Color(0xff4c505b),),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.indigoAccent),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: " Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                // TextFormField(
                //   cursorColor: Color(0xff4c505b),
                //   validator: (String? value) {
                //     RegExp regex =
                //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                //     if (!regex.hasMatch(value!)) {
                //       return "Incorrect Password";
                //     }
                //     if (pass.text!=value){
                //       return "Doesn't Match Above Password";
                //     }
                //     return null;
                //   },
                //   onSaved: (String? value){
                //     sure.text = value.toString();
                //   },
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   controller: sure,
                //   obscureText: sPass!,
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(Icons.lock_outlined,color: Color(0xff4c505b),),
                //     suffixIcon: IconButton(
                //       onPressed: toggle2,
                //       icon: Icon(
                //         sPass!? Icons.visibility: Icons.visibility_off,
                //         color: Color(0xff4c505b),
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Colors.black),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Colors.indigoAccent),
                //     ),
                //     fillColor: Colors.grey.shade200,
                //     filled: true,
                //     hintText: "Retype New Password",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //   ),
                // ),

                SizedBox(height: 30,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent,
                    textStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,letterSpacing: 1),
                    minimumSize: Size.fromHeight(60),
                    shape: StadiumBorder(),
                  ),
                  child: isDone?const CircularProgressIndicator(color: Colors.white,):const Text("Reset Password"),
                  onPressed: ()async{
                    if(isDone)return;
                    setState(()=> isDone = true);
                    await Future.delayed(Duration(seconds: 2));
                    setState((){
                      isDone = false;
                    });
                    if (_formkey.currentState!.validate()){
                      _formkey.currentState!.save();

                      resetPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: pass.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Reset Password Link has been Sent",style:
      TextStyle(
        fontSize: 15,
      ),
        textAlign: TextAlign.center,
      )));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(state: 'West Bengal',)));

    }
    on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("No user found for that email",style:
        TextStyle(color: Colors.red,
          fontSize: 15,
        ),
          textAlign: TextAlign.center,
        )));
      }
    }
   }
}