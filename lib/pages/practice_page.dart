import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/api.dart';
import 'package:hexcolor/hexcolor.dart';

class PracticePage  extends StatelessWidget {
  const PracticePage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: API(),
      ),
    );
  }
}




