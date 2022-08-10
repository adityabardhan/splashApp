import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/PagesGlobalCM/search.dart';
import 'package:url_launcher/url_launcher.dart';

import '../PagesForGov/SearchGov.dart';

class Governor extends StatefulWidget {
  const Governor({Key? key}) : super(key: key);

  @override
  State<Governor> createState() => _GovernorState();
}

class _GovernorState extends State<Governor> {

  List<Map<String, dynamic>> data = [
    {
      'name': 'C. Rajagopalachari',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/C_Rajagopalachari.jpg/220px-C_Rajagopalachari.jpg',
      'tenure': '15 Aug 1947-\n21 Jun 1948',
      'party': 1
    },
    {
      'name': 'Kailash Nath Katju',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/c/ca/Kailash_Nath_Katju.jpg',
      'tenure': '21 Jun 1948-\n01 Nov 1951',
      'party': 2
    },
    {
      'name': 'H.C Mukherjee',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '01 Nov 1951-\n08 Aug 1956',
      'party': 3
    },
    {
      'name': 'P.B Chakravartti',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '08 Aug 1956-\n02 Nov 1956',
      'party': 4
    },
    {
      'name': "Padmaja Naidu",
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '03 Nov 1956-\n01 Jun 1967',
      'party': 5
    },
    {
      'name': 'Dharma Vira',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '01 Jun 1967-\n01 Apr 1969',
      'party': 6
    },
    {
      'name': "Shanti Swaroop Dhavan",
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '19 Sep 1969-\n21 Aug 1971',
      'party': 7
    },
    {
      'name': 'Anthony Lancelot Dias',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '21 Aug 1971-\n06 Nov 1979',
      'party': 8
    },
    {
      'name': "Tribhuvan Narain Singh",
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '06 Nov 1979-\n12 Sep 1981',
      'party': 9
    },
    {
      'name': 'Bhairab Dutt Pande',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '12 Sep 1981-\n10 Oct 1983',
      'party': 10
    },
    {
      'name': "Anant Sharma",
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '10 Oct 1983-\n16 Aug 1984',
      'party': 11
    },
    {
      'name': 'Satish Chandra',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '16 Aug 1984-\n01 Oct 1984',
      'party': 12
    },
    {
      'name': 'Uma Shankar Dikshit',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '01 Oct 1984-\n12 Aug 1986',
      'party': 13
    },
    {
      'name': 'Saiyid Nurul Hasan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Saiyid_Nurul_Hasan_16.jpg/220px-Saiyid_Nurul_Hasan_16.jpg',
      'tenure': '12 Aug 1986-\n20 Mar 1989',
      'party': 14
    },
    {
      'name': 'T. V. Rajeswar',
      'image':
      'https://alchetron.com/cdn/t-v-rajeswar-ce86f6a1-2195-4f7a-a402-bc85d7ba183-resize-750.jpeg',
      'tenure': '20 Mar 1989-\n07 Feb 1990',
      'party': 15
    },
    {
      'name': 'Saiyid Nurul Hasan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Saiyid_Nurul_Hasan_16.jpg/220px-Saiyid_Nurul_Hasan_16.jpg',
      'tenure': '07 Feb 1990-\n12 Jul 1993',
      'party': 16
    },
    {
      'name': 'B.Satya Narayan Reddy',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '13 Jul 1993-\n14 Aug 1993',
      'party': 17
    },
    {
      'name': 'K.V.Raghunatha Reddy',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '14 Aug 1993\n27 Apr 1998',
      'party': 18
    },
    {
      'name': 'Akhlaqur Rahman Kidwai',
      'image':
      'https://thumbs.dreamstime.com/b/photo-not-available-icon-isolated-white-background-your-web-mobile-app-design-133861179.jpg',
      'tenure': '27 Apr 1998\n18 May 1999',
      'party': 19
    },
    {
      'name': 'Shyamal Kumar Sen',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Shyamal_Kumar_Sen_-_Kolkata_2012-10-03_0512.JPG/220px-Shyamal_Kumar_Sen_-_Kolkata_2012-10-03_0512.JPG',
      'tenure': '18 May 1999\n04 Dec 1999',
      'party': 20
    },
    {
      'name': 'Viren J.Shah',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Viren_J_Shah_-_Kolkata_2004-05-02_1366.jpg/220px-Viren_J_Shah_-_Kolkata_2004-05-02_1366.jpg',
      'tenure': '04 Dec 1999\n14 Dec 2004',
      'party': 21
    },
    {
      'name': 'Gopalkrishna Gandhi',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Gopalkrishna_Gandhi_-_Chatham_House_2010.jpg/220px-Gopalkrishna_Gandhi_-_Chatham_House_2010.jpg',
      'tenure': '14 Dec 2004\n24 Dec 2009',
      'party': 22
    },
    {
      'name': 'Devanand Konwar',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Pranab_Mukherjee_attending_the_Launching_Ceremony_of_Agriculture_Road_Map_of_Bihar_%282012-2017%29%2C_at_Patna%2C_in_Bihar._The_Governor_of_Bihar%2C_Shri_Devanand_Konwar_and_the_Chief_Minister_of_Bihar%2C_Shri_Nitish_Kumar_are_also_seen_%28cropped%29.jpg/220px-thumbnail.jpg',
      'tenure': '14 Dec 2009\n23 Jan 2010',
      'party': 23
    },
    {
      'name': 'M.K.Narayanan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Mayankote_Kelath_Narayanan_-_Kolkata_2013-01-07_2702_Cropped.JPG/220px-Mayankote_Kelath_Narayanan_-_Kolkata_2013-01-07_2702_Cropped.JPG',
      'tenure': '24 Jan 2010\n23 Jun 2014',
      'party': 24
    },
    {
      'name': 'D.Y.Patil',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Shri_D.Y._Patil_%28cropped%2C_3x4%29.jpg/220px-Shri_D.Y._Patil_%28cropped%2C_3x4%29.jpg',
      'tenure': '03 Jul 2014\n17 Jul 2014',
      'party': 25
    },
    {
      'name': 'Keshari Nath Tripathi',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Keshari_Nath_Tripathi_-_Kolkata_2016-07-01_5591.JPG/220px-Keshari_Nath_Tripathi_-_Kolkata_2016-07-01_5591.JPG',
      'tenure': '24 Jul 2014\n29 Jul 2019',
      'party': 26
    },
    {
      'name': 'Jagdeep Dhankhar',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Governor_Jagdeep_Dhankhar.jpg/220px-Governor_Jagdeep_Dhankhar.jpg',
      'tenure': '30 Jul 2019\n17 Jul 2022',
      'party': 27
    },
    {
      'name': 'La. Ganesan',
      'image':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/La_Ganesan_Ji_%28cropped%29.jpg/220px-La_Ganesan_Ji_%28cropped%29.jpg',
      'tenure': '18 Jul 2022\nINCUMBENT*',
      'party': 28
    },
  ];

