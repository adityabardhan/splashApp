// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class  SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String name = "";
  late Stream streamQuery;
  List _userProfile = [];

  final List _list = [
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
    if (await canLaunch(_list[index])) {
      await launch(_list[index]);
    } else {
      throw "Could not open $_list";
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
                      hintText: 'Search Data..',hintStyle: const TextStyle(color: Colors.black87,fontFamily: "Roboto")),
                  onChanged: (value){
                    setState(() {
                      name = value;
                      streamQuery = FirebaseFirestore.instance.collection('CM')
                          .where('name', isGreaterThanOrEqualTo: name)
                          .where('name', isLessThan: '${name}z')
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
            stream: FirebaseFirestore.instance.collection('CM').snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                  itemCount: _userProfile.length,
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
  final pro_file = FirebaseFirestore.instance
      .collection('CM').orderBy('id',descending: false).get();

  Future getUserInfo() async {
    List itemsList = [];
    try {
      await pro_file.then((querySnapShot) => {
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
