import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class  SearchPM extends StatefulWidget {
  const SearchPM({Key? key}) : super(key: key);

  @override
  State<SearchPM> createState() => SearchPMState();
}

class SearchPMState extends State<SearchPM> {
  String name = "";
  late Stream streamQuery;
  List _userProfile = [];

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


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    dynamic result = await DataBaseManager().getUserInfo();
    if (result == null) {
      if (kDebugMode) {
        print("Unable to Load");
      }
    } else {
      setState(() {
        _userProfile = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red.shade200.withOpacity(0.50),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade700),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.black),
                      //   borderRadius: BorderRadius.circular(20.0),
                      // ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search_rounded,color: Colors.black.withOpacity(0.6),),
                      hintText: 'Search Data..',hintStyle: TextStyle(color: Colors.black87,fontFamily: "Roboto")),
                  onChanged: (value){
                    setState(() {
                      name = value;
                      streamQuery = FirebaseFirestore.instance.collection('PM')
                          .where('name', isGreaterThanOrEqualTo: name)
                          .where('name', isLessThan: name +'z')
                          .snapshots();
                    });
                  },
                ),
              ),
            )),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.red.shade200.withOpacity(0.50),
                Colors.redAccent.shade100.withOpacity(0.40),
                Colors.red.shade300.withOpacity(0.40),
                Colors.redAccent.shade200.withOpacity(0.40),
              ])),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('PM').snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    if (name.isEmpty) {
                      return Container();
                      // return ListTile(
                      //   //onTap: ()=>_launchUrl(index),
                      //   horizontalTitleGap: 20,
                      //   title: Padding(
                      //     padding: const EdgeInsets.only(bottom: 5),
                      //     child: Text(
                      //       _userProfile[index]['name'],
                      //       maxLines: 3,
                      //       style: const TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.w300),
                      //     ),
                      //   ),
                      //   subtitle: Text(
                      //     _userProfile[index]['tenure'],
                      //     maxLines: 2,
                      //     style: const TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 11,
                      //     ),
                      //   ),
                      //   leading: CircleAvatar(
                      //     radius: 30,
                      //     backgroundImage: NetworkImage(
                      //       _userProfile[index]['image'],
                      //     ),
                      //   ),
                      //   trailing: Text(
                      //     _userProfile[index]['party'],
                      //     style: const TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 12,
                      //     ),
                      //   ),
                      // );
                    }
                    if (_userProfile[index]['name']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Colors.amberAccent),
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
                    }
                    return Container();
                  });
            },
          ),
        ));
  }
}

class DataBaseManager {
  final profile = FirebaseFirestore.instance
      .collection('PM');

  Future getUserInfo() async {
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
