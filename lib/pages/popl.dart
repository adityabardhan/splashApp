import 'package:flutter/material.dart';

class Population extends StatefulWidget {
  const Population({Key? key}) : super(key: key);

  @override
  State<Population> createState() => _PopulationState();
}

class _PopulationState extends State<Population> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExpansionPanelList(

      ),
    );
  }
}
