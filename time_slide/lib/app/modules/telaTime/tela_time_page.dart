import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:time_slide/app/modules/utils/utils.dart';
import 'tela_time_controller.dart';
import 'package:intl/intl.dart';

class TelaTimePage extends StatefulWidget {
  final String title;
  const TelaTimePage({Key key, this.title = "TelaTime"}) : super(key: key);

  @override
  _TelaTimePageState createState() => _TelaTimePageState();
}

class _TelaTimePageState
    extends ModularState<TelaTimePage, TelaTimeController> {
  int totalSegundos = 0;
  int totalSegundosRegressivo = 0;
  Duration tempo;
  int index = 1;
  bool value_color = true;

  bool controler = true;

  @override
  void initState() {
    totalSegundos = listarSlide.elementAt(0).totalSegundos;
    totalSegundosRegressivo = listarSlide.elementAt(0).totalSegundos;
    tempo = Duration(seconds: listarSlide.elementAt(0).totalSegundos);

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (controler) {
        setState(() {
          cronometro();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Slide $index/${listarSlide.length}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: value_color ? Colors.green : Colors.red,
              fontSize: 45,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 45,
          ),
          Center(
            child: CircularPercentIndicator(
              radius: 250.0,
              lineWidth: 30.0,
              percent: (totalSegundos / totalSegundosRegressivo) < 0
                  ? 0
                  : (totalSegundos / totalSegundosRegressivo),
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animateFromLastPercent: true,
              addAutomaticKeepAlive: true,
              reverse: true,
              center: new Text(
                "${Duration(seconds: totalSegundos).toString().substring(2, 7)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: value_color ? Colors.green : Colors.red,
                  fontSize: 45,
                ),
              ),
              progressColor: value_color ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: value_color ? Colors.green : Colors.red,
        child: Icon(Icons.stop),
        onPressed: () {
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Deseja Finalizar?'),
              actions: [
                CupertinoButton(
                  color: Colors.red,
                  child: Text('Não'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoButton(
                  color: Colors.green,
                  child: Text('Sim'),
                  onPressed: () {
                    listarSlide.clear();
                    Modular.to.pushReplacementNamed('/');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // cronometro
  cronometro() {
    if (totalSegundos == 0 && index == listarSlide.length) {
      controler = false;
      print('Apresentação finalizado');
      Modular.to.pushReplacementNamed('finalizar');
    }

    if (totalSegundos == 0) {
      totalSegundos = listarSlide.elementAt(index).totalSegundos;
      totalSegundosRegressivo = listarSlide.elementAt(index).totalSegundos;
      tempo = Duration(seconds: listarSlide.elementAt(index).totalSegundos);
      if (index <= listarSlide.length) {
        index++;
      }
    }

    if (Duration(seconds: totalSegundos).inSeconds <= 10) {
      value_color = false;
    } else {
      value_color = true;
    }
    totalSegundos--;
  }
}
