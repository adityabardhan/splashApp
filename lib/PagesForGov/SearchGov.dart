import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class  SearchGovern extends StatefulWidget {
  const SearchGovern({Key? key}) : super(key: key);

  @override
  State<SearchGovern> createState() => SearchGovernState();
}

class SearchGovernState extends State<SearchGovern> {
  String name = "";
  late Stream streamQuery;
  List _userProfile = [];

  final List _list = [
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
                      streamQuery = FirebaseFirestore.instance.collection('Govern')
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
            stream: FirebaseFirestore.instance.collection('Govern').snapshots(),
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
                      return ListTile(
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
                      );
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
                          // trailing: Text(
                          //   _userProfile[index]['party'],
                          //   style: const TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 12,
                          //   ),
                          // ),
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
  final  profile =
  FirebaseFirestore.instance.collection('Govern').orderBy('party',descending: false);

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