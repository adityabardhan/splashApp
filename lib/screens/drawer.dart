import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:splash/screens/dark_profile.dart';
import 'package:splash/screens/update.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatefulWidget {
  String mail;
   MainDrawer({Key? key, required this.mail}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey.shade300,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 110,width: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: user==null? const DecorationImage(
                        image: AssetImage('assest/images/home_Image/kolkata.jpeg'),fit: BoxFit.cover,filterQuality: FilterQuality.high
                      ):DecorationImage(image: NetworkImage(user!.photoURL!)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  user==null?Text("Aditya",style: GoogleFonts.anekLatin(
                    fontSize: 19,fontWeight: FontWeight.w500,color: Colors.white
                  ),):Text(user!.displayName!,style: GoogleFonts.anekLatin(
                      fontSize: 19,fontWeight: FontWeight.w500,color: Colors.white
                  ),),
                  SizedBox(height: 5,),
                  user==null?Text(widget.mail,style: GoogleFonts.anekLatin(
                      fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white
                  ),):Text(user!.email!,style: GoogleFonts.anekLatin(
                      fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white
                  ),)
                ]
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 20),
            child: ListTile(
              leading: Icon(Icons.account_circle_rounded,color: Colors.blueGrey[800],size: 25,),
              title: Text("Profile",style: GoogleFonts.anekLatin(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey[800]
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(mail: widget.mail)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 20),
            child: ListTile(
              leading: Icon(MdiIcons.key
                  ,color: Colors.blueGrey[800],size: 25),
              title: Text("Update Password ",style: GoogleFonts.anekLatin(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey[800]
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdatePwd()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 20),
            child: ListTile(
              leading: Icon(Icons.share_rounded,color: Colors.blueGrey[800],size: 25,),
              title: Text("Share our App",style: GoogleFonts.anekLatin(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey[800]
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(mail: widget.mail)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 20),
            child: ListTile(
              leading: Icon(Icons.feedback_rounded,color: Colors.blueGrey[800],size: 25,),
              title: Text("Rate & Feedback",style: GoogleFonts.anekLatin(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey[800]
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(mail: widget.mail)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10,right: 20),
            child: ListTile(
              leading: Icon(Icons.exit_to_app_outlined,color: Colors.blueGrey[800],size: 25,),
              title: Text("Exit the App",style: GoogleFonts.anekLatin(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey[800]
              ),),
              onTap:(){
                HapticFeedback.vibrate();
                SystemNavigator.pop();
              }
            ),
          ),
          SizedBox(height: 40,),
          Container(
            child: Column(
              children: [
                Text("Follow us On",style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,fontSize: 20,
                ),),
                SizedBox(height: 23,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        _launchURL("https://www.instagram.com/prime_aditya_/");
          },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.instagram,color: Colors.redAccent[400],),
                          Padding(padding: EdgeInsets.all(5.0))
                          ,Text("Instagram",style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,fontSize: 19,
                          ),),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        _launchURL("https://twitter.com/GuptaBardhan?s=09");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.twitter,color: Colors.lightBlueAccent[400],),
                          Padding(padding: EdgeInsets.all(5.0))
                          ,Text("Twitter",style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,fontSize: 19,
                          ),),
                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        _launchURL("https://twitter.com/GuptaBardhan?s=09");
          },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.facebook,color:Colors.blueAccent[200] ),
                          Padding(padding: EdgeInsets.all(5.0))
                          ,Text("Facebook  ",style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,fontSize: 19,
                          ),),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        _launchURL("https://www.linkedin.com/in/aditya-bardhan-gupta-7b0941189/");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.linkedin,color:Colors.indigoAccent[200] ),
                          Padding(padding: EdgeInsets.all(5.0))
                          ,Text("Linkedin",style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,fontSize: 19,
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url)async{
    try{
      if (await canLaunch(url)){
        await launch(url);
      }
      else{
        throw "Could not launch $url";
      }
    }
    catch(e){
      print(e);
    }
  }
}

