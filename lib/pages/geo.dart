import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Animation/FadeAnimation.dart';

class Geography extends StatefulWidget {
  const Geography({Key? key}) : super(key: key);

  @override
  State<Geography> createState() => _GeographyState();
}

class _GeographyState extends State<Geography> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5,bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                child: InkWell(
                  onTap: () => _launchMapsUrl(22.5726, 88.3639),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assest/images/home_Image/West_Geo.svg.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              FadeAnimation(1.5,  Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("West Bengal is on the eastern bottleneck of India, stretching from the Himalayas in the north to the Bay of Bengal in the south. It lies between 85 degree 50 minutes and 89 degree 50 minutes east longitude, and 21 degrees 25 minutes and 27 degrees 13 minutes north latitude. The state has a total area of 88,752 square kilometres (34,267 sq mi).\nWith Bangladesh, which lies on its eastern border, the state forms the ethno-linguistic region of Bengal. To its northeast lies the states of Assam and Sikkim and the country Bhutan, and to its southwest, the state of Odisha.\nTo the west it borders the state of Jharkhand and Bihar, and to the northwest, Nepal. The capital of the state is Kolkata, the third-largest urban agglomeration and the seventh-largest city in India.",
                style: GoogleFonts.assistant(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ))
              // SizedBox(
              //   height: 30,
              //   child: Material(
              //     child: InkWell(
              //       onTap: () => _launchMapsUrl(22.334916, 79.478055),
              //       child: ClipRect(
              //         child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/India_West_Bengal_locator_map.svg/800px-India_West_Bengal_locator_map.svg.png',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      )
    );
  }
}

void _launchMapsUrl(double lat, double lon) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}