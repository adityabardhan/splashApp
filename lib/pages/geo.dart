import 'package:flutter/material.dart';

class Geography extends StatefulWidget {
  const Geography({Key? key}) : super(key: key);

  @override
  State<Geography> createState() => _GeographyState();
}

class _GeographyState extends State<Geography> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Geography list"),
      ),
    );
  }
}
