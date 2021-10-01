import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer/model/count.dart';
import 'package:timer/widget/inidacdor.dart';
import 'package:timer/widget/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Count count = Count("0", 1.0);
  Timer? timer;
  late int stop;
  late int countTime;

  String startStopLabel = "Iniciar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Timer"),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Colors.black12,
                      onPressed: () {
                        stop = 30;
                        countTime = 0;
                        start();
                      },
                      text: "30 segundos",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.black26,
                      onPressed: () {
                        stop = 60;
                        countTime = 0;
                        start();
                      },
                      text: "1 minuto",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.black38,
                      onPressed: () {
                        stop = 120;
                        countTime = 0;
                        start();
                      },
                      text: "2 minutos",
                    )),
                  ],
                ),
                Expanded(
                    child: Indicador(
                  count,
                )),
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Colors.lightGreen,
                      onPressed: timer == null ? null : startStop,
                      text: startStopLabel,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Colors.redAccent,
                      onPressed: timer == null ? null : reset,
                      text: "Reiniciar",
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  start() {
    startStopLabel = "Parar";
    if (timer != null) timer!.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (time) {
      countTime++;
      setState(() {
        count.tag = countTime.toString();
        count.percert = countTime / stop;
      });

      if (countTime >= stop) {
        time.cancel();
        setState(() {
          startStopLabel = "Parar";
        });
      }
    });
  }

  startStop() {
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        setState(() {
          startStopLabel = "Iniciar";
        });
      } else {
        start();
      }
    }
  }

  reset() {
    if (timer != null) {
      countTime = 0;
      start();
    }
  }
}
