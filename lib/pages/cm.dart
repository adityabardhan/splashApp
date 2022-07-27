import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/PagesGlobalCM/search.dart';
import 'package:url_launcher/url_launcher.dart';

class ChiefMin extends StatefulWidget {
  const ChiefMin({Key? key}) : super(key: key);

  @override
  State<ChiefMin> createState() => _ChiefMinState();
}

class _ChiefMinState extends State<ChiefMin> {

  // List<Map<String, dynamic>> data = [
  //   {
  //     'name': 'Bidhan Chandra Roy',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/6/6d/Dr._Bidhan_Chandra_Roy_in_1943_%28cropped%29.jpg',
  //     'tenure': '26 Jan 1950-\n01 Jul 1962',
  //     'party': 'Indian National Congress'
  //   },
  //   {
  //     'name': 'Prafulla Chandra Sen',
  //     'image':
  //     'https://dailyasianage.com/library/2018/09/24/1537815765_2.jpg',
  //     'tenure': '09 Jul 1962-\n28 Feb 1967',
  //     'party': 'Indian National Congress'
  //   },
  //   {
  //     'name': 'Ajoy Kumar Mukherjee',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/f/f5/Ajoy_Mukherjee.jpg',
  //     'tenure': '01 Mar 1967-\n21 Nov 1967',
  //     'party': 'Bangla Congress (United Front)'
  //   },
  //   {
  //     'name': 'Prafulla Chandra Ghosh',
  //     'image':
  //     'https://www.veethi.com/images/people/profile/Prafulla_Chandra_Ghosh.jpeg',
  //     'tenure': '21 Nov 1967-\n19 Feb 1968',
  //     'party': 'Independent (Progressive Democratic Front)'
  //   },
  //   {
  //     'name': "Vacant (President's Rule)",
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/5/55/Emblem_of_India.svg',
  //     'tenure': '20 Feb 1968-\n25 Feb 19169',
  //     'party': 'NA (Dissolved)'
  //   },
  //   {
  //     'name': 'Ajoy Kumar Mukherjee',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/f/f5/Ajoy_Mukherjee.jpg',
  //     'tenure': '25 Feb 1969-\n16 Mar 1970',
  //     'party': 'Bangla Congress (United Front)'
  //   },
  //   {
  //     'name': "Vacant (President's Rule)",
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/5/55/Emblem_of_India.svg',
  //     'tenure': '19 Mar 1970-\n02 Apr 1971',
  //     'party': 'NA (Dissolved)'
  //   },
  //   {
  //     'name': 'Ajoy Kumar Mukherjee',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/f/f5/Ajoy_Mukherjee.jpg',
  //     'tenure': '02 Apr 1971-\n28 Jun 1971',
  //     'party': 'Indian National Congress'
  //   },
  //   {
  //     'name': "Vacant (President's Rule)",
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/5/55/Emblem_of_India.svg',
  //     'tenure': '29 Jun 1971-\n20 Mar 1972',
  //     'party': 'NA (Dissolved)'
  //   },
  //   {
  //     'name': 'Siddhartha Shankar Ray',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/e/e1/Siddhartha_Shankar_Ray.png',
  //     'tenure': '20 Mar 1972-\n30 Apr 1977',
  //     'party': 'Indian National Congress'
  //   },
  //   {
  //     'name': "Vacant (President's Rule)",
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/5/55/Emblem_of_India.svg',
  //     'tenure': '30 Apr 1977-\n20 Jun 1977',
  //     'party': 'NA (Dissolved)'
  //   },
  //   {
  //     'name': 'Jyoti Basu',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/commons/e/e1/Siddhartha_Shankar_Ray.png',
  //     'tenure': '21 Jun 1977-\n05 Nov 2000',
  //     'party': 'Communist Party of India (Marxist)'
  //   },
  //   {
  //     'name': 'Buddhadeb Bhattacharya',
  //     'image':
  //     'https://upload.wikimedia.org/wikipedia/en/b/b3/BuddhoBabu.jpg',
  //     'tenure': '06 Nov 2000-\n13 May 2011',
  //     'party': 'Communist Party of India (Marxist)'
  //   },
  //   {
  //     'name': 'Mamta Banarjee',
  //     'image':
  //     'https://c.ndtvimg.com/2022-03/socaa9ug_mamata-banerjee-ani-240_625x300_09_March_22.jpeg',
  //     'tenure': '20 May 2011-\nIncumbent*',
  //     'party': 'All India Trinamool Congress'
  //   }
  // ];
  //
  // add to database function
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection('CM').add(element);
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
    "https://en.wikipedia.org/wiki/Bidhan_Chandra_Roy",
    "https://en.wikipedia.org/wiki/Prafulla_Chandra_Sen",
    "https://en.wikipedia.org/wiki/Ajoy_Mukherjee",
    "https://en.wikipedia.org/wiki/Prafulla_Chandra_Ghosh",
    "https://en.wikipedia.org/wiki/President%27s_rule",
    "https://en.wikipedia.org/wiki/Ajoy_Mukherjee",
    "https://en.wikipedia.org/wiki/President%27s_rule",
    "https://en.wikipedia.org/wiki/Ajoy_Mukherjee",
    "https://en.wikipedia.org/wiki/President%27s_rule",
    "https://en.wikipedia.org/wiki/Siddhartha_Shankar_Ray",
    "https://en.wikipedia.org/wiki/President%27s_rule",
    "https://en.wikipedia.org/wiki/Jyoti_Basu",
    "https://en.wikipedia.org/wiki/Buddhadeb_Bhattacharjee",
    "https://en.wikipedia.org/wiki/Mamata_Banerjee"
  ];

  _launchUrl(index) async {
    if (await canLaunch(_listLink[index])) {
      await launch(_listLink[index]);
    } else {
      throw "Could not open $_listLink";
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
        padding: EdgeInsets.only(bottom: 50,),
        child: FloatingActionButton(
          heroTag: "one",
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
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
          "CM CATALOGUE",
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
            stream: db.collection('CM').snapshots(),
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
  final  profile =
      FirebaseFirestore.instance.collection('CM').orderBy('id',descending: false);

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
