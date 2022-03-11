import 'package:flutter/material.dart';

class Version extends StatefulWidget {
  @override
  _VersionState createState() => _VersionState();
}

class _VersionState extends State<Version> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' NewsPage'),
      ),
      body: Column(children: [
        Text('email'),
      ]),
    );
  }
}
