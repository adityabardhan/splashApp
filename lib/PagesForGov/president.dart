import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/PagesGlobalCM/searchPM.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SearchPres.dart';

class President extends StatefulWidget {
  const President({Key? key}) : super(key: key);

  @override
  State<President> createState() => _PresidentState();
}

class _PresidentState extends State<President> {

  List<Map<String, dynamic>> data = [
    {
      'name': 'Rajendra Prasad',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Rajendra_Prasad_%28Indian_President%29%2C_signed_image_for_Walter_Nash_%28NZ_Prime_Minister%29%2C_1958_%2816017609534%29.jpg/220px-Rajendra_Prasad_%28Indian_President%29%2C_signed_image_for_Walter_Nash_%28NZ_Prime_Minister%29%2C_1958_%2816017609534%29.jpg',
      'tenure': '26 Jan 1950-\n13 May 1962',
      'party': 'Indian National Congress',
      "id": 1
    },
    {
      'name': 'Sarvepalli Radhakrishnan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Photograph_of_Sarvepalli_Radhakrishnan_presented_to_First_Lady_Jacqueline_Kennedy_in_1962.jpg/220px-Photograph_of_Sarvepalli_Radhakrishnan_presented_to_First_Lady_Jacqueline_Kennedy_in_1962.jpg',
      'tenure': '13 May 1962-\n13 May 1967',
      'party': 'Independent',
      "id": 2
    },
    {
      'name': 'Zakir Husain',
      'image':
      'https://www.oneindia.com/img/2018/02/zakir-husain-1518068972.jpg',
      'tenure': '13 May 1967-\n03 May 1969',
      'party': 'Independent',
      "id": 3
    },
    {
      'name': 'V.V.Giri',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/6/60/VV_Giri_1974_stamp_of_India_%28cropped%29.jpg',
      'tenure': '03 May 1969-\n20 Jul 1969',
      'party': 'NA',
      "id": 4
    },
    {
      'name': "Mohammad Hidayatullah",
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/7/72/Hidayatullah.png',
      'tenure': '20 Jul 1969-\n24 Aug 19169',
      'party': 'NA',
      "id": 5
    },
    {
      'name': 'V.V.Giri',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/6/60/VV_Giri_1974_stamp_of_India_%28cropped%29.jpg',
      'tenure': '24 Aug 19169-\n24 Aug 19174',
      'party': 'Independent',
      "id": 6
    },
    {
      'name': 'Fakhruddin Ali Ahmed',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Fakhruddin_Ali_Ahmed_1977_stamp_of_India_%28cropped%29.jpg/220px-Fakhruddin_Ali_Ahmed_1977_stamp_of_India_%28cropped%29.jpg',
      'tenure': '25 Aug 1974-\n11 Feb 1977',
      'party': 'Indian National Congress',
      "id": 7
    },
    {
      'name': "B. D. Jatti",
      'image':
      'data:image/jpeg;base64,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',
      'tenure': '11 Feb 1977-\n25 Jul 1977',
      'party': 'NA',
      "id": 8
    },
    {
      'name': 'Neelam Sanjiva Reddy',
      'image':
      'https://static.theprint.in/wp-content/uploads/2020/05/Neelam-Reddy.jpg',
      'tenure': '25 Jul 1977-\n25 Jul 1982',
      'party': 'Janta Party',
      "id": 9
    },
    {
      'name': "Zail Singh",
      'image':
      'data:image/jpeg;base64,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',
      'tenure': '25 Jul 1982-\n25 Jul 1987',
      'party': 'Indian National Congress',
      "id": 10
    },
    {
      'name': 'Ramaswamy Venkataraman',
      'image':
      'https://bharatstories.com/wp-content/uploads/2015/06/Ramaswamy-Venkataraman-1200x902.jpg',
      'tenure': '25 Jul 1987-\n25 Jul 1992',
      'party': 'Indian National Congress',
      "id": 11
    },
    {
      'name': "Shankar Dayal Sharma",
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Shankar_Dayal_Sharma_36.jpg/220px-Shankar_Dayal_Sharma_36.jpg',
      'tenure': '25 Jul 1992-\n25 Jul 1997',
      'party': 'Indian National Congress',
      "id": 12
    },
    {
      'name': 'K.R.Narayanan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/President_Clinton_with_Indian_president_K._R._Narayanan_%28cropped%29.jpg/220px-President_Clinton_with_Indian_president_K._R._Narayanan_%28cropped%29.jpg',
      'tenure': '25 Jul 1997-\n25 Jul 2002',
      'party': 'Indian National Congress',
      "id": 13
    },
    {
      'name': 'A.P.J.Abdul Kalam',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/A._P._J._Abdul_Kalam.jpg/220px-A._P._J._Abdul_Kalam.jpg',
      'tenure': '25 Jul 2002-\n25 Jul 2007',
      'party': 'Independent',
      "id": 14
    },
    {
      'name': 'Pratibha Patil',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/The_President_of_India%2C_Smt._Pratibha_Patil.jpg/220px-The_President_of_India%2C_Smt._Pratibha_Patil.jpg',
      'tenure': '25 Jul 2007-\n25 Jul 2012',
      'party': 'Indian National Congress',
      "id": 15
    },
    {
      'name': 'Pranab Mukherjee',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Pranab_Mukherjee_Portrait.jpg/220px-Pranab_Mukherjee_Portrait.jpg',
      'tenure': '25 Jul 2012\n25 Jul 2017',
      'party': 'Indian National Congress',
      "id": 16
    },
    {
      'name': 'Ram Nath Kovind',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Ram_Nath_Kovind_official_portrait.jpg/220px-Ram_Nath_Kovind_official_portrait.jpg',
      'tenure': '25 Jul 2017\n25 Jul 2022',
      'party': 'Bharatiya Janata Party',
      "id": 17
    },
    {
      'name': 'Droupadi Murmu',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBEfxr0tTAztRmrffAC9AUatH02KD2APkTDw&usqp=CAU',
      'tenure': '25 Jul 2022\nINCUMBENT*',
      'party': 'Bharatiya Janata Party',
      "id": 18
    }
  ];