  //add to database function
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection('Govern').add(element);
  //   }
  //   print('all data added');
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   addData();
  // }

  final List<String> _listLink = [
    "https://en.wikipedia.org/wiki/C._Rajagopalachari",
    "https://en.wikipedia.org/wiki/Kailash_Nath_Katju",
    "https://en.wikipedia.org/wiki/Harendra_Coomar_Mookerjee",
    "https://en.wikipedia.org/wiki/Phani_Bhusan_Chakravartti",
    "https://en.wikipedia.org/wiki/Padmaja_Naidu",
    "https://en.wikipedia.org/wiki/Dharma_Vira",
    "https://en.wikipedia.org/wiki/Shanti_Swaroop_Dhavan",
    "https://en.wikipedia.org/wiki/Anthony_Lancelot_Dias",
    "https://en.wikipedia.org/wiki/Tribhuvan_Narain_Singh",
    "https://en.wikipedia.org/wiki/B._D._Pande",
    "https://en.wikipedia.org/wiki/Anant_Sharma",
    "https://en.wikipedia.org/wiki/Satish_Chandra_(politician)",
    "https://en.wikipedia.org/wiki/Uma_Shankar_Dikshit",
    "https://en.wikipedia.org/wiki/Saiyid_Nurul_Hasan",
    "https://en.wikipedia.org/wiki/T._V._Rajeswar",
    "https://en.wikipedia.org/wiki/Saiyid_Nurul_Hasan",
    "https://en.wikipedia.org/wiki/B._Satya_Narayan_Reddy",
    "https://en.wikipedia.org/wiki/K._V._Raghunatha_Reddy",
    "https://en.wikipedia.org/wiki/Akhlaqur_Rahman_Kidwai",
    "https://en.wikipedia.org/wiki/Shyamal_Kumar_Sen",
    "https://en.wikipedia.org/wiki/Viren_J._Shah",
    "https://en.wikipedia.org/wiki/Gopalkrishna_Gandhi",
    "https://en.wikipedia.org/wiki/Devanand_Konwar",
    "https://en.wikipedia.org/wiki/M._K._Narayanan",
    "https://en.wikipedia.org/wiki/D._Y._Patil",
    "https://en.wikipedia.org/wiki/Keshari_Nath_Tripathi",
    "https://en.wikipedia.org/wiki/Jagdeep_Dhankhar",
    "https://en.wikipedia.org/wiki/La._Ganesan"
  ];

  _launchUrl(index) async {
    if (await canLaunch(_listLink[index])) {
      await launch(_listLink[index]);
    } else {
      throw "Could not open $_listLink";
    }
  }

  _redirectLink()async{
    if (await canLaunch("https://en.wikipedia.org/wiki/West_Bengal")){
      await launch("https://en.wikipedia.org/wiki/West_Bengal");
    }
    else {
      throw "Could not open Requested URL";
    }
  }

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

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50,),
        child: FloatingActionButton(
            heroTag: "one",
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchGovern()));
            },
            mini: true,
            disabledElevation: 5,
            clipBehavior: Clip.hardEdge,
            backgroundColor: Colors.red.shade50,
            child: const Icon(Icons.search_sharp,color: Colors.black,)
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade400.withOpacity(0.45),
        automaticallyImplyLeading: false,
        title: Text(
          "Governor Catalogue",
          style: GoogleFonts.alata(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, colors: [
              Colors.greenAccent.shade400.withOpacity(0.45),
              Colors.greenAccent.shade400.withOpacity(0.5),
              Colors.greenAccent.shade400.withOpacity(0.40),
              Colors.greenAccent.shade400.withOpacity(0.42)
            ])),
        child: StreamBuilder<QuerySnapshot>(
            stream: db.collection('Govern').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.redAccent,
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
                              maxLines: 3,
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
                            radius: 30,
                            backgroundImage: NetworkImage(
                              _userProfile[index]['image'],
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: _redirectLink,
                            child: const Image(
                              image: AssetImage('assest/images/home_Image/WbEmb.png'),fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          )
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
  final  profile =
  FirebaseFirestore.instance.collection('Govern').orderBy('party',descending: false);

  Future getUser() async {
    List itemsList = [];
    try {
      await profile.get().then((querySnapShot) => {
        querySnapShot.docs.forEach((element) {
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
