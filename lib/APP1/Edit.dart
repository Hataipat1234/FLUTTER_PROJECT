import 'package:flutter/material.dart';

class Version extends StatefulWidget {
  const Version({Key key}) : super(key: key);

  @override
  _VersionWidgetState createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<Version> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      key: scaffoldKey,
      backgroundColor: Color(0xFFCCCACA),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.04, -0.33),
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.24, 5.39),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, -0.28),
                child: Text(
                  'VERSION1.0.0.0',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
