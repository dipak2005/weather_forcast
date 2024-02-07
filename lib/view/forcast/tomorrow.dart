// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Tomorrow extends StatefulWidget {
  const Tomorrow({super.key});

  @override
  State<Tomorrow> createState() => _TomorrowState();
}

class _TomorrowState extends State<Tomorrow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("hi"),
      ],
    );
  }
}
