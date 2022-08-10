import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/Animation/FadeAnimation.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: FadeAnimation(0.8,
            Text("Facts about Governor of a State",style: GoogleFonts.imbue(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)
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
          child: FadeAnimation(1.0,
            Center(
              child: Text(
                "The Governor is the head of a state just like the President is the head of the republic. The Governor is the nominal head of a state, while the Chief Minister is the executive head. All executive actions of the state are taken in the name of the Governor.\n"
                    "The first woman to become a Governor of a state in India was Sarojini Naidu. She was the Governor of Uttar Pradesh from 15 August 1947 till her demise on 2 March 1949.\n"
                    "The monthly salary of a Governor is Rs 1,10,00 ¢, as specified in the Governor’s Act of 1982. The Governor is also entitled to certain benefits and allowances, which shall not be diminished during his office term of five years.\n"
                    "In case no political party bags a majority in the Vidhan Sabha of the state, the Governor holds the power to use his discretion to select the Chief Minister.\n"
                    "The Governor lays before the State Legislature, the annual financial statement and also makes demands for grants and recommendation of ‘Money Bills’.\n"
                    "The Governor is appointed by the President of India with the following eligibility criteria:\n"
                    "-> He or she must be a citizen of India.\n"
                    "-> He or she must have completed 35 years of age.\n"
                    "-> He or she must not hold any other office of profit.\n"
                    "-> He or she must not be a member of the Legislature of the Union or of any other state.\n"
,                textAlign: TextAlign.justify ,style: GoogleFonts.ibmPlexSansThai(fontSize: 15,color: Colors.black87),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
