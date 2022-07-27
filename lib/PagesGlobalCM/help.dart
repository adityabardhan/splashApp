import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/Animation/FadeAnimation.dart';

class HelPage extends StatefulWidget {
  const HelPage({Key? key}) : super(key: key);

  @override
  State<HelPage> createState() => _HelPageState();
}

class _HelPageState extends State<HelPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         Padding(
          padding: const EdgeInsets.only(top: 50),
          child: FadeAnimation(1.5,
            Text("Facts about Chief Minister",style: GoogleFonts.imbue(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)
        ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 20),
          margin: const EdgeInsets.only(bottom: 80),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15)),
          child: FadeAnimation(1.8,
            Center(
              child: Text(
                  "The oath of office :\nI, do swear in the name of God/solemnly affirm that I will bear true faith and allegiance to the Constitution of India as by law established, that I will uphold the sovereignty and integrity of India, that I will faithfully and conscientiously discharge my duties as a Minister for the State of and that I will do right to all manner of people in accordance with the Constitution and the law without fear or favour, affection or ill-will.\n\nThe oath of secrecy :\n"
                      "I, <Name of Minister>, do swear in the name of God/solemnly affirm that I will not directly or indirectly communicate or reveal to any person or persons any matter which shall be brought under my consideration or shall become known to me as a Minister for the State of <Name of the State> except as may be required for the due discharge of my duties as such Minister.\n\n Eligibility :\n"
                      "The Constitution of India sets the principle qualifications one must meet to be eligible to the office of chief minister. A chief minister must be:\n"
                      "-> a citizen of India.\n"
                      "-> should be a member of the state legislature\n"
                      "-> of 25 years of age or more\n"
                      "An individual who is not a member of the legislature can be considered the chief minister provided they get themselves elected to the State Legislature within six months from the date of their appointment. Failing which, they would cease to be the chief minister.",
              textAlign: TextAlign.justify ,style: GoogleFonts.ibmPlexSansThai(fontSize: 15,color: Colors.black87),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
