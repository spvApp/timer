import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timer/model/count.dart';

class Indicador extends StatelessWidget {
  final Count count;

  const Indicador(this.count) : super();

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 5.0,
      percent: count.percert,
      center: new Text(
        "${count.tag} seg",
        style: TextStyle(fontSize: 25),
      ),
      progressColor: Colors.purple,
    );
  }
}
