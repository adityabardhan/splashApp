import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splash/firebase/fireAuth.dart';

import '../login.dart';

class UpdatePwd extends StatefulWidget {
  const UpdatePwd({Key? key}) : super(key: key);

  @override
  State<UpdatePwd> createState() => _UpdatePwdState();
}

class _UpdatePwdState extends State<UpdatePwd> {

  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool fPass = true,sPass = true;

  void toggle1() {
    setState(() {
      fPass = !fPass;
    });
  }

  void toggle2() {
    setState(() {
      sPass = !sPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 200),
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assest/images/home_Image/update.webp'),fit: BoxFit.contain,),
                SizedBox(height: 40,),
                Column(
                  children: [
                    TextFormField(
                      obscureText: fPass,
                      validator: (String? value){
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.isEmpty)return "Please Enter Password";
                        if (!regex.hasMatch(value)){return "Invalid Password";}
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? val){
                        pass1.text = val!;
                      },
                      controller: pass1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: Icon(Icons.lock_outline,color: Colors.black54,),
                        suffixIcon: IconButton(
                          splashColor: Colors.blue,
                          splashRadius: 25.0,
                          onPressed: toggle1,
                          icon: Icon(
                            fPass ? Icons.visibility : Icons.visibility_off,color: Colors.black54,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.indigoAccent.shade400),
                        ),
                        // fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: " New Password",
                        hintStyle:
                        TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: pass2,
                      obscureText: sPass,
                      validator: (String? value){
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.isEmpty)return "Please Enter Password";
                        if (!regex.hasMatch(value)){return "Invalid Password";}
                        else if (pass1.text!=pass2.text){return "Don't match with above Password";}
                        else {
                          return null;
                        }
                      },
                      onSaved: (String? val){
                        pass2.text = val!;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: Icon(Icons.lock_outline,color: Colors.black54,),
                        suffixIcon: IconButton(
                          splashColor: Colors.blue,
                          splashRadius: 25.0,
                          onPressed: toggle1,
                          icon: Icon(
                            sPass ? Icons.visibility : Icons.visibility_off,color: Colors.black54,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.indigoAccent.shade400),
                        ),
                        // fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: " Confirm New Password",
                        hintStyle:
                        TextStyle(color: Colors.grey),
                      ),
                    ),

                    SizedBox(height: 40,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        textStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,letterSpacing: 1),
                        minimumSize: Size.fromHeight(60),
                        shape: StadiumBorder(),
                      ),
                      child:const Text("Update Password"),
                      onPressed: ()async{
                        if (_formkey.currentState!.validate()){
                          _formkey.currentState!.save();

                          try{
                            FirebaseAuth.instance.currentUser?.updatePassword(pass2.text);
                            signOut();
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                  "Password Changed Successfully",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                )));
                          }
                          on FirebaseAuthException catch(e){
                            print(e);
                          }

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(state: 'West Bengal',)));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// K85N8FZNT93AJXQ