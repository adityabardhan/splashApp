import 'package:flutter/material.dart';

class Facts extends StatefulWidget {
  const Facts({Key? key}) : super(key: key);

  @override
  State<Facts> createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Facts list"),
      ),
    );
  }
}
