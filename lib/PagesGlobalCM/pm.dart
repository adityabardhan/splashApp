import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/PagesGlobalCM/searchPM.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/cm.dart';

class PrimeMin extends StatefulWidget {
  const PrimeMin({Key? key}) : super(key: key);

  @override
  State<PrimeMin> createState() => _PrimeMinState();
}

class _PrimeMinState extends State<PrimeMin> {

  List _userProfile = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    dynamic result = await DataBaseManager().getUser();
    if (result == null) {
      print("Unable to Load");
    } else {
      setState(() {
        _userProfile = result;
      });
    }
  }

  final List<String> _listLink = [
    "https://en.wikipedia.org/wiki/Jawaharlal_Nehru",
    "https://en.wikipedia.org/wiki/Gulzarilal_Nanda",
    "https://en.wikipedia.org/wiki/Lal_Bahadur_Shastri",
    "https://en.wikipedia.org/wiki/Gulzarilal_Nanda",
    "https://en.wikipedia.org/wiki/Indira_Gandhi",
    "https://en.wikipedia.org/wiki/Morarji_Desai",
    "https://en.wikipedia.org/wiki/Charan_Singh",
    "https://en.wikipedia.org/wiki/Indira_Gandhi",
    "https://en.wikipedia.org/wiki/Rajiv_Gandhi",
    "https://en.wikipedia.org/wiki/V._P._Singh",
    "https://en.wikipedia.org/wiki/Chandra_Shekhar",
    "https://en.wikipedia.org/wiki/P._V._Narasimha_Rao",
    "https://en.wikipedia.org/wiki/Atal_Bihari_Vajpayee",
    'https://en.wikipedia.org/wiki/H._D._Deve_Gowda',
    "https://en.wikipedia.org/wiki/Inder_Kumar_Gujral",
    "https://en.wikipedia.org/wiki/Atal_Bihari_Vajpayee",
    "https://en.wikipedia.org/wiki/Manmohan_Singh",
    "https://en.wikipedia.org/wiki/Narendra_Modi"
  ];

  _launchUrl(index) async {
    if (await canLaunch(_listLink[index])) {
      await launch(_listLink[index]);
    } else {
      throw "Could not open $_listLink";
    }
  }

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50,),
        child: FloatingActionButton(
          heroTag: "two",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPM()));
          },
          mini: true,
          disabledElevation: 5,
          clipBehavior: Clip.hardEdge,
          child: Icon(Icons.search_sharp,color: Colors.black,),
          backgroundColor: Colors.red.shade50
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade400.withOpacity(0.45),
        automaticallyImplyLeading: false,
        title: Text(
          "PM CATALOGUE",
          style: GoogleFonts.alata(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, colors: [
              Colors.greenAccent.shade400.withOpacity(0.45),
              Colors.greenAccent.shade400.withOpacity(0.5),
              Colors.greenAccent.shade400.withOpacity(0.40),
              Colors.greenAccent.shade400.withOpacity(0.42)
            ])),
        child: StreamBuilder<QuerySnapshot>(
            stream: db.collection('PM').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.orange,
                      valueColor:AlwaysStoppedAnimation(Colors.green),)
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userProfile.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.black38),
                        ),
                        child: ListTile(
                          onTap: ()=>_launchUrl(index),
                          horizontalTitleGap: 20,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              _userProfile[index]['name'],
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          subtitle: Text(
                            _userProfile[index]['tenure'],
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 31,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey.shade100,
                              radius: 30,
                              backgroundImage: NetworkImage(
                                _userProfile[index]['image'],
                              ),
                            ),
                          ),
                          trailing: Text(
                            _userProfile[index]['party'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}

class DataBaseManager {
  final CollectionReference profile =
  FirebaseFirestore.instance.collection('PM');

  Future getUser() async {
    List itemsList = [];
    try {
      await profile.get().then((querySnapShot) => {
        querySnapShot.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('PM')
              .orderBy('name', descending: false);
          itemsList.add(element.data());
        }),
      });
      return itemsList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
        return null;
      }
    }
  }
}