  // add to database function
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection('President').add(element);
  //   }
  //   print('all data added');
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   addData();
  // }

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
    "https://en.wikipedia.org/wiki/Rajendra_Prasad",
    "https://en.wikipedia.org/wiki/Sarvepalli_Radhakrishnan",
    "https://en.wikipedia.org/wiki/Zakir_Husain_(politician)",
    "https://en.wikipedia.org/wiki/V._V._Giri",
    "https://en.wikipedia.org/wiki/Mohammad_Hidayatullah",
    "https://en.wikipedia.org/wiki/V._V._Giri",
    "https://en.wikipedia.org/wiki/Fakhruddin_Ali_Ahmed",
    "https://en.wikipedia.org/wiki/B._D._Jatti",
    "https://en.wikipedia.org/wiki/Neelam_Sanjiva_Reddy",
    "https://en.wikipedia.org/wiki/Zail_Singh",
    "https://en.wikipedia.org/wiki/Ramaswamy_Venkataraman",
    "https://en.wikipedia.org/wiki/Shankar_Dayal_Sharma",
    "https://en.wikipedia.org/wiki/K._R._Narayanan",
    'https://en.wikipedia.org/wiki/A._P._J._Abdul_Kalam',
    "https://en.wikipedia.org/wiki/Pratibha_Patil",
    "https://en.wikipedia.org/wiki/Pranab_Mukherjee",
    "https://en.wikipedia.org/wiki/Ram_Nath_Kovind",
    "https://en.wikipedia.org/wiki/Droupadi_Murmu"
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPresident()));
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
          "President Catalogue",
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
            stream: db.collection('President').snapshots(),
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
  final profile =
  FirebaseFirestore.instance.collection('President').orderBy("id",descending: false);

  Future getUser() async {
    List itemsList = [];
    try {
      await profile.get().then((querySnapShot) => {
        querySnapShot.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('President');
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


