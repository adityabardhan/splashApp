import 'package:flutter/material.dart';

class Governer extends StatefulWidget {
  const Governer({Key? key}) : super(key: key);

  @override
  State<Governer> createState() => _GovernerState();
}

class _GovernerState extends State<Governer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Governer list"),
      ),
    );
  }
}
